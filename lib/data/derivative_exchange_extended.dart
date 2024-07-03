import 'package:coingecko_api/data/derivative_ticker.dart';
import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// Derivative exchange extended data wrapper
class DerivativeExchangeExtended {
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

  /// Exchange tickers
  final List<DerivativeTicker>? tickers;

  /// Parses a list of tickers from JSON.
  ///
  /// [json] - The JSON data to parse.
  ///
  /// Returns a list of [DerivativeTicker] objects or null if the input is null.
  static List<DerivativeTicker>? _parseTickers(dynamic json) {
    final jsonList = Convert.toListN(json);
    return jsonList != null
        ? jsonList.map((e) => DerivativeTicker.fromJson(e)).toList()
        : null;
  }

  /// Constructs a [DerivativeExchangeExtended] instance from JSON data.
  ///
  /// [json] - The JSON data to parse.
  DerivativeExchangeExtended.fromJson(Map<String, dynamic> json)
      : this.name = Convert.toStr(json['name'], ''),
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
        this.url = Convert.toStr(json['url'], ''),
        this.tickers = _parseTickers(json['tickers']);

  /// Returns a string representation of the [DerivativeExchangeExtended] instance.
  @override
  String toString() {
    return '${Helpers.getTypeName(DerivativeExchangeExtended)}: name = $name';
  }
}
