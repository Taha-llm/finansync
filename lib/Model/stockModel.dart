import 'dart:convert';

List<StockModel> stockModelFromJson(String str) {
  final Map<String, dynamic> jsonData = json.decode(str);
  final List<dynamic> trendsData = jsonData['data']['trends'];
  return List<StockModel>.from(trendsData.map((x) => StockModel.fromJson(x)));
}

String stockModelToJson(List<StockModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StockModel {
  StockModel({
    required this.type,
    required this.symbol,
    required this.name,
    required this.price,
    required this.change,
    required this.changePercent,
    required this.previous_close,
  });

  String type;
  String symbol;
  String name;
  double price;
  double change;
  double changePercent;
  double previous_close;

  factory StockModel.fromJson(Map<String, dynamic> json) {
    return StockModel(
      type: json['type'],
      symbol: json['symbol'],
      name: json['name'],
      price: json['price'].toDouble(),
      change: json['change'].toDouble(),
      changePercent: json['change_percent'].toDouble(),
      previous_close : json['previous_close'].toDouble()
    );
  }

  Map<String, dynamic> toJson() => {
        "type": type,
        "symbol": symbol,
        "name": name,
        "price": price,
        "change": change,
        "changePercent": changePercent,
        "previous_close": previous_close,
      };
}
