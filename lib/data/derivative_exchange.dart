import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// A class representing a derivative exchange with various attributes.
class DerivativeExchange {
  /// The unique identifier of the exchange.
  final String id;

  /// The name of the exchange.
  final String name;

  /// The trade volume of the exchange in BTC over the last 24 hours.
  final double tradeVolume24hBtc;

  /// The open interest in BTC.
  final double? openInterestBtc;

  /// The number of perpetual pairs available on the exchange.
  final int numberOfPerpetualPairs;

  /// The number of futures pairs available on the exchange.
  final int numberOfFuturesPairs;

  /// The URL of the exchange's image.
  final String image;

  /// The year the exchange was established.
  final int? yearEstablished;

  /// The country where the exchange is based.
  final String? country;

  /// A description of the exchange.
  final String description;

  /// The URL of the exchange's website.
  final String url;

  /// Constructs a [DerivativeExchange] instance from a JSON map.
  ///
  /// [json] is a map containing the exchange data.
  DerivativeExchange.fromJson(Map<String, dynamic> json)
      : this.id = Convert.toStr(json['id'], ''),
        this.name = Convert.toStr(json['name'], ''),
        this.openInterestBtc = Convert.toDoubleN(json['open_interest_btc']),
        this.tradeVolume24hBtc =
            Convert.toDouble(json['trade_volume_24h_btc'], 0),
        this.numberOfPerpetualPairs =
            Convert.toInt(json['number_of_perpetual_pairs'], 0),
        this.numberOfFuturesPairs =
            Convert.toInt(json['number_of_futures_pairs'], 0),
        this.image = Convert.toStr(json['image'], ''),
        this.yearEstablished = Convert.toInt(json['year_established'], 0),
        this.country = Convert.toStrN(json['country']),
        this.description = Convert.toStr(json['description'], ''),
        this.url = Convert.toStr(json['url'], '');

  /// Returns a string representation of the [DerivativeExchange] instance.
  @override
  String toString() {
    return '${Helpers.getTypeName(DerivativeExchange)}: name = $name';
  }
}
