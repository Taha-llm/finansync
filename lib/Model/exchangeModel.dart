import 'dart:convert';

List<ExchangeModel> exchangeModelFromJson(String str) {
  final Map<String, dynamic> jsonData = json.decode(str);
  final List<dynamic> trendsData = jsonData['conversion_rates'];
  return List<ExchangeModel>.from(trendsData.map((x) => ExchangeModel.fromJson(x)));
}

String exchangeModelToJson(List<ExchangeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ExchangeModel {
  ExchangeModel({
    required this.EUR,
    required this.USD,
    required this.GBP,
    required this.CHF,
    required this.CAD,
    required this.JPY,
    required this.DZD,
    required this.QAR,
    required this.SAR,
    required this.RUB,
  });

    String EUR;
    String USD;
    String GBP;
    String CHF;
    String CAD;
    String JPY;
    String DZD;
    String QAR;
    String SAR;
    String RUB;

  factory ExchangeModel.fromJson(Map<String, dynamic> json) {
    return ExchangeModel(
      EUR: json['EUR'],
      USD: json['USD'],
      GBP: json['GBP'],
      CHF: json['CHF'],
      CAD: json['CAD'],
      JPY: json['JPY'],
      DZD: json['DZD'],
      QAR: json['QAR'],
      SAR: json['SAR'],
      RUB: json['RUB'],



    );
  }

  Map<String, dynamic> toJson() => {
    'EUR' : EUR,
    'USD' :USD,
    'GRP' :GBP,
    'CHF' :CHF,
    'CAD' :CAD,
    'JPY' :JPY,
    'DZD' :DZD,
    'QAR' :QAR,
    'SAR' :SAR,
    'RUB' :RUB,

      };
}
