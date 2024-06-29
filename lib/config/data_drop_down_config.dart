//class สำหรรับสร้าง config data

class DataDDConfig {
  final int index;
  final String sLabel;
  final String sValue;

  DataDDConfig(this.index, this.sLabel, {required this.sValue});

  static List<DataDDConfig> getDataMarket() {
    List<DataDDConfig> list = [];
    list.add(DataDDConfig(0, "TH", sValue: "TH"));
    list.add(DataDDConfig(1, "US", sValue: "US"));
    list.add(DataDDConfig(2, "SG", sValue: "SG"));
    list.add(DataDDConfig(3, "VN", sValue: "VN"));
    list.add(DataDDConfig(4, "HK", sValue: "HK"));
    list.add(DataDDConfig(5, "UK", sValue: "UK"));
    list.add(DataDDConfig(6, "JP", sValue: "JP"));
    list.add(DataDDConfig(7, "CN", sValue: "CN"));
    list.add(DataDDConfig(8, "TW", sValue: "TW"));
    list.add(DataDDConfig(9, "IN", sValue: "IN"));
    list.add(DataDDConfig(10, "AU", sValue: "AU"));
    list.add(DataDDConfig(11, "DE", sValue: "DE"));
    list.add(DataDDConfig(12, "CA", sValue: "CA"));
    list.add(DataDDConfig(13, "FR", sValue: "FR"));
    list.add(DataDDConfig(14, "KR", sValue: "KR"));
    list.add(DataDDConfig(15, "RU", sValue: "RU"));

    return list;
  }





}



class DataNumberConfig {
  final int index;
  final String sLabel;
  final int ivalue;

  DataNumberConfig(this.index, this.sLabel, {required this.ivalue});

  static List<DataNumberConfig> getDAtaLimit() {
    List<DataNumberConfig> list = [];
    list.add(DataNumberConfig(0, "10", ivalue: 10));
    list.add(DataNumberConfig(1, "20", ivalue: 20));
    list.add(DataNumberConfig(2, "30", ivalue: 30));
    list.add(DataNumberConfig(3, "40", ivalue: 40));
    list.add(DataNumberConfig(4, "50", ivalue: 50));
    list.add(DataNumberConfig(5, "60", ivalue: 60));
    list.add(DataNumberConfig(6, "70", ivalue: 70));
    list.add(DataNumberConfig(7, "80", ivalue: 80));
    list.add(DataNumberConfig(8, "90", ivalue: 90));
    list.add(DataNumberConfig(9, "100", ivalue: 100));
    list.add(DataNumberConfig(10, "200", ivalue: 200));
    list.add(DataNumberConfig(11, "300", ivalue: 300));
    list.add(DataNumberConfig(12, "500", ivalue: 500));
    return list;
  }


}