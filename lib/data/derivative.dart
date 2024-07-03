import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// A class representing a derivative data wrapper.
class Derivative {
  /// The name of the market.
  final String market;

  /// The symbol of the derivative.
  final String symbol;

  /// The index ID of the derivative.
  final String indexId;

  /// The price of the derivative.
  final double price;

  /// The percentage change in price over the last 24 hours.
  final double pricePercentageChange24h;

  /// The type of contract.
  final String contractType;

  /// The index value of the derivative.
  final double? index;

  /// The basis value of the derivative.
  final double basis;

  /// The spread value of the derivative.
  final double? spread;

  /// The funding rate of the derivative.
  final double fundingRate;

  /// The open interest of the derivative.
  final double openInterest;

  /// The trading volume over the last 24 hours.
  final double volume24h;

  /// The timestamp of the last trade.
  final DateTime lastTradedAt;

  /// The expiration timestamp of the derivative.
  final DateTime? expiredAt;

  /// Constructs a [Derivative] instance from a JSON map.
  ///
  /// [json] is a map containing the data to initialize the instance.
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

  /// Returns a string representation of the [Derivative] instance.
  @override
  String toString() {
    return '${Helpers.getTypeName(Derivative)}: market = $market, symbol = $symbol';
  }
}
