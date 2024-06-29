import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:graphql_flutter/graphql_flutter.dart";
import "package:jitta_ranking/config/graphql_configuration.dart";
import "package:jitta_ranking/controllers/getx_internet_connectivity/connection_manager_controller.dart";
import "package:jitta_ranking/controllers/getx_internet_connectivity/helper.dart";
// import "package:jitta_ranking/config/query_mutation.dart";
import "package:jitta_ranking/controllers/stock_controller.dart";
import "package:jitta_ranking/utils/button_utils.dart";
import "package:jitta_ranking/utils/dialog_alert.dart";
import "package:jitta_ranking/utils/dropdown_utils.dart";
import "package:jitta_ranking/utils/standard_widget.dart";
import "package:jitta_ranking/utils/style_css.dart";
import "package:jitta_ranking/view/stock_detail.dart";
import "package:oktoast/oktoast.dart";

class StocksPage extends StatefulWidget{
  const StocksPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _StocksPage();
  }

}

class _StocksPage extends State<StocksPage> {
  late ScrollController scrollController;
  final stockController = Get.put(StockController());
  final _connectManager = Get.put(ConnectionManagerController());
  // int page = 0;
  // int limit = 10;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController(initialScrollOffset: 0);
    stockController.loadWidget(context);

    // stockController.fetchSectors();
    // stockController.fetchStocklist(stockController.sMarket,stockController.radioSectors,stockController.page.value,stockController.limit.value,true);


  }
  @override
  void dispose() {
    // networkConnectivity.disposeStream();
    // _connectivitySubscription.cancel();
    super.dispose();
  }

  Widget _HeadviewBuilder(BuildContext ctx) {
        return Container(
          child:  Row(
            children: [
              Expanded(
                // margin: const EdgeInsets.fromLTRB(10,10,10,0),
                // width: double.infinity,
                // height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: stockController.page.value <= 0 ? Colors.grey.shade700 : Colors.indigo.shade500,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    textStyle: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    stockController.page.value <= 0 ?
                    null:
                    stockController.page.value -- ;
                    stockController.fetchStocklist(stockController.sMarket,stockController.radioSectors,stockController.page.value,stockController.limit.value,false);
                  },
                  child: const Text("< Previous", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'tsn'),),
                ),
              ),

              const SizedBox(width: 10,),
              Expanded(
                // margin: const EdgeInsets.fromLTRB(10,10,10,0),
                // width: double.infinity,
                // height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade700,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    textStyle: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    stockController.page.value ++;
                    stockController.fetchStocklist(stockController.sMarket,stockController.radioSectors,stockController.page.value,stockController.limit.value,false);

                  },
                  child: const Text("Next >", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'tsn'),),
                ),
              ),
            ],
          ),
        );
  }
  Widget _ListviewBuilder(BuildContext ctx) {
    return Container(
      child:  Obx((){
        if(stockController.stockModel.value.jittaRanking != null){
          return Container(
            padding: EdgeInsets.only(top: 25.0),
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: stockController.stockModel.value.jittaRanking!.data!.length,
                itemBuilder: (context, position) {
                  final stock = stockController.stockModel.value.jittaRanking!.data![position];
                  return Card(
                    shadowColor : Colors.indigo.shade900,
                    margin: const EdgeInsets.only(
                      top: 10,
                      right: 5,
                      left: 5,
                      bottom: 10,
                    ),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey.shade50),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: StandardWidget.selectListItem(
                      onTap: () async{
                        // if(_connectManager.connectionType.value == 0){
                        //   DialogAlert().warningAlertDialog("Cannot connect to server",context);
                        // }else {
                        //   Get.to(() => StocksDetailPage(id:   stock.id!.toString(), stockId: stock.stockId!));
                        // }
                        Get.to(() => StocksDetailPage(id:   stock.id!.toString(), stockId: stock.stockId!));
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            trailing: Icon(Icons.navigate_next),
                            leading: Text(stock.rank!.toString(),
                            style: TextStyle(color: Colors.blueAccent , fontSize: 18),
                          ),
                            title: Text(
                                stock.title!.toString(),
                                style: TextStyle(color: Colors.indigo.shade900 , fontSize: 18 )),
                            subtitle: Text(
                              stock.symbol!.toString(),
                              style: TextStyle(color: Colors.blueAccent , fontSize: 18),
                            ),
                          )
                        ],
                      ),
                    ),

                  );
                })
          );

        }else{
          return const Text("is empty");
        }
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GraphQLProvider(
      client: GraphQLConfiguration.client,
      child: CacheProvider(
          child:   Scaffold(
        appBar: AppBar(
          title: Text("Jitta Ranking"),
        ),
        body:    StandardWidget.bg(
          width: MediaQuery.of(context).size.width,
          scrollController: scrollController,
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child:const Text("แสดงจำนวนข้อมูล", style: TextStyle(fontSize: 16, fontFamily: 'tsn'),),
                    ),
                    Expanded(
                      flex: 3,
                      child: DropDownCustom.dropDownStdFormSInt(
                        items: stockController.llimitData,
                        valDrop: stockController.limit.value,
                        onChange: (val) => stockController.onChangeLimit(val: val, context: context),
                      ),
                    ),
                  ],
                ),
                StyleCss.h10,
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: const Text("Markets", style: TextStyle(fontSize: 16, fontFamily: 'tsn'),),
                    ),
                    Expanded(
                      flex: 3,
                      child: DropDownCustom.dropDownStdFormString(
                        items: stockController.lMarketDD,
                        valDrop: stockController.sMarket,
                        onChange: (val) => stockController.onChangeMarket(val: val, context: context),
                      ),
                    ),
                  ],
                ),
                StyleCss.h10,
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: const Text("Sectors", style: TextStyle(fontSize: 18, fontFamily: 'tsn'),),),
                    Expanded(
                      flex: 3,
                      child: customElevatedButton(
                        onTap: () => stockController.onFilter1(context,"Type of Sectors"),
                        ctrl: stockController.txtSectors,
                        focusNode: stockController.fnSectors,
                      ),),
                  ],
                ),

                StyleCss.h10,
                _HeadviewBuilder(context),
                _ListviewBuilder(context),
              ],
            ),
          ),
        ),

      )),

    );
  }
}