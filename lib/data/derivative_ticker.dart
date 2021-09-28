import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

class DerivativeTicker {
  final String symbol;
  final String base;
  final String target;
  final String tradeUrl;
  final String contractType;
  final double last;
  final double h24PercentageChange;
  final double? index;
  final double indexBasisPercentage;
  final double bidAskSpread;
  final double fundingRate;
  final double openInterestUsd;
  final double h24Volume;
  final Map<String, double> convertedVolume;
  final Map<String, double> convertedLast;
  final DateTime lastTraded;
  final DateTime? expiredAt;

  DerivativeTicker.fromJson(Map<String, dynamic> json)
      : this.symbol = Convert.toNotNullableString(json['symbol'], ''),
        this.base = Convert.toNotNullableString(json['base'], ''),
        this.target = Convert.toNotNullableString(json['target'], ''),
        this.tradeUrl = Convert.toNotNullableString(json['trade_url'], ''),
        this.contractType = Convert.toNotNullableString(json['contract_type'], ''),
        this.last = Convert.toDouble(json['last']) ?? 0,
        this.h24PercentageChange = Convert.toDouble(json['h24_percentage_change']) ?? 0,
        this.index = Convert.toDouble(json['index']),
        this.indexBasisPercentage = Convert.toDouble(json['index_basis_percentage']) ?? 0,
        this.bidAskSpread = Convert.toDouble(json['bid_ask_spread']) ?? 0,
        this.fundingRate = Convert.toDouble(json['funding_rate']) ?? 0,
        this.openInterestUsd = Convert.toDouble(json['open_interest_usd']) ?? 0,
        this.h24Volume = Convert.toDouble(json['h24_volume']) ?? 0,
        this.convertedVolume = Helpers.parseMapStringDouble(json['converted_volume']) ?? {},
        this.convertedLast = Helpers.parseMapStringDouble(json['converted_last']) ?? {},
        this.lastTraded = Convert.toDateTime(json['last_traded']) ?? Helpers.defaultDateTime(),
        this.expiredAt = Convert.toDateTime(json['expired_at']) {}

  @override
  String toString() {
    return '${Helpers.getTypeName(DerivativeTicker)}: symbol = $symbol, base = $base, target = $target, last = $last';
  }
}
