import 'package:coingecko_api/data/ticker.dart';
import 'package:coingecko_api/data/status_update.dart';
import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// Exchange extended data wrapper
class ExchangeExtended {
  /// Exchange name
  final String name;

  /// The year in which the exchange was established
  final int yearEstablished;

  /// Country of the company
  final String country;

  /// Exchange description
  final String description;

  /// Exchange url
  final String url;

  /// Exchange image
  final String image;

  /// Facebook url
  final String facebookUrl;

  /// Reddit url
  final String redditUrl;

  /// Telegram url
  final String telegramUrl;

  /// Slack url
  final String slackUrl;

  /// Other url 1
  final String otherUrl1;

  /// Other url 2
  final String otherUrl2;

  /// Twitter handle
  final String twitterHandle;

  /// Indicates if the exchange has a trading incentive
  final bool hasTradingIncentive;

  /// Indicates if the exchange is centralized
  final bool centralized;

  /// Public notice
  final String publicNotice;

  /// Alert notice
  final String alertNotice;

  /// Trust score
  final int trustScore;

  /// Trust score rank
  final int trustScoreRank;

  /// Exchange trade volume in BTC in 24 hours
  final double tradeVolume24hBtc;

  /// Exchange trade volume (normalized) in BTC in 24 hours
  final double tradeVolume24hBtcNormalized;

  /// List of tickers
  final List<Ticker> tickers;

  /// List of status updates
  final List<StatusUpdate> statusUpdates;

  /// Parses a list of tickers from JSON
  ///
  /// [json] - The JSON data to parse
  /// Returns a list of [Ticker] objects
  static List<Ticker> _parseTickers(dynamic json) {
    final jsonList = Convert.toListN(json);
    return jsonList != null
        ? jsonList.map((e) => Ticker.fromJson(e)).toList()
        : [];
  }

  /// Parses a list of status updates from JSON
  ///
  /// [json] - The JSON data to parse
  /// Returns a list of [StatusUpdate] objects
  static List<StatusUpdate> _parseStatusUpdates(dynamic json) {
    final jsonList = Convert.toListN(json);
    return jsonList != null
        ? jsonList.map((e) => StatusUpdate.fromJson(e)).toList()
        : [];
  }

  /// Constructs an [ExchangeExtended] object from JSON data
  ///
  /// [json] - The JSON data to parse
  ExchangeExtended.fromJson(Map<String, dynamic> json)
      : this.name = Convert.toStr(json['name'], ''),
        this.yearEstablished = Convert.toInt(json['year_established'], 0),
        this.country = Convert.toStr(json['country'], ''),
        this.description = Convert.toStr(json['description'], ''),
        this.url = Convert.toStr(json['url'], ''),
        this.image = Convert.toStr(json['image'], ''),
        this.facebookUrl = Convert.toStr(json['facebook_url'], ''),
        this.redditUrl = Convert.toStr(json['reddit_url'], ''),
        this.telegramUrl = Convert.toStr(json['telegram_url'], ''),
        this.slackUrl = Convert.toStr(json['slack_url'], ''),
        this.otherUrl1 = Convert.toStr(json['other_url_1'], ''),
        this.otherUrl2 = Convert.toStr(json['other_url_2'], ''),
        this.twitterHandle = Convert.toStr(json['twitter_handle'], ''),
        this.hasTradingIncentive =
            Convert.toBoolean(json['has_trading_incentive'], false),
        this.centralized = Convert.toBoolean(json['centralized'], false),
        this.publicNotice = Convert.toStr(json['public_notice'], ''),
        this.alertNotice = Convert.toStr(json['alert_notice'], ''),
        this.trustScore = Convert.toInt(json['trust_score'], 0),
        this.trustScoreRank = Convert.toInt(json['trust_score_rank'], 0),
        this.tradeVolume24hBtc =
            Convert.toDouble(json['trade_volume_24h_btc'], 0),
        this.tradeVolume24hBtcNormalized =
            Convert.toDouble(json['trade_volume_24h_btc_normalized'], 0),
        this.tickers = _parseTickers(json['tickers']),
        this.statusUpdates = _parseStatusUpdates(json['status_updates']);

  /// Returns a string representation of the [ExchangeExtended] object
  @override
  String toString() {
    return '${Helpers.getTypeName(ExchangeExtended)}: name = $name, url = $url';
  }
}
