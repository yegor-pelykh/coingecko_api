import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// Company data wrapper
class Company {
  /// Company name
  final String name;

  /// Company symbol
  final String symbol;

  /// Country of the company
  final String country;

  /// Total holdings
  final double totalHoldings;

  /// Total entry value in USD
  final double totalEntryValueUsd;

  /// Total current value in USD
  final double totalCurrentValueUsd;

  /// Percentage of total supply
  final double percentageOfTotalSupply;

  Company.fromJson(Map<String, dynamic> json)
      : this.name = Convert.toStr(json['name'], ''),
        this.symbol = Convert.toStr(json['symbol'], ''),
        this.country = Convert.toStr(json['country'], ''),
        this.totalHoldings = Convert.toDouble(json['total_holdings'], 0),
        this.totalEntryValueUsd =
            Convert.toDouble(json['total_entry_value_usd'], 0),
        this.totalCurrentValueUsd =
            Convert.toDouble(json['total_current_value_usd'], 0),
        this.percentageOfTotalSupply =
            Convert.toDouble(json['percentage_of_total_supply'], 0);

  @override
  String toString() {
    return '${Helpers.getTypeName(Company)}: name = $name, totalHoldings = $totalHoldings';
  }
}
