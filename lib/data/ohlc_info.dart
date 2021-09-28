import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

class OHLCInfo {
  final DateTime timestamp;
  final double open;
  final double high;
  final double low;
  final double close;

  OHLCInfo.fromArray(List<dynamic> array)
      : this.timestamp =
            Convert.toDateTime(array[0], unit: TimeUnit.milliseconds) ?? Helpers.defaultDateTime(),
        this.open = Convert.toDouble(array[1]) ?? 0,
        this.high = Convert.toDouble(array[2]) ?? 0,
        this.low = Convert.toDouble(array[3]) ?? 0,
        this.close = Convert.toDouble(array[4]) ?? 0 {}

  @override
  String toString() {
    return '${Helpers.getTypeName(OHLCInfo)}: timestamp = $timestamp, open = $open, high = $high, low = $low, close = $close';
  }
}
