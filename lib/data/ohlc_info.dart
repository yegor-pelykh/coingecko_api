import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';
import 'package:coingecko_api/helpers/time_unit.dart';

/// OHLC data wrapper
class OHLCInfo {
  /// The moment in time for this OHLC data
  final DateTime timestamp;

  /// Open price
  final double open;

  /// High price
  final double high;

  /// Low price
  final double low;

  /// Close price
  final double close;

  OHLCInfo.fromArray(List<dynamic> array)
      : this.timestamp = Convert.toDateTime(array[0], Helpers.defaultDateTime(),
            unit: TimeUnit.milliseconds),
        this.open = Convert.toDouble(array[1], 0),
        this.high = Convert.toDouble(array[2], 0),
        this.low = Convert.toDouble(array[3], 0),
        this.close = Convert.toDouble(array[4], 0);

  @override
  String toString() {
    return '${Helpers.getTypeName(OHLCInfo)}: timestamp = $timestamp, open = $open, high = $high, low = $low, close = $close';
  }
}
