import 'package:coingecko_api/data/derivative_ticker.dart';
import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

class DerivativeExchangeExtended {
  final String name;
  final double tradeVolume24hBtc;
  final double? openInterestBtc;
  final int numberOfPerpetualPairs;
  final int numberOfFuturesPairs;
  final String image;
  final int? yearEstablished;
  final String? country;
  final String description;
  final String url;
  final List<DerivativeTicker>? tickers;

  static List<DerivativeTicker>? _parseTickers(dynamic json) {
    final jsonList = Convert.toList(json);
    return jsonList != null ? jsonList.map((e) => DerivativeTicker.fromJson(e)).toList() : null;
  }

  DerivativeExchangeExtended.fromJson(Map<String, dynamic> json)
      : this.name = Convert.toNotNullableString(json['name'], ''),
        this.openInterestBtc = Convert.toDouble(json['open_interest_btc']),
        this.tradeVolume24hBtc = Convert.toDouble(json['trade_volume_24h_btc']) ?? 0,
        this.numberOfPerpetualPairs = Convert.toInt(json['number_of_perpetual_pairs']) ?? 0,
        this.numberOfFuturesPairs = Convert.toInt(json['number_of_futures_pairs']) ?? 0,
        this.image = Convert.toNotNullableString(json['image'], ''),
        this.yearEstablished = Convert.toInt(json['year_established']) ?? 0,
        this.country = Convert.toNullableString(json['country']),
        this.description = Convert.toNotNullableString(json['description'], ''),
        this.url = Convert.toNotNullableString(json['url'], ''),
        this.tickers = _parseTickers(json['tickers']) {}

  @override
  String toString() {
    return '${Helpers.getTypeName(DerivativeExchangeExtended)}: name = $name';
  }
}
