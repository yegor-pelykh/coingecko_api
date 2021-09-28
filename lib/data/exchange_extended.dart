import 'package:coingecko_api/data/ticker.dart';
import 'package:coingecko_api/data/status_update.dart';
import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

class ExchangeExtended {
  final String name;
  final int yearEstablished;
  final String country;
  final String description;
  final String url;
  final String image;
  final String facebookUrl;
  final String redditUrl;
  final String telegramUrl;
  final String slackUrl;
  final String otherUrl1;
  final String otherUrl2;
  final String twitterHandle;
  final bool hasTradingIncentive;
  final bool centralized;
  final String publicNotice;
  final String alertNotice;
  final int trustScore;
  final int trustScoreRank;
  final double tradeVolume24hBtc;
  final double tradeVolume24hBtcNormalized;
  final List<Ticker> tickers;
  final List<StatusUpdate> statusUpdates;

  static List<Ticker> _parseTickers(dynamic json) {
    final jsonList = Convert.toList(json);
    return jsonList != null ? jsonList.map((e) => Ticker.fromJson(e)).toList() : [];
  }

  static List<StatusUpdate> _parseStatusUpdates(dynamic json) {
    final jsonList = Convert.toList(json);
    return jsonList != null ? jsonList.map((e) => StatusUpdate.fromJson(e)).toList() : [];
  }

  ExchangeExtended.fromJson(Map<String, dynamic> json)
      : this.name = Convert.toNotNullableString(json['name'], ''),
        this.yearEstablished = Convert.toInt(json['year_established']) ?? 0,
        this.country = Convert.toNotNullableString(json['country'], ''),
        this.description = Convert.toNotNullableString(json['description'], ''),
        this.url = Convert.toNotNullableString(json['url'], ''),
        this.image = Convert.toNotNullableString(json['image'], ''),
        this.facebookUrl = Convert.toNotNullableString(json['facebook_url'], ''),
        this.redditUrl = Convert.toNotNullableString(json['reddit_url'], ''),
        this.telegramUrl = Convert.toNotNullableString(json['telegram_url'], ''),
        this.slackUrl = Convert.toNotNullableString(json['slack_url'], ''),
        this.otherUrl1 = Convert.toNotNullableString(json['other_url_1'], ''),
        this.otherUrl2 = Convert.toNotNullableString(json['other_url_2'], ''),
        this.twitterHandle = Convert.toNotNullableString(json['twitter_handle'], ''),
        this.hasTradingIncentive =
            Convert.toNotNullableBoolean(json['has_trading_incentive'], false),
        this.centralized = Convert.toNotNullableBoolean(json['centralized'], false),
        this.publicNotice = Convert.toNotNullableString(json['public_notice'], ''),
        this.alertNotice = Convert.toNotNullableString(json['alert_notice'], ''),
        this.trustScore = Convert.toInt(json['trust_score']) ?? 0,
        this.trustScoreRank = Convert.toInt(json['trust_score_rank']) ?? 0,
        this.tradeVolume24hBtc = Convert.toDouble(json['trade_volume_24h_btc']) ?? 0,
        this.tradeVolume24hBtcNormalized =
            Convert.toDouble(json['trade_volume_24h_btc_normalized']) ?? 0,
        this.tickers = _parseTickers(json['tickers']),
        this.statusUpdates = _parseStatusUpdates(json['status_updates']) {}

  @override
  String toString() {
    return '${Helpers.getTypeName(ExchangeExtended)}: name = $name, url = $url';
  }
}
