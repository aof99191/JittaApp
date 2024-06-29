import 'dart:convert';

SectorDetail sectorDetailFromJson(String str) => SectorDetail.fromJson(json.decode(str));

String sectorDetailToJson(SectorDetail data) => json.encode(data.toJson());

class SectorDetail {
  final String? typename;
  final Stock? stock;

  SectorDetail({
    this.typename,
    this.stock,
  });

  factory SectorDetail.fromJson(Map<String, dynamic> json) => SectorDetail(
    typename: json["__typename"],
    stock: json["stock"] == null ? null : Stock.fromJson(json["stock"]),
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "stock": stock?.toJson(),
  };
}

class Stock {
  final String? typename;
  final bool? isFollowing;
  final String? id;
  final int? stockId;
  final String? alias;
  final String? symbol;
  final String? title;
  final String? summary;
  final Sector? sector;
  final Company? company;
  final String? market;
  final String? industry;
  final String? exchange;
  final String? currency;
  final String? currencySign;
  final String? priceCurrency;
  final String? status;
  final String? lastCompleteStatementKey;
  final LossChance? lossChance;
  final Price? price;
  final String? nativeName;
  final String? name;
  final Comparison? comparison;
  final DateTime? updatedFinancialComplete;
  final Jitta? jitta;

  Stock({
    this.typename,
    this.isFollowing,
    this.id,
    this.stockId,
    this.alias,
    this.symbol,
    this.title,
    this.summary,
    this.sector,
    this.company,
    this.market,
    this.industry,
    this.exchange,
    this.currency,
    this.currencySign,
    this.priceCurrency,
    this.status,
    this.lastCompleteStatementKey,
    this.lossChance,
    this.price,
    this.nativeName,
    this.name,
    this.comparison,
    this.updatedFinancialComplete,
    this.jitta,
  });

  factory Stock.fromJson(Map<String, dynamic> json) => Stock(
    typename: json["__typename"],
    isFollowing: json["isFollowing"],
    id: json["id"],
    stockId: json["stockId"],
    alias: json["alias"] == null ? "" :json["alias"],
    symbol: json["symbol"],
    title: json["title"],
    summary: json["summary"],
    sector: json["sector"] == null ? null : Sector.fromJson(json["sector"]),
    company: json["company"] == null ? null : Company.fromJson(json["company"]),
    market: json["market"],
    industry: json["industry"],
    exchange: json["exchange"],
    currency: json["currency"],
    currencySign: json["currency_sign"],
    priceCurrency: json["price_currency"],
    status: json["status"],
    lastCompleteStatementKey: json["last_complete_statement_key"],
    lossChance: json["loss_chance"] == null ? null : LossChance.fromJson(json["loss_chance"]),
    price: json["price"] == null ? null : Price.fromJson(json["price"]),
    nativeName: json["nativeName"],
    name: json["name"],
    comparison: json["comparison"] == null ? null : Comparison.fromJson(json["comparison"]),
    updatedFinancialComplete: json["updatedFinancialComplete"] == null ? null : DateTime.parse(json["updatedFinancialComplete"]),
    jitta: json["jitta"] == null ? null : Jitta.fromJson(json["jitta"]),
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "isFollowing": isFollowing,
    "id": id,
    "stockId": stockId,
    "alias": alias,
    "symbol": symbol,
    "title": title,
    "summary": summary,
    "sector": sector?.toJson(),
    "company": company?.toJson(),
    "market": market,
    "industry": industry,
    "exchange": exchange,
    "currency": currency,
    "currency_sign": currencySign,
    "price_currency": priceCurrency,
    "status": status,
    "last_complete_statement_key": lastCompleteStatementKey,
    "loss_chance": lossChance?.toJson(),
    "price": price?.toJson(),
    "nativeName": nativeName,
    "name": name,
    "comparison": comparison?.toJson(),
    "updatedFinancialComplete": updatedFinancialComplete?.toIso8601String(),
    "jitta": jitta?.toJson(),
  };
}

