import 'package:coingecko_api/data/exchange_market.dart';
import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// Ticker data wrapper
class Ticker {
  /// Base asset
  final String base;

  /// Target asset
  final String target;

  /// Ticker market data
  final ExchangeMarket market;

  /// Ticker last value
  final double last;

  /// Ticker volume
  final double volume;

  /// Ticker cost to move up in USD
  final double? costToMoveUpUsd;

  /// Ticker cost to move down in USD
  final double? costToMoveDownUsd;

  /// Ticker converted last
  final Map<String, double> convertedLast;

  /// Ticker converted volume
  final Map<String, double> convertedVolume;

  /// Ticker trust score
  final String trustScore;

  /// Bid / Ask spread percentage
  final double bidAskSpreadPercentage;

  /// The moment for which the ticker is relevant
  final DateTime timestamp;

  /// The moment at which the ticker was last traded
  final DateTime lastTradedAt;

  /// The moment at which the ticker was last fetched
  final DateTime lastFetchAt;

  /// Indicates if the ticker is anomaly
  final bool isAnomaly;

  /// Indicates if the ticker is stale
  final bool isStale;

  /// Trade url
  final String tradeUrl;

  /// Token info url
  final String? tokenInfoUrl;

  /// Coin identifier
  final String coinId;

  /// Target coin identifier
  final String? targetCoinId;

  Ticker.fromJson(Map<String, dynamic> json)
      : this.base = Convert.toNotNullableString(json['base'], ''),
        this.target = Convert.toNotNullableString(json['target'], ''),
        this.market = ExchangeMarket.fromJson(json['market']),
        this.last = Convert.toDouble(json['last']) ?? 0,
        this.volume = Convert.toDouble(json['volume']) ?? 0,
        this.costToMoveUpUsd = Convert.toDouble(json['cost_to_move_up_usd']),
        this.costToMoveDownUsd =
            Convert.toDouble(json['cost_to_move_down_usd']),
        this.convertedLast =
            Helpers.parseMapStringDouble(json['converted_last']) ?? {},
        this.convertedVolume =
            Helpers.parseMapStringDouble(json['converted_volume']) ?? {},
        this.trustScore = Convert.toNotNullableString(json['trust_score'], ''),
        this.bidAskSpreadPercentage =
            Convert.toDouble(json['bid_ask_spread_percentage']) ?? 0,
        this.timestamp =
            Convert.toDateTime(json['timestamp']) ?? Helpers.defaultDateTime(),
        this.lastTradedAt = Convert.toDateTime(json['last_traded_at']) ??
            Helpers.defaultDateTime(),
        this.lastFetchAt = Convert.toDateTime(json['last_fetch_at']) ??
            Helpers.defaultDateTime(),
        this.isAnomaly =
            Convert.toNotNullableBoolean(json['is_anomaly'], false),
        this.isStale = Convert.toNotNullableBoolean(json['is_stale'], false),
        this.tradeUrl = Convert.toNotNullableString(json['trade_url'], ''),
        this.tokenInfoUrl = Convert.toNullableString(json['token_info_url']),
        this.coinId = Convert.toNotNullableString(json['coin_id'], ''),
        this.targetCoinId = Convert.toNullableString(json['target_coin_id']) {}

  @override
  String toString() {
    return '${Helpers.getTypeName(Ticker)}: base = $base, target = $target, last = $last';
  }
}
