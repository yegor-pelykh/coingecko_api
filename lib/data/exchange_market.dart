import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// Exchange market data wrapper
class ExchangeMarket {
  /// Exchange market name
  final String name;

  /// Exchange market identifier
  final String identifier;

  /// Indicates if the exchange has a trading incentive
  final bool hasTradingIncentive;

  /// Exchange market logo
  final String? logo;

  ExchangeMarket.fromJson(Map<String, dynamic> json)
      : this.name = Convert.toNotNullableString(json['name'], ''),
        this.identifier = Convert.toNotNullableString(json['identifier'], ''),
        this.hasTradingIncentive =
            Convert.toNotNullableBoolean(json['has_trading_incentive'], false),
        this.logo = Convert.toNullableString(json['logo']);

  @override
  String toString() {
    return '${Helpers.getTypeName(ExchangeMarket)}: identifier = $identifier, name = $name';
  }
}
