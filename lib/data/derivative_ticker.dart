import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// A class representing the data for a derivative ticker.
class DerivativeTicker {
  /// The ticker symbol.
  final String symbol;

  /// The base asset.
  final String base;

  /// The target asset.
  final String target;

  /// The URL for trading the ticker.
  final String tradeUrl;

  /// The type of contract for the ticker.
  final String contractType;

  /// The last traded value of the ticker.
  final double last;

  /// The percentage change in price over the last 24 hours.
  final double h24PercentageChange;

  /// The index value of the ticker, if available.
  final double? index;

  /// The index basis percentage.
  final double indexBasisPercentage;

  /// The bid/ask spread.
  final double bidAskSpread;

  /// The funding rate.
  final double fundingRate;

  /// The open interest in USD.
  final double openInterestUsd;

  /// The trading volume over the last 24 hours.
  final double h24Volume;

  /// The converted volume in different currencies.
  final Map<String, double> convertedVolume;

  /// The last traded value converted into different currencies.
  final Map<String, double> convertedLast;

  /// The timestamp of the last trade.
  final DateTime lastTraded;

  /// The timestamp when the derivative expired or will expire, if available.
  final DateTime? expiredAt;

  /// Constructs a [DerivativeTicker] instance from a JSON map.
  ///
  /// [json] is a map containing the data to be converted into a [DerivativeTicker] instance.
  DerivativeTicker.fromJson(Map<String, dynamic> json)
      : this.symbol = Convert.toStr(json['symbol'], ''),
        this.base = Convert.toStr(json['base'], ''),
        this.target = Convert.toStr(json['target'], ''),
        this.tradeUrl = Convert.toStr(json['trade_url'], ''),
        this.contractType = Convert.toStr(json['contract_type'], ''),
        this.last = Convert.toDouble(json['last'], 0),
        this.h24PercentageChange =
            Convert.toDouble(json['h24_percentage_change'], 0),
        this.index = Convert.toDoubleN(json['index']),
        this.indexBasisPercentage =
            Convert.toDouble(json['index_basis_percentage'], 0),
        this.bidAskSpread = Convert.toDouble(json['bid_ask_spread'], 0),
        this.fundingRate = Convert.toDouble(json['funding_rate'], 0),
        this.openInterestUsd = Convert.toDouble(json['open_interest_usd'], 0),
        this.h24Volume = Convert.toDouble(json['h24_volume'], 0),
        this.convertedVolume =
            Convert.toMapOfStringDouble(json['converted_volume'], {}),
        this.convertedLast =
            Convert.toMapOfStringDouble(json['converted_last'], {}),
        this.lastTraded =
            Convert.toDateTime(json['last_traded'], Helpers.defaultDateTime()),
        this.expiredAt = Convert.toDateTimeN(json['expired_at']);

  /// Returns a string representation of the [DerivativeTicker] instance.
  @override
  String toString() {
    return '${Helpers.getTypeName(DerivativeTicker)}: symbol = $symbol, base = $base, target = $target, last = $last';
  }
}
