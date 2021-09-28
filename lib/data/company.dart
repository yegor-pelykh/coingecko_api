import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

class Company {
  final String name;
  final String symbol;
  final String country;
  final double totalHoldings;
  final double totalEntryValueUsd;
  final double totalCurrentValueUsd;
  final double percentageOfTotalSupply;

  Company.fromJson(Map<String, dynamic> json)
      : this.name = Convert.toNotNullableString(json['name'], ''),
        this.symbol = Convert.toNotNullableString(json['symbol'], ''),
        this.country = Convert.toNotNullableString(json['country'], ''),
        this.totalHoldings = Convert.toDouble(json['total_holdings']) ?? 0,
        this.totalEntryValueUsd = Convert.toDouble(json['total_entry_value_usd']) ?? 0,
        this.totalCurrentValueUsd = Convert.toDouble(json['total_current_value_usd']) ?? 0,
        this.percentageOfTotalSupply = Convert.toDouble(json['percentage_of_total_supply']) ?? 0 {}

  @override
  String toString() {
    return '${Helpers.getTypeName(Company)}: name = $name, totalHoldings = $totalHoldings';
  }
}
