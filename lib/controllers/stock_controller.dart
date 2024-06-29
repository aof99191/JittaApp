import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
//import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:jitta_ranking/Database/dbStocklist.dart';
import 'package:jitta_ranking/config/data_drop_down_config.dart';
import 'package:jitta_ranking/config/graphql_configuration.dart';
import 'package:jitta_ranking/controllers/getx_internet_connectivity/connection_manager_controller.dart';
import 'package:jitta_ranking/models/sector_model.dart';
// import 'package:jitta_ranking/config/query_mutation.dart';
import 'package:jitta_ranking/models/stocklist_model.dart';
import 'package:jitta_ranking/config/readRepositories.dart' as queries;
import 'package:jitta_ranking/utils/dialog_alert.dart';
import 'package:jitta_ranking/utils/dialog_sector_dynamic.dart';
import 'package:jitta_ranking/utils/style_css.dart';
import 'package:oktoast/oktoast.dart';

class StockController extends GetxController {
  final _connectStock = Get.put(StockListDB());
  final _connectManager = Get.put(ConnectionManagerController());
  late BuildContext buildcontext;
  // GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  var stockModel = Stocklist().obs;
  var sectorModel = SectorList().obs;


  //focus node
  late FocusNode fnSectors ;
  //textbox
  late TextEditingController txtSectors ;
  String radioSectors = "CONSUMER_DISCRETIONARY";

  List<DataDDConfig> lMarketDD = [];
  String sMarket = 'TH';

  RxInt page = 0.obs;
  RxInt limit = 10.obs;
  List<DataNumberConfig> llimitData = [];

  Future<void> loadWidget(BuildContext context) async {
    this.buildcontext = context;
    txtSectors = TextEditingController();
    fnSectors = FocusNode();
    txtSectors.text = "CONSUMER DISCRETIONARY";
    radioSectors = "CONSUMER_DISCRETIONARY";

    lMarketDD = DataDDConfig.getDataMarket();
    llimitData = DataNumberConfig.getDAtaLimit();
    sMarket = 'TH';

    // await fetchSectors();
    // await fetchStocklist(sMarket,radioSectors,0,10);
    fetchSectors();
    fetchStocklist(sMarket,radioSectors,page.value,limit.value,false);


  }
  void onChangeMarket({String? val,BuildContext? context}) async {
    sMarket = val!;

    await fetchStocklist(sMarket,radioSectors,page.value,limit.value,false);

  }

  void onChangeLimit({int? val,BuildContext? context}) async {
    limit.value = val!;

    await fetchStocklist(sMarket,radioSectors,page.value,limit.value,false);

  }
  void onFilter1(BuildContext context,String sTitle) async {
    if(sectorModel.value!.listJittaSectorType != null){
      if(sectorModel.value!.listJittaSectorType!.length > 0){
        Map<String, dynamic>? mData = await showDialog(
            context: context,
            builder: (_) {
              return DialogSectorDynamic(
                  sTitle, radioSectors ,sectorModel.value.listJittaSectorType!
              );

            }
        );
        if (mData != null) {
          radioSectors = mData['value'];
          txtSectors.text = mData['display'];
          await fetchStocklist(sMarket,radioSectors,page.value,limit.value,false);
        }

      }
    }else {
      await showDialog(
          context: context,
          builder: (_) {
            return DialogSectorDynamic(
                sTitle, radioSectors ,sectorModel.value.listJittaSectorType!
            );

          }
      );
    }

  }

  Future<void> fetchStocklist(String market, String sectors, int page, int limit , bool iFirst) async {
    if(_connectManager.connectionType.value != 0){
      EasyLoading.show(status: 'รอสักครู่...');
      // QueryMutation queryMutation = QueryMutation();
      GraphQLClient _client = GraphQLConfiguration.clientToQuery();
      QueryResult result = await _client.query(
        QueryOptions(
          document: gql(queries.getStocklist),
          // document: gql(queryMutation.getStocklist(market, sectors, page,limit)),
          variables: {
            'market': market,
            'sectors': iFirst? null : sectors,
            'page': page,
            'limit': limit,
          },

        ),
      );

      if (result.hasException) {

        if (result.exception!.linkException is ServerException) {
          ServerException exception =
          result.exception!.linkException as ServerException;
          var errorMessage = exception.parsedResponse!.errors![0].message;
          var errorCode = exception.statusCode;
          var errorDisplay = "Status Code: "+errorCode.toString() + ": " +errorMessage.toString();
          print(errorDisplay);
          DialogAlert().warningAlertDialog(errorDisplay,buildcontext);
          // throw Exception(errorMessage);
        }

        // return Center(child: Text(result.exception.toString()));
        if( await _connectStock.getStockList(market+"/"+sectors) != null){
          stockModel.value = Stocklist.fromJson(await _connectStock.getStockList(market+"/"+sectors));
        }
        EasyLoading.dismiss();
      }

      if (result.isLoading) {
        // return Center(child: CircularProgressIndicator());
        EasyLoading.show(status: 'รอสักครู่...');
      }

      if(result.data != null){
        // var sum = jsonEncode(result.data);
        await _connectStock.setStockList(market+"/"+sectors,jsonEncode(result.data));

        stockModel.value = Stocklist.fromJson(result.data!);


        EasyLoading.dismiss();
      }
    }else {
      if( await _connectStock.getStockList(market+"/"+sectors) != null){
        stockModel.value = Stocklist.fromJson(await _connectStock.getStockList(market+"/"+sectors));
      }
    }

  }
  Future<void> fetchSectors() async {
    EasyLoading.show(status: 'รอสักครู่...');
    // QueryMutation queryMutation = QueryMutation();
    GraphQLClient _client = GraphQLConfiguration.clientToQuery();
    QueryResult result = await _client.query(
      QueryOptions(
        document: gql(queries.readSectors),
      ),
    );

    if (result.hasException) {
      // return Center(child: Text(result.exception.toString()));
      if (result.exception!.linkException is ServerException) {
        ServerException exception =
        result.exception!.linkException as ServerException;
        var errorMessage = exception.parsedResponse!.errors![0].message;
        var errorCode = exception.statusCode;
        var errorDisplay = "Status Code: "+errorCode.toString() + ": " +errorMessage.toString();
        print(errorDisplay);
        DialogAlert().warningAlertDialog(errorDisplay,buildcontext);
        // throw Exception(errorMessage);
      }

    }

    if (result.isLoading) {
      // return Center(child: CircularProgressIndicator());
      EasyLoading.show(status: 'รอสักครู่...');
    }

    if(result.data != null){
      // var sum = jsonEncode(result.data);
      sectorModel.value = SectorList.fromJson(result.data!);

      EasyLoading.dismiss();
    }
  }
}