import 'package:fl_chart/fl_chart.dart';

class StockChart {
  late final String status;
  late final String requestId;
  late final StockChartData data;

  StockChart({
    required this.status,
    required this.requestId,
    required this.data,
  });

  factory StockChart.fromJson(Map<String, dynamic> json) {
    return StockChart(
      status: json['status'] ?? '',
      requestId: json['request_id'] ?? '',
      data: StockChartData.fromJson(json['data'] ?? {}),
    );
  }
}

class StockChartData {
  late final String symbol;
  late final String type;
  late final double price;
  late final double previousClose;
  late final double change;
  late final double changePercent;
  late final double preOrPostMarket;
  late final double preOrPostMarketChange;
  late final double preOrPostMarketChangePercent;
  late final String lastUpdateUtc;
  late final Map<String, TimeSeriesData> timeSeries;
  // Add key events if needed

  StockChartData({
    required this.symbol,
    required this.type,
    required this.price,
    required this.previousClose,
    required this.change,
    required this.changePercent,
    required this.preOrPostMarket,
    required this.preOrPostMarketChange,
    required this.preOrPostMarketChangePercent,
    required this.lastUpdateUtc,
    required this.timeSeries,
    // Add key events if needed
  });

  factory StockChartData.fromJson(Map<String, dynamic> json) {
    return StockChartData(
      symbol: json['symbol'] ?? '',
      type: json['type'] ?? '',
      price: (json['price'] ?? 0.0).toDouble(),
      previousClose: (json['previous_close'] ?? 0.0).toDouble(),
      change: (json['change'] ?? 0.0).toDouble(),
      changePercent: (json['change_percent'] ?? 0.0).toDouble(),
      preOrPostMarket: (json['pre_or_post_market'] ?? 0.0).toDouble(),
      preOrPostMarketChange: (json['pre_or_post_market_change'] ?? 0.0).toDouble(),
      preOrPostMarketChangePercent: (json['pre_or_post_market_change_percent'] ?? 0.0).toDouble(),
      lastUpdateUtc: json['last_update_utc'] ?? '',
      timeSeries: (json['time_series'] ?? {}).map(
        (key, value) => MapEntry(key, TimeSeriesData.fromJson(value)),
      ),
      // Add key events if needed
    );
  }

  LineChart getLineChart() {
    final List<FlSpot> spots = [];

    // Assuming you want to use time_series data for the chart
    this.timeSeries.forEach((key, value) {
      // Use the timestamp or index as the x-value and the price as the y-value
      spots.add(FlSpot(DateTime.parse(key).millisecondsSinceEpoch.toDouble(), value.price));
    });

    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: spots,
          )
        ],
        borderData: FlBorderData(
          show: true,
        ),
        gridData: FlGridData(show: false),
      ),
    );
  }
}

class TimeSeriesData {
  late final double price;
  late final double change;
  late final double changePercent;
  late final int volume;

  TimeSeriesData({
    required this.price,
    required this.change,
    required this.changePercent,
    required this.volume,
  });

  factory TimeSeriesData.fromJson(Map<String, dynamic> json) {
    return TimeSeriesData(
      price: (json['price'] ?? 0.0).toDouble(),
      change: (json['change'] ?? 0.0).toDouble(),
      changePercent: (json['change_percent'] ?? 0.0).toDouble(),
      volume: (json['volume'] ?? 0).toInt(),
    );
  }
}
