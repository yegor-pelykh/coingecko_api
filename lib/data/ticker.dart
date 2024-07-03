import 'package:coingecko_api/data/exchange_market.dart';
import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// A class representing the ticker data for a specific trading pair.
class Ticker {
  /// The base asset of the trading pair.
  final String base;

  /// The target asset of the trading pair.
  final String target;

  /// The market data for the ticker.
  final ExchangeMarket market;

  /// The last traded value of the ticker.
  final double last;

  /// The trading volume of the ticker.
  final double volume;

  /// The cost to move the ticker up in USD.
  final double? costToMoveUpUsd;

  /// The cost to move the ticker down in USD.
  final double? costToMoveDownUsd;

  /// The last traded value of the ticker converted to different currencies.
  final Map<String, double> convertedLast;

  /// The trading volume of the ticker converted to different currencies.
  final Map<String, double> convertedVolume;

  /// The trust score of the ticker.
  final String trustScore;

  /// The bid/ask spread percentage of the ticker.
  final double bidAskSpreadPercentage;

  /// The timestamp when the ticker data is relevant.
  final DateTime timestamp;

  /// The timestamp when the ticker was last traded.
  final DateTime lastTradedAt;

  /// The timestamp when the ticker data was last fetched.
  final DateTime lastFetchAt;

  /// Indicates whether the ticker data is considered an anomaly.
  final bool isAnomaly;

  /// Indicates whether the ticker data is considered stale.
  final bool isStale;

  /// The URL for trading the asset.
  final String tradeUrl;

  /// The URL for token information.
  final String? tokenInfoUrl;

  /// The identifier of the coin.
  final String coinId;

  /// The identifier of the target coin.
  final String? targetCoinId;

  /// Constructs a [Ticker] instance from a JSON object.
  ///
  /// [json] is a map containing the ticker data.
  Ticker.fromJson(Map<String, dynamic> json)
      : this.base = Convert.toStr(json['base'], ''),
        this.target = Convert.toStr(json['target'], ''),
        this.market = ExchangeMarket.fromJson(json['market']),
        this.last = Convert.toDouble(json['last'], 0),
        this.volume = Convert.toDouble(json['volume'], 0),
        this.costToMoveUpUsd = Convert.toDoubleN(json['cost_to_move_up_usd']),
        this.costToMoveDownUsd =
            Convert.toDoubleN(json['cost_to_move_down_usd']),
        this.convertedLast =
            Convert.toMapOfStringDouble(json['converted_last'], {}),
        this.convertedVolume =
            Convert.toMapOfStringDouble(json['converted_volume'], {}),
        this.trustScore = Convert.toStr(json['trust_score'], ''),
        this.bidAskSpreadPercentage =
            Convert.toDouble(json['bid_ask_spread_percentage'], 0),
        this.timestamp =
            Convert.toDateTime(json['timestamp'], Helpers.defaultDateTime()),
        this.lastTradedAt = Convert.toDateTime(
            json['last_traded_at'], Helpers.defaultDateTime()),
        this.lastFetchAt = Convert.toDateTime(
            json['last_fetch_at'], Helpers.defaultDateTime()),
        this.isAnomaly = Convert.toBoolean(json['is_anomaly'], false),
        this.isStale = Convert.toBoolean(json['is_stale'], false),
        this.tradeUrl = Convert.toStr(json['trade_url'], ''),
        this.tokenInfoUrl = Convert.toStrN(json['token_info_url']),
        this.coinId = Convert.toStr(json['coin_id'], ''),
        this.targetCoinId = Convert.toStrN(json['target_coin_id']);

  /// Returns a string representation of the [Ticker] instance.
  @override
  String toString() {
    return '${Helpers.getTypeName(Ticker)}: base = $base, target = $target, last = $last';
  }
}
