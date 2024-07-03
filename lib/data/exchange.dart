import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// A class representing an exchange with various attributes.
class Exchange {
  /// The unique identifier of the exchange.
  final String id;

  /// The name of the exchange.
  final String name;

  /// The year in which the exchange was established.
  final int yearEstablished;

  /// The country where the exchange is located.
  final String country;

  /// A description of the exchange.
  final String description;

  /// The URL of the exchange's website.
  final String url;

  /// The URL of the exchange's image.
  final String image;

  /// A flag indicating whether the exchange has a trading incentive.
  final bool hasTradingIncentive;

  /// The trust score of the exchange.
  final int trustScore;

  /// The rank of the exchange based on its trust score.
  final int trustScoreRank;

  /// The trade volume of the exchange in BTC over the last 24 hours.
  final double tradeVolume24hBtc;

  /// The normalized trade volume of the exchange in BTC over the last 24 hours.
  final double tradeVolume24hBtcNormalized;

  /// Constructs an [Exchange] instance from a JSON map.
  ///
  /// [json] is a map containing the exchange data.
  Exchange.fromJson(Map<String, dynamic> json)
      : this.id = Convert.toStr(json['id'], ''),
        this.name = Convert.toStr(json['name'], ''),
        this.yearEstablished = Convert.toInt(json['year_established'], 0),
        this.country = Convert.toStr(json['country'], ''),
        this.description = Convert.toStr(json['description'], ''),
        this.url = Convert.toStr(json['url'], ''),
        this.image = Convert.toStr(json['image'], ''),
        this.hasTradingIncentive =
            Convert.toBoolean(json['has_trading_incentive'], false),
        this.trustScore = Convert.toInt(json['trust_score'], 0),
        this.trustScoreRank = Convert.toInt(json['trust_score_rank'], 0),
        this.tradeVolume24hBtc =
            Convert.toDouble(json['trade_volume_24h_btc'], 0),
        this.tradeVolume24hBtcNormalized =
            Convert.toDouble(json['trade_volume_24h_btc_normalized'], 0);

  /// Returns a string representation of the [Exchange] instance.
  @override
  String toString() {
    return '${Helpers.getTypeName(Exchange)}: id = $id, name = $name';
  }
}
