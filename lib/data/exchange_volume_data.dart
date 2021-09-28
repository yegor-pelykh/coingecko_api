import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

class ExchangeVolumeData {
  final DateTime date;
  final double volume;

  ExchangeVolumeData.fromArray(List<dynamic> array)
      : this.date = Convert.toDateTime(array[0]) ?? Helpers.defaultDateTime(),
        this.volume = Convert.toDouble(array[1]) ?? 0 {}

  @override
  String toString() {
    return '${Helpers.getTypeName(ExchangeVolumeData)}: date = $date, volume = $volume';
  }
}
