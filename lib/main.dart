import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import "package:graphql_flutter/graphql_flutter.dart";
import 'package:jitta_ranking/Database/dbStockDetail.dart';
import 'package:jitta_ranking/Database/dbStocklist.dart';
import 'package:jitta_ranking/config/graphql_configuration.dart';
import 'package:jitta_ranking/view/splashscreen.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main(){
  create_dbstorage();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(  GraphQLProvider(
    client: GraphQLConfiguration.client,
    child: CacheProvider(child: MyApp()),
  ),);
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Stocks List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      builder: EasyLoading.init(),
    );
  }
}

void create_dbstorage() async {
  await Get.put(StockListDB()).initStorage();
  await Get.put(StockDetailDB()).initStorage();
}