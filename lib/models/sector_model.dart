import 'dart:convert';

SectorList sectorListFromJson(String str) => SectorList.fromJson(json.decode(str));

String sectorListToJson(SectorList data) => json.encode(data.toJson());

class SectorList {
  final String? typename;
  final List<ListJittaSectorType>? listJittaSectorType;

  SectorList({
    this.typename,
    this.listJittaSectorType,
  });

  factory SectorList.fromJson(Map<String, dynamic> json) => SectorList(
    typename: json["__typename"],
    listJittaSectorType: json["listJittaSectorType"] == null ? [] : List<ListJittaSectorType>.from(json["listJittaSectorType"]!.map((x) => ListJittaSectorType.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "listJittaSectorType": listJittaSectorType == null ? [] : List<dynamic>.from(listJittaSectorType!.map((x) => x.toJson())),
  };
}

class ListJittaSectorType {
  final String? typename;
  final String? name;
  final String? id;

  ListJittaSectorType({
    this.typename,
    this.name,
    this.id,
  });

  factory ListJittaSectorType.fromJson(Map<String, dynamic> json) => ListJittaSectorType(
    typename: json["__typename"],
    name: json["name"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "name": name,
    "id": id,
  };
}