import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// A class representing an exchange market with relevant details.
class ExchangeMarket {
  /// The name of the exchange market.
  final String name;

  /// The unique identifier of the exchange market.
  final String identifier;

  /// A flag indicating whether the exchange market has a trading incentive.
  final bool hasTradingIncentive;

  /// The logo of the exchange market, if available.
  final String? logo;

  /// Constructs an [ExchangeMarket] instance from a JSON map.
  ///
  /// The [json] parameter is a map containing the exchange market data.
  ExchangeMarket.fromJson(Map<String, dynamic> json)
      : this.name = Convert.toStr(json['name'], ''),
        this.identifier = Convert.toStr(json['identifier'], ''),
        this.hasTradingIncentive =
            Convert.toBoolean(json['has_trading_incentive'], false),
        this.logo = Convert.toStrN(json['logo']);

  /// Returns a string representation of the [ExchangeMarket] instance.
  ///
  /// The string contains the type name, identifier, and name of the exchange market.
  @override
  String toString() {
    return '${Helpers.getTypeName(ExchangeMarket)}: identifier = $identifier, name = $name';
  }
}
