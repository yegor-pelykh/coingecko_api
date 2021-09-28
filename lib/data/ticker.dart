import 'package:coingecko_api/data/exchange_market.dart';
import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

class Ticker {
  final String base;
  final String target;
  final ExchangeMarket market;
  final double last;
  final double volume;
  final double? costToMoveUpUsd;
  final double? costToMoveDownUsd;
  final Map<String, double> convertedLast;
  final Map<String, double> convertedVolume;
  final String trustScore;
  final double bidAskSpreadPercentage;
  final DateTime timestamp;
  final DateTime lastTradedAt;
  final DateTime lastFetchAt;
  final bool isAnomaly;
  final bool isStale;
  final String tradeUrl;
  final String? tokenInfoUrl;
  final String coinId;
  final String? targetCoinId;

  Ticker.fromJson(Map<String, dynamic> json)
      : this.base = Convert.toNotNullableString(json['base'], ''),
        this.target = Convert.toNotNullableString(json['target'], ''),
        this.market = ExchangeMarket.fromJson(json['market']),
        this.last = Convert.toDouble(json['last']) ?? 0,
        this.volume = Convert.toDouble(json['volume']) ?? 0,
        this.costToMoveUpUsd = Convert.toDouble(json['cost_to_move_up_usd']),
        this.costToMoveDownUsd = Convert.toDouble(json['cost_to_move_down_usd']),
        this.convertedLast = Helpers.parseMapStringDouble(json['converted_last']) ?? {},
        this.convertedVolume = Helpers.parseMapStringDouble(json['converted_volume']) ?? {},
        this.trustScore = Convert.toNotNullableString(json['trust_score'], ''),
        this.bidAskSpreadPercentage = Convert.toDouble(json['bid_ask_spread_percentage']) ?? 0,
        this.timestamp = Convert.toDateTime(json['timestamp']) ?? Helpers.defaultDateTime(),
        this.lastTradedAt = Convert.toDateTime(json['last_traded_at']) ?? Helpers.defaultDateTime(),
        this.lastFetchAt = Convert.toDateTime(json['last_fetch_at']) ?? Helpers.defaultDateTime(),
        this.isAnomaly = Convert.toNotNullableBoolean(json['is_anomaly'], false),
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
