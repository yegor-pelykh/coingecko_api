import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// Derivative exchange data wrapper
class DerivativeExchange {
  /// Exchange identifier
  final String id;

  /// Exchange name
  final String name;

  /// Exchange trade volume in BTC in 24 hours
  final double tradeVolume24hBtc;

  /// Open interest in BTC
  final double? openInterestBtc;

  /// Number of perpetual pairs
  final int numberOfPerpetualPairs;

  /// Number of futures pairs
  final int numberOfFuturesPairs;

  /// Exchange image
  final String image;

  /// The year in which the exchange was established
  final int? yearEstablished;

  /// The country of the exchange
  final String? country;

  /// Exchange description
  final String description;

  /// Exchange url
  final String url;

  DerivativeExchange.fromJson(Map<String, dynamic> json)
      : this.id = Convert.toNotNullableString(json['id'], ''),
        this.name = Convert.toNotNullableString(json['name'], ''),
        this.openInterestBtc = Convert.toDouble(json['open_interest_btc']),
        this.tradeVolume24hBtc =
            Convert.toDouble(json['trade_volume_24h_btc']) ?? 0,
        this.numberOfPerpetualPairs =
            Convert.toInt(json['number_of_perpetual_pairs']) ?? 0,
        this.numberOfFuturesPairs =
            Convert.toInt(json['number_of_futures_pairs']) ?? 0,
        this.image = Convert.toNotNullableString(json['image'], ''),
        this.yearEstablished = Convert.toInt(json['year_established']) ?? 0,
        this.country = Convert.toNullableString(json['country']),
        this.description = Convert.toNotNullableString(json['description'], ''),
        this.url = Convert.toNotNullableString(json['url'], '');

  @override
  String toString() {
    return '${Helpers.getTypeName(DerivativeExchange)}: name = $name';
  }
}
