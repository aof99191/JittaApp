import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
//import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:jitta_ranking/Database/dbStockDetail.dart';
import 'package:jitta_ranking/Database/dbStocklist.dart';
import 'package:jitta_ranking/config/const.dart';
import 'package:jitta_ranking/config/data_drop_down_config.dart';
import 'package:jitta_ranking/config/graphql_configuration.dart';
import 'package:jitta_ranking/controllers/getx_internet_connectivity/connection_manager_controller.dart';
import 'package:jitta_ranking/models/sector_model.dart';
import 'package:jitta_ranking/models/stock_detail_model.dart';
// import 'package:jitta_ranking/config/query_mutation.dart';
import 'package:jitta_ranking/models/stocklist_model.dart';
import 'package:jitta_ranking/config/readRepositories.dart' as queries;
import 'package:jitta_ranking/utils/dialog_alert.dart';
import 'package:jitta_ranking/utils/dialog_sector_dynamic.dart';
import 'package:jitta_ranking/utils/style_css.dart';
import 'package:oktoast/oktoast.dart';

class StockDetailController extends GetxController {

  late BuildContext buildcontext;
  final _connectManager = Get.put(ConnectionManagerController());
  final _connectStock = Get.put(StockDetailDB());
  var detailModel = SectorDetail().obs;



  Future<void> loadWidget(BuildContext context) async {
    this.buildcontext = context;

  }

Future<void> fetchStockDetails(String id, int stockId) async {
  if(_connectManager.connectionType.value != 0){
    EasyLoading.show(status: 'รอสักครู่...');
    // QueryMutation queryMutation = QueryMutation();
    GraphQLClient _client = GraphQLConfiguration.clientToQuery();
    QueryResult result = await _client.query(
      QueryOptions(
        document: gql(queries.getStockdetailsV2),
        // document: gql(queryMutation.getStocklist(market, sectors, page,limit)),
        variables: {
          'stockId': stockId,
          'id': id
        },
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


      if( await _connectStock.getStockDetail(id+"/"+stockId.toString()) != null){
        detailModel.value = SectorDetail.fromJson(await _connectStock.getStockDetail(id+"/"+stockId.toString()));
      }
      EasyLoading.dismiss();
    }

    if (result.isLoading) {
      // return Center(child: CircularProgressIndicator());
      EasyLoading.show(status: 'รอสักครู่...');
    }

    if(result.data != null){
      // var sum = jsonEncode(result.data);
      await _connectStock.setStockDetail(id+"/"+stockId.toString(),jsonEncode(result.data));
      detailModel.value = SectorDetail.fromJson(result.data!);

      EasyLoading.dismiss();
    }

  }else {
    if( await _connectStock.getStockDetail(id+"/"+stockId.toString()) != null){
      detailModel.value = SectorDetail.fromJson(await _connectStock.getStockDetail(id+"/"+stockId.toString()));
    }
  }
}


}