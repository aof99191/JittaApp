
import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StockDetailDB extends GetxController  {
  final String sTableName = 'StockDetail';
  final box = GetStorage('StockDetail');


  Future<void> initStorage() async {
    await GetStorage.init(sTableName);
  }

  setStockDetail(String key, String data ) async {
    await box.write(key, data);
  }

  Future<dynamic> getStockDetail(String key) async {
    dynamic n ;
    if(key!=null){
      if(box.read(key) != null)   n = await  jsonDecode(box.read(key));

    }

    return n;
  }
}