import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// A class that represents exchange volume data with a date and volume.
class ExchangeVolumeData {
  /// The date of the exchange volume data.
  final DateTime date;

  /// The volume of the exchange data.
  final double volume;

  /// Constructs an instance of [ExchangeVolumeData] from an array.
  ///
  /// The [array] parameter is a list where the first element is expected to be
  /// a date and the second element is expected to be a volume.
  ExchangeVolumeData.fromArray(List<dynamic> array)
      : this.date = Convert.toDateTime(array[0], Helpers.defaultDateTime()),
        this.volume = Convert.toDouble(array[1], 0);

  /// Returns a string representation of the [ExchangeVolumeData] instance.
  ///
  /// The string contains the type name, date, and volume.
  @override
  String toString() {
    return '${Helpers.getTypeName(ExchangeVolumeData)}: date = $date, volume = $volume';
  }
}