class Company {
  final String? typename;
  final DateTime? ipoDate;
  final List<Link>? link;

  Company({
    this.typename,
    this.ipoDate,
    this.link,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    typename: json["__typename"],
    ipoDate: json["ipo_date"] == null ? null : DateTime.parse(json["ipo_date"]),
    link: json["link"] == null ? [] : List<Link>.from(json["link"]!.map((x) => Link.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "ipo_date": ipoDate?.toIso8601String(),
    "link": link == null ? [] : List<dynamic>.from(link!.map((x) => x.toJson())),
  };
}

class Link {
  final String? typename;
  final String? url;

  Link({
    this.typename,
    this.url,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    typename: json["__typename"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "url": url,
  };
}

class Comparison {
  final String? typename;
  final Market? market;

  Comparison({
    this.typename,
    this.market,
  });

  factory Comparison.fromJson(Map<String, dynamic> json) => Comparison(
    typename: json["__typename"],
    market: json["market"] == null ? null : Market.fromJson(json["market"]),
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "market": market?.toJson(),
  };
}

class Market {
  final String? typename;
  final int? rank;
  final int? member;

  Market({
    this.typename,
    this.rank,
    this.member,
  });

  factory Market.fromJson(Map<String, dynamic> json) => Market(
    typename: json["__typename"],
    rank: json["rank"],
    member: json["member"],
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "rank": rank,
    "member": member,
  };
}

class Jitta {
  final String? typename;
  final PriceDiff? priceDiff;
  final Line? monthlyPrice;
  final Score? score;
  final Line? line;
  final Factor? factor;
  final Sign? sign;

  Jitta({
    this.typename,
    this.priceDiff,
    this.monthlyPrice,
    this.score,
    this.line,
    this.factor,
    this.sign,
  });

  factory Jitta.fromJson(Map<String, dynamic> json) => Jitta(
    typename: json["__typename"],
    priceDiff: json["priceDiff"] == null ? null : PriceDiff.fromJson(json["priceDiff"]),
    monthlyPrice: json["monthlyPrice"] == null ? null : Line.fromJson(json["monthlyPrice"]),
    score: json["score"] == null ? null : Score.fromJson(json["score"]),
    line: json["line"] == null ? null : Line.fromJson(json["line"]),
    factor: json["factor"] == null ? null : Factor.fromJson(json["factor"]),
    sign: json["sign"] == null ? null : Sign.fromJson(json["sign"]),
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "priceDiff": priceDiff?.toJson(),
    "monthlyPrice": monthlyPrice?.toJson(),
    "score": score?.toJson(),
    "line": line?.toJson(),
    "factor": factor?.toJson(),
    "sign": sign?.toJson(),
  };
}

class Factor {
  final String? typename;
  final FactorLast? last;

  Factor({
    this.typename,
    this.last,
  });

  factory Factor.fromJson(Map<String, dynamic> json) => Factor(
    typename: json["__typename"],
    last: json["last"] == null ? null : FactorLast.fromJson(json["last"]),
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "last": last?.toJson(),
  };
}

class FactorLast {
  final String? typename;
  final LastValue? value;

  FactorLast({
    this.typename,
    this.value,
  });

  factory FactorLast.fromJson(Map<String, dynamic> json) => FactorLast(
    typename: json["__typename"],
    value: json["value"] == null ? null : LastValue.fromJson(json["value"]),
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "value": value?.toJson(),
  };
}

class LastValue {
  final String? typename;
  final Financial? growth;
  final Financial? recent;
  final Financial? financial;
  final Financial? valueReturn;
  final Financial? management;

  LastValue({
    this.typename,
    this.growth,
    this.recent,
    this.financial,
    this.valueReturn,
    this.management,
  });

  factory LastValue.fromJson(Map<String, dynamic> json) => LastValue(
    typename: json["__typename"],
    growth: json["growth"] == null ? null : Financial.fromJson(json["growth"]),
    recent: json["recent"] == null ? null : Financial.fromJson(json["recent"]),
    financial: json["financial"] == null ? null : Financial.fromJson(json["financial"]),
    valueReturn: json["return"] == null ? null : Financial.fromJson(json["return"]),
    management: json["management"] == null ? null : Financial.fromJson(json["management"]),
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "growth": growth?.toJson(),
    "recent": recent?.toJson(),
    "financial": financial?.toJson(),
    "return": valueReturn?.toJson(),
    "management": management?.toJson(),
  };
}

class Financial {
  final String? typename;
  final int? value;
  final String? name;
  final String? level;

  Financial({
    this.typename,
    this.value,
    this.name,
    this.level,
  });

  factory Financial.fromJson(Map<String, dynamic> json) => Financial(
    typename: json["__typename"],
    value: json["value"],
    name: json["name"],
    level: json["level"],
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "value": value,
    "name": name,
    "level": level,
  };
}

class Line {
  final String? typename;
  final int? total;
  final List<ValueElement>? values;
  final LineLast? last;

  Line({
    this.typename,
    this.total,
    this.values,
    this.last,
  });

  factory Line.fromJson(Map<String, dynamic> json) => Line(
    typename: json["__typename"],
    total: json["total"],
    values: json["values"] == null ? [] : List<ValueElement>.from(json["values"]!.map((x) => ValueElement.fromJson(x))),
    last: json["last"] == null ? null : LineLast.fromJson(json["last"]),
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "total": total,
    "values": values == null ? [] : List<dynamic>.from(values!.map((x) => x.toJson())),
    "last": last?.toJson(),
  };
}

class LineLast {
  final String? typename;
  final String? id;
  final dynamic? value;

  LineLast({
    this.typename,
    this.id,
    this.value,
  });

  factory LineLast.fromJson(Map<String, dynamic> json) => LineLast(
    typename: json["__typename"],
    id: json["id"],
    value: json["value"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "id": id,
    "value": value,
  };
}


class ValueElement {
  final String? typename;
  final String? id;
  final dynamic? value;
  final int? year;
  final int? month;
  final int? quarter;

  ValueElement({
    this.typename,
    this.id,
    this.value,
    this.year,
    this.month,
    this.quarter,
  });

  factory ValueElement.fromJson(Map<String, dynamic> json) => ValueElement(
    typename: json["__typename"],
    id: json["id"],
    value: json["value"]?.toDouble(),
    year: json["year"],
    month: json["month"],
    quarter: json["quarter"],
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "id": id,
    "value": value,
    "year": year,
    "month": month,
    "quarter": quarter,
  };
}

class PriceDiff {
  final String? typename;
  final ValueClass? last;
  final List<ValueClass>? values;

  PriceDiff({
    this.typename,
    this.last,
    this.values,
  });

  factory PriceDiff.fromJson(Map<String, dynamic> json) => PriceDiff(
    typename: json["__typename"],
    last: json["last"] == null ? null : ValueClass.fromJson(json["last"]),
    values: json["values"] == null ? [] : List<ValueClass>.from(json["values"]!.map((x) => ValueClass.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "last": last?.toJson(),
    "values": values == null ? [] : List<dynamic>.from(values!.map((x) => x.toJson())),
  };
}

class ValueClass {
  final String? typename;
  final String? id;
  final dynamic? value;
  final String? type;
  final String? percent;

  ValueClass({
    this.typename,
    this.id,
    this.value,
    this.type,
    this.percent,
  });

  factory ValueClass.fromJson(Map<String, dynamic> json) => ValueClass(
    typename: json["__typename"],
    id: json["id"],
    value: json["value"]?.toDouble(),
    type: json["type"],
    percent: json["percent"],
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "id": id,
    "value": value,
    "type": type,
    "percent": percent,
  };
}



class Score {
  final String? typename;
  final LineLast? last;
  final List<ValueElement>? values;

  Score({
    this.typename,
    this.last,
    this.values,
  });

  factory Score.fromJson(Map<String, dynamic> json) => Score(
    typename: json["__typename"],
    last: json["last"] == null ? null : LineLast.fromJson(json["last"]),
    values: json["values"] == null ? [] : List<ValueElement>.from(json["values"]!.map((x) => ValueElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "last": last?.toJson(),
    "values": values == null ? [] : List<dynamic>.from(values!.map((x) => x.toJson())),
  };
}

class Sign {
  final String? typename;
  final List<LastElement>? last;

  Sign({
    this.typename,
    this.last,
  });

  factory Sign.fromJson(Map<String, dynamic> json) => Sign(
    typename: json["__typename"],
    last: json["last"] == null ? [] : List<LastElement>.from(json["last"]!.map((x) => LastElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "last": last == null ? [] : List<dynamic>.from(last!.map((x) => x.toJson())),
  };
}

class LastElement {
  final String? typename;
  final String? title;
  final String? type;
  final String? name;
  final String? value;
  final Display? display;

  LastElement({
    this.typename,
    this.title,
    this.type,
    this.name,
    this.value,
    this.display,
  });

  factory LastElement.fromJson(Map<String, dynamic> json) => LastElement(
    typename: json["__typename"],
    title: json["title"],
    type: json["type"],
    name: json["name"],
    value: json["value"],
    display: json["display"] == null ? null : Display.fromJson(json["display"]),
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "title": title,
    "type": type,
    "name": name,
    "value": value,
    "display": display?.toJson(),
  };
}

class Display {
  final String? typename;
  final String? title;
  final List<String>? columnHead;
  final List<Column>? columns;
  final dynamic footer;

  Display({
    this.typename,
    this.title,
    this.columnHead,
    this.columns,
    this.footer,
  });

  factory Display.fromJson(Map<String, dynamic> json) => Display(
    typename: json["__typename"],
    title: json["title"],
    columnHead: json["columnHead"] == null ? [] : List<String>.from(json["columnHead"]!.map((x) => x)),
    columns: json["columns"] == null ? [] : List<Column>.from(json["columns"]!.map((x) => Column.fromJson(x))),
    footer: json["footer"],
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "title": title,
    "columnHead": columnHead == null ? [] : List<dynamic>.from(columnHead!.map((x) => x)),
    "columns": columns == null ? [] : List<dynamic>.from(columns!.map((x) => x.toJson())),
    "footer": footer,
  };
}

class Column {
  final String? typename;
  final String? name;
  final List<String>? data;

  Column({
    this.typename,
    this.name,
    this.data,
  });

  factory Column.fromJson(Map<String, dynamic> json) => Column(
    typename: json["__typename"],
    name: json["name"],
    data: json["data"] == null ? [] : List<String>.from(json["data"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "name": name,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
  };
}

class LossChance {
  final String? typename;
  final dynamic? last;
  final DateTime? updatedAt;

  LossChance({
    this.typename,
    this.last,
    this.updatedAt,
  });

  factory LossChance.fromJson(Map<String, dynamic> json) => LossChance(
    typename: json["__typename"],
    last: json["last"]?.toDouble(),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "last": last,
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

class Price {
  final String? typename;
  final Latest? latest;

  Price({
    this.typename,
    this.latest,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    typename: json["__typename"],
    latest: json["latest"] == null ? null : Latest.fromJson(json["latest"]),
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "latest": latest?.toJson(),
  };
}

class Latest {
  final String? typename;
  final dynamic? close;
  final DateTime? datetime;

  Latest({
    this.typename,
    this.close,
    this.datetime,
  });

  factory Latest.fromJson(Map<String, dynamic> json) => Latest(
    typename: json["__typename"],
    close: json["close"],
    datetime: json["datetime"] == null ? null : DateTime.parse(json["datetime"]),
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "close": close,
    "datetime": datetime?.toIso8601String(),
  };
}

class Sector {
  final String? typename;
  final String? id;
  final String? name;

  Sector({
    this.typename,
    this.id,
    this.name,
  });

  factory Sector.fromJson(Map<String, dynamic> json) => Sector(
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


