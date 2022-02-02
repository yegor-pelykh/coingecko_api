import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// Derivative ticker data wrapper
class DerivativeTicker {
  /// Ticker symbol
  final String symbol;

  /// Base asset
  final String base;

  /// Target asset
  final String target;

  /// Ticker trade url
  final String tradeUrl;

  /// Ticker contract type
  final String contractType;

  /// Ticker last value
  final double last;

  /// Ticker price percentage change in 24 hours
  final double h24PercentageChange;

  /// Ticker index
  final double? index;

  /// Ticker index basis percentage
  final double indexBasisPercentage;

  /// Bid / Ask spread
  final double bidAskSpread;

  /// Funding rate
  final double fundingRate;

  /// Open interest in USD
  final double openInterestUsd;

  /// Volume in 24 hours
  final double h24Volume;

  /// Converted volume
  final Map<String, double> convertedVolume;

  /// Converted last
  final Map<String, double> convertedLast;

  /// The moment at which derivative was last traded
  final DateTime lastTraded;

  /// The moment at which derivative was (will be) expired
  final DateTime? expiredAt;

  DerivativeTicker.fromJson(Map<String, dynamic> json)
      : this.symbol = Convert.toNotNullableString(json['symbol'], ''),
        this.base = Convert.toNotNullableString(json['base'], ''),
        this.target = Convert.toNotNullableString(json['target'], ''),
        this.tradeUrl = Convert.toNotNullableString(json['trade_url'], ''),
        this.contractType =
            Convert.toNotNullableString(json['contract_type'], ''),
        this.last = Convert.toDouble(json['last']) ?? 0,
        this.h24PercentageChange =
            Convert.toDouble(json['h24_percentage_change']) ?? 0,
        this.index = Convert.toDouble(json['index']),
        this.indexBasisPercentage =
            Convert.toDouble(json['index_basis_percentage']) ?? 0,
        this.bidAskSpread = Convert.toDouble(json['bid_ask_spread']) ?? 0,
        this.fundingRate = Convert.toDouble(json['funding_rate']) ?? 0,
        this.openInterestUsd = Convert.toDouble(json['open_interest_usd']) ?? 0,
        this.h24Volume = Convert.toDouble(json['h24_volume']) ?? 0,
        this.convertedVolume =
            Helpers.parseMapStringDouble(json['converted_volume']) ?? {},
        this.convertedLast =
            Helpers.parseMapStringDouble(json['converted_last']) ?? {},
        this.lastTraded = Convert.toDateTime(json['last_traded']) ??
            Helpers.defaultDateTime(),
        this.expiredAt = Convert.toDateTime(json['expired_at']);

  @override
  String toString() {
    return '${Helpers.getTypeName(DerivativeTicker)}: symbol = $symbol, base = $base, target = $target, last = $last';
  }
}
