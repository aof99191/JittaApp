import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:jitta_ranking/config/const.dart';
import 'package:jitta_ranking/config/graphql_configuration.dart';
import 'package:jitta_ranking/controllers/stock_detail_controller.dart';
import 'package:jitta_ranking/utils/standard_widget.dart';
import 'package:jitta_ranking/utils/style_css.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:url_launcher/url_launcher.dart';


class StocksDetailPage extends StatefulWidget {
  String  id;
  int stockId;
  StocksDetailPage({super.key, required this.id, required this.stockId});

  @override
  State<StatefulWidget> createState() {
    return StocksDetailPageState();
  }
}

class StocksDetailPageState extends State<StocksDetailPage> {
  var detailController = Get.put(StockDetailController());
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController(initialScrollOffset: 0);
    detailController.loadWidget(context);
    detailController.fetchStockDetails( widget.id , widget.stockId);
  }


  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: GraphQLConfiguration.client,
      child: CacheProvider(
          child:   Scaffold(
            appBar: AppBar(
              title: Text("Jitta Ranking"),
            ),
            body:  StandardWidget.bg(
              width: MediaQuery.of(context).size.width,
              scrollController: scrollController,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Obx((){
                  if(detailController.detailModel.value.stock != null){
                    double sumgrowth = detailController.detailModel.value.stock!.jitta!.factor!.last!.value!.growth!.value! / 100;
                    double sumrecent = detailController.detailModel.value.stock!.jitta!.factor!.last!.value!.recent!.value! / 100;
                    double sumfin = detailController.detailModel.value.stock!.jitta!.factor!.last!.value!.financial!.value! / 100;
                    double benefit = detailController.detailModel.value.stock!.jitta!.factor!.last!.value!.valueReturn!.value! / 100;
                    double management = detailController.detailModel.value.stock!.jitta!.factor!.last!.value!.management!.value! / 100;
                    return Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(detailController.detailModel.value.stock!.title!.toString(), style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                          Text('${detailController.detailModel.value.stock!.exchange!.toString()}:${detailController.detailModel.value.stock!.symbol!.toString()}', style: TextStyle(fontSize: 18)),
                          Text('Jitta Ranking #${detailController.detailModel.value.stock!.comparison!.market!.rank!.toString()} จาก ${detailController.detailModel.value.stock!.comparison!.market!.member!.toString()} ', style: TextStyle(fontSize: 16)),
                          StyleCss.h10,
                          Row(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                                alignment:Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text('score \n' + detailController.detailModel.value.stock!.jitta!.score!.last!.value!.toStringAsFixed(detailController.detailModel.value.stock!.jitta!.score!.last!.value!.truncateToDouble() == detailController.detailModel.value.stock!.jitta!.score!.last!.value! ? 0 : 2), style: TextStyle(color: Colors.white)),
                              ),
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('${detailController.detailModel.value.stock!.currencySign!.toString()}:${detailController.detailModel.value.stock!.price!.latest!.close!.toString()}', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                                  Text('ราคา ( ${Const.DATE_FORMAT.format(detailController.detailModel.value.stock!.price!.latest!.datetime!) } )', style: TextStyle(fontSize: 16)),
                                ],
                              )
                            ],
                          ),
                          StyleCss.h10,
                          StyleCss.h10,
                          //
                          //create line graph
                          _listlineGraphBuilder(context),
                          //
                          Text('Jitta Factors', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          StyleCss.h10,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('โอกาสในการเติบโตของธุรกิจ'),
                              Text(detailController.detailModel.value.stock!.jitta!.factor!.last!.value!.growth!.value!.toString(), style: TextStyle(fontSize: 16)),
                            ],
                          ),
                          LinearProgressIndicator(value: sumgrowth),
                          StyleCss.h10,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('ผลการดำเนินงานในปัจจุบัน'),
                              Text(detailController.detailModel.value.stock!.jitta!.factor!.last!.value!.recent!.value!.toString(), style: TextStyle(fontSize: 16)),
                            ],
                          ),
                          LinearProgressIndicator(value: sumrecent),
                          StyleCss.h10,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('ความแข็งแกร่งทางการเงิน'),
                              Text(detailController.detailModel.value.stock!.jitta!.factor!.last!.value!.financial!.value!.toString(), style: TextStyle(fontSize: 16)),
                            ],
                          ),
                          LinearProgressIndicator(value: sumfin),
                          StyleCss.h10,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('ผลตอบแทนแก่ผู้ถือหุ้น'),
                              Text(detailController.detailModel.value.stock!.jitta!.factor!.last!.value!.valueReturn!.value!.toString(), style: TextStyle(fontSize: 16)),
                            ],
                          ),
                          LinearProgressIndicator(value: benefit),
                          StyleCss.h10,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('ความได้เปรียบทางการแข่งขัน'),
                              Text(detailController.detailModel.value.stock!.jitta!.factor!.last!.value!.management!.value!.toString(), style: TextStyle(fontSize: 16)),
                            ],
                          ),
                          LinearProgressIndicator(value: management),
                          StyleCss.h10,

                          //Jitta Factors
                          Text('Jitta Signs', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          StyleCss.h10,
                          _listSignBuilder(context),
                          //
                          StyleCss.h10,
                          Text('ข้อมูลบริษัท', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          StyleCss.h6,
                          Text(detailController.detailModel.value.stock!.summary!.toString(), style: TextStyle(fontSize: 14)),
                          StyleCss.h16,
                          Text('เกี่ยวกับบริษัท', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          StyleCss.h8,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('กลุ่มอุตสาหกรรม', style: TextStyle(fontSize: 12)),
                            ],
                          ),
                          StyleCss.h8,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(detailController.detailModel.value.stock!.industry!.toString(),
                                  style: TextStyle(fontSize: 12)),
                            ],
                          ),
                          StyleCss.h8,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('หมวดธุรกิจ', style: TextStyle(fontSize: 14)),
                              Text(detailController.detailModel.value.stock!.sector!.name!.toString(), style: TextStyle(fontSize: 14)),
                            ],
                          ),
                          StyleCss.h16,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.link),
                              StyleCss.w8,
                              InkWell(
                                onTap: () async{
                                  launchInBrowser(detailController.detailModel.value.stock!.company!.link![0].url.toString());

                                  // final url = detailController.detailModel.value.stock!.company!.link![0].url.toString();
                                  // if (await canLaunch(url)) {
                                  // await launch(url, forceWebView: true, enableJavaScript: true);
                                  // } else {
                                  // throw 'Could not launch $url';
                                  // }
                                },
                                child:  Center(
                                    child: Text('เว็บไซต์บริษัท', style: TextStyle(fontSize: 14, color: Colors.blue))),
                              ),
                            ],
                          ),

                        ],
                      ),
                    );
                  }else{
                    return Text("Is empty");
                  }
                }),


              ),
            ),

          )),

    );
  }

  Widget _listlineGraphBuilder(BuildContext ctx) {
      return Container(
        //Initialize spark line chart
          child: Padding(
              padding: EdgeInsets.all(5),
              child: SfSparkLineChart.custom(
                axisLineWidth: 2,
                axisLineDashArray: <double>[5,3],
                axisCrossesAt: 174,
                dataCount: detailController.detailModel.value.stock!.jitta!.line!.values!.length,
                xValueMapper: (index) => detailController.detailModel.value.stock!.jitta!.line!.values![index].year,
                yValueMapper: (index) => detailController.detailModel.value.stock!.jitta!.line!.values![index].value,
              )
          ),
      );
  }
  Widget _listSignBuilder(BuildContext ctx) {
    return Container(
      child:  ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: detailController.detailModel.value.stock!.jitta!.sign!.last!.length,
        itemBuilder: (context, index) {
          final sign = detailController.detailModel.value.stock!.jitta!.sign!.last![index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: ExpansionTile(
              // leading: Container(
              //   width: 4,
              //   height: 40,
              //   color: sign['isPositive'] ? Colors.green : Colors.red,
              // ),
              title: Text(sign.title.toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              subtitle: Text(sign.value.toString(), style: TextStyle(fontSize: 14)),
              children: [
                // ListView.builder(
                //   shrinkWrap: true,
                //   physics: NeverScrollableScrollPhysics(),
                //   itemCount: detailController.detailModel.value.stock!.jitta!.sign!.last![index]!.display!.columnHead!.length,
                //   itemBuilder: (context, jdex) {
                //     final sign = detailController.detailModel.value.stock!.jitta!.sign!.last![index]!.display!.columnHead![jdex];
                //     return Card(
                //       margin: EdgeInsets.symmetric(vertical: 8.0),
                //       child:  Text(sign!.toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                //     );
                //   },
                // ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: detailController.detailModel.value.stock!.jitta!.sign!.last![index]!.display!.columns!.length,
                  itemBuilder: (context, jdex) {
                    final sign = detailController.detailModel.value.stock!.jitta!.sign!.last![index]!.display!.columns![jdex];
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      child: ExpansionTile(
                        title: Text(sign!.name!.toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: detailController.detailModel.value.stock!.jitta!.sign!.last![index]!.display!.columns![jdex].data!.length,
                            itemBuilder: (context, kdex) {
                              final sign = detailController.detailModel.value.stock!.jitta!.sign!.last![index]!.display!.columns![jdex].data![kdex];
                              final signHead = detailController.detailModel.value.stock!.jitta!.sign!.last![index]!.display!.columnHead![kdex];
                              return Card(
                                margin: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                                child:  Text(signHead+"     "+sign.toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              );
                            },
                          ),

                        ],
                      ),
                    );
                  },
                ),

              ],
            ),
          );
        },
      ),
    );

  }
  Future<void> launchInBrowser(String url) async {
    // if (!await launchUrl(
    //   url,
    //   mode: LaunchMode.externalNonBrowserApplication,
    // )) {
    //   throw 'Could not launch $url';
    // }

    // final url = detailController.detailModel.value.stock!.company!.link![0].url.toString();
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true, enableJavaScript: true);
    } else {
      throw 'Could not launch $url';
    }
  }

}