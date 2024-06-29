import 'dart:convert';

Stocklist stocklistFromJson(String str) => Stocklist.fromJson(json.decode(str));

String stocklistToJson(Stocklist data) => json.encode(data.toJson());

class Stocklist {
  final String? typename;
  final JittaRanking? jittaRanking;
  final List<ListJittaSectorType>? listJittaSectorType;

  Stocklist({
    this.typename,
    this.jittaRanking,
    this.listJittaSectorType,
  });

  factory Stocklist.fromJson(Map<String, dynamic> json) => Stocklist(
    typename: json["__typename"],
    jittaRanking: json["jittaRanking"] == null ? null : JittaRanking.fromJson(json["jittaRanking"]),
    listJittaSectorType: json["listJittaSectorType"] == null ? [] : List<ListJittaSectorType>.from(json["listJittaSectorType"]!.map((x) => ListJittaSectorType.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "jittaRanking": jittaRanking?.toJson(),
    "listJittaSectorType": listJittaSectorType == null ? [] : List<dynamic>.from(listJittaSectorType!.map((x) => x.toJson())),
  };
}

class JittaRanking {
  final String? typename;
  final int? count;
  final List<Datum>? data;

  JittaRanking({
    this.typename,
    this.count,
    this.data,
  });

  factory JittaRanking.fromJson(Map<String, dynamic> json) => JittaRanking(
    typename: json["__typename"],
    count: json["count"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "count": count,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  final String? typename;
  final String? id;
  final int? stockId;
  final int? rank;
  final String? symbol;
  final String? exchange;
  final String? title;
  final double? jittaScore;
  final String? nativeName;
  final ListJittaSectorType? sector;
  final String? industry;

  Datum({
    this.typename,
    this.id,
    this.stockId,
    this.rank,
    this.symbol,
    this.exchange,
    this.title,
    this.jittaScore,
    this.nativeName,
    this.sector,
    this.industry,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    typename: json["__typename"],
    id: json["id"],
    stockId: json["stockId"],
    rank: json["rank"],
    symbol: json["symbol"],
    exchange: json["exchange"],
    title: json["title"],
    jittaScore: json["jittaScore"]?.toDouble(),
    nativeName: json["nativeName"],
    sector: json["sector"] == null ? null : ListJittaSectorType.fromJson(json["sector"]),
    industry: json["industry"],
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "id": id,
    "stockId": stockId,
    "rank": rank,
    "symbol": symbol,
    "exchange": exchange,
    "title": title,
    "jittaScore": jittaScore,
    "nativeName": nativeName,
    "sector": sector?.toJson(),
    "industry": industry,
  };
}





class ListJittaSectorType {
  final String? typename;
  final String? id;
  final String? name;

  ListJittaSectorType({
    this.typename,
    this.id,
    this.name,
  });

  factory ListJittaSectorType.fromJson(Map<String, dynamic> json) => ListJittaSectorType(
    typename: json["__typename"],
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "id": id,
    "name": name,
  };
}


