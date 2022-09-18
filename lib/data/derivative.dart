import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// Derivative data wrapper
class Derivative {
  /// Market name
  final String market;

  /// Derivative symbol
  final String symbol;

  /// Derivative index id
  final String indexId;

  /// Derivative price
  final double price;

  /// Derivative price percentage change in 24 hours
  final double pricePercentageChange24h;

  /// Contract type
  final String contractType;

  /// Index
  final double? index;

  /// Basis
  final double basis;

  /// Spread
  final double? spread;

  /// Funding rate
  final double fundingRate;

  /// Open interest
  final double openInterest;

  /// Volume in 24 hours
  final double volume24h;

  /// The moment at which derivative was last traded
  final DateTime lastTradedAt;

  /// The moment at which derivative was (will be) expired
  final DateTime? expiredAt;

  Derivative.fromJson(Map<String, dynamic> json)
      : this.market = Convert.toStr(json['market'], ''),
        this.symbol = Convert.toStr(json['symbol'], ''),
        this.indexId = Convert.toStr(json['index_id'], ''),
        this.price = Convert.toDouble(json['price'], 0),
        this.pricePercentageChange24h =
            Convert.toDouble(json['price_percentage_change_24h'], 0),
        this.contractType = Convert.toStr(json['contract_type'], ''),
        this.index = Convert.toDoubleN(json['index']),
        this.basis = Convert.toDouble(json['basis'], 0),
        this.spread = Convert.toDoubleN(json['spread']),
        this.fundingRate = Convert.toDouble(json['funding_rate'], 0),
        this.openInterest = Convert.toDouble(json['open_interest'], 0),
        this.volume24h = Convert.toDouble(json['volume_24h'], 0),
        this.lastTradedAt = Convert.toDateTime(
            json['last_traded_at'], Helpers.defaultDateTime()),
        this.expiredAt = Convert.toDateTimeN(json['expired_at']);

  @override
  String toString() {
    return '${Helpers.getTypeName(Derivative)}: market = $market, symbol = $symbol';
  }
}
