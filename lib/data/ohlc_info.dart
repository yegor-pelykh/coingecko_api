import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';
import 'package:coingecko_api/helpers/time_unit.dart';

/// A class representing OHLC (Open, High, Low, Close) data for a specific timestamp.
class OHLCInfo {
  /// The moment in time for this OHLC data.
  final DateTime timestamp;

  /// The opening price.
  final double open;

  /// The highest price.
  final double high;

  /// The lowest price.
  final double low;

  /// The closing price.
  final double close;

  /// Constructs an instance of [OHLCInfo] from an array of dynamic values.
  ///
  /// The [array] parameter should contain the following values in order:
  /// - [array[0]]: The timestamp in milliseconds.
  /// - [array[1]]: The opening price.
  /// - [array[2]]: The highest price.
  /// - [array[3]]: The lowest price.
  /// - [array[4]]: The closing price.
  OHLCInfo.fromArray(List<dynamic> array)
      : this.timestamp = Convert.toDateTime(array[0], Helpers.defaultDateTime(),
            unit: TimeUnit.milliseconds),
        this.open = Convert.toDouble(array[1], 0),
        this.high = Convert.toDouble(array[2], 0),
        this.low = Convert.toDouble(array[3], 0),
        this.close = Convert.toDouble(array[4], 0);

  /// Returns a string representation of the [OHLCInfo] instance.
  ///
  /// The string includes the type name and the values of the timestamp, open, high, low, and close fields.
  @override
  String toString() {
    return '${Helpers.getTypeName(OHLCInfo)}: timestamp = $timestamp, open = $open, high = $high, low = $low, close = $close';
  }
}
