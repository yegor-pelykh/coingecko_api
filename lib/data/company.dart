import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// A class representing a company's data.
class Company {
  /// The name of the company.
  final String name;

  /// The stock symbol of the company.
  final String symbol;

  /// The country where the company is based.
  final String country;

  /// The total holdings of the company.
  final double totalHoldings;

  /// The total entry value of the company's holdings in USD.
  final double totalEntryValueUsd;

  /// The total current value of the company's holdings in USD.
  final double totalCurrentValueUsd;

  /// The percentage of the total supply held by the company.
  final double percentageOfTotalSupply;

  /// Constructs a [Company] instance from a JSON map.
  ///
  /// [json] is a map containing the company data.
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

  /// Returns a string representation of the [Company] instance.
  @override
  String toString() {
    return '${Helpers.getTypeName(Company)}: name = $name, totalHoldings = $totalHoldings';
  }
}
