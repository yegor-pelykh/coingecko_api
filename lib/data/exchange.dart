import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// Exchange data wrapper
class Exchange {
  /// Exchange id
  final String id;

  /// Exchange name
  final String name;

  /// The year in which the exchange was established
  final int yearEstablished;

  /// The country of the exchange
  final String country;

  /// Exchange description
  final String description;

  /// Exchange url
  final String url;

  /// Exchange image
  final String image;

  /// Indicates if the exchange has a trading incentive
  final bool hasTradingIncentive;

  /// Trust score
  final int trustScore;

  /// Trust score rank
  final int trustScoreRank;

  /// Exchange trade volume in BTC in 24 hours
  final double tradeVolume24hBtc;

  /// Exchange trade volume (normalized) in BTC in 24 hours
  final double tradeVolume24hBtcNormalized;

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

  @override
  String toString() {
    return '${Helpers.getTypeName(Exchange)}: id = $id, name = $name';
  }
}
