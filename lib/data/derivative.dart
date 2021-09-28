import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

class Derivative {
  final String market;
  final String symbol;
  final String indexId;
  final double price;
  final double pricePercentageChange24h;
  final String contractType;
  final double? index;
  final double basis;
  final double? spread;
  final double fundingRate;
  final double openInterest;
  final double volume24h;
  final DateTime lastTradedAt;
  final DateTime? expiredAt;

  Derivative.fromJson(Map<String, dynamic> json)
      : this.market = Convert.toNotNullableString(json['market'], ''),
        this.symbol = Convert.toNotNullableString(json['symbol'], ''),
        this.indexId = Convert.toNotNullableString(json['index_id'], ''),
        this.price = Convert.toDouble(json['price']) ?? 0,
        this.pricePercentageChange24h = Convert.toDouble(json['price_percentage_change_24h']) ?? 0,
        this.contractType = Convert.toNotNullableString(json['contract_type'], ''),
        this.index = Convert.toDouble(json['index']),
        this.basis = Convert.toDouble(json['basis']) ?? 0,
        this.spread = Convert.toDouble(json['spread']),
        this.fundingRate = Convert.toDouble(json['funding_rate']) ?? 0,
        this.openInterest = Convert.toDouble(json['open_interest']) ?? 0,
        this.volume24h = Convert.toDouble(json['volume_24h']) ?? 0,
        this.lastTradedAt = Convert.toDateTime(json['last_traded_at']) ?? Helpers.defaultDateTime(),
        this.expiredAt = Convert.toDateTime(json['expired_at']) {}

  @override
  String toString() {
    return '${Helpers.getTypeName(Derivative)}: market = $market, symbol = $symbol';
  }
}
