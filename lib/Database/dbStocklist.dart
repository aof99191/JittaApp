
import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StockListDB extends GetxController  {
  final String sTableName = 'StockList';
  final box = GetStorage('StockList');


  Future<void> initStorage() async {
    await GetStorage.init(sTableName);
  }

  setStockList(String key, String data ) async {
    await box.write(key, data);
  }

  Future<dynamic> getStockList(String key) async {
    dynamic n ;
    if(key!=null){
      if(box.read(key) != null)   n = await  jsonDecode(box.read(key));

    }

    return n;
  }
}