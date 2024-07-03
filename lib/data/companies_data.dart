import 'package:coingecko_api/data/company.dart';
import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// A class that wraps the data related to companies' holdings and market information.
class CompaniesData {
  /// The total holdings of the companies.
  final double totalHoldings;

  /// The total value of the holdings in USD.
  final double totalValueUsd;

  /// The market capitalization dominance of the companies.
  final double marketCapDominance;

  /// A list of companies.
  final List<Company> companies;

  /// Parses a list of companies from a JSON object.
  ///
  /// [json] - The JSON object to parse.
  ///
  /// Returns a list of [Company] objects.
  static List<Company> _parseCompanies(dynamic json) {
    final jsonList = Convert.toListN(json);
    return jsonList != null
        ? jsonList.map((e) => Company.fromJson(e)).toList()
        : [];
  }

  /// Constructs a [CompaniesData] instance from a JSON map.
  ///
  /// [json] - The JSON map containing the data.
  CompaniesData.fromJson(Map<String, dynamic> json)
      : this.totalHoldings = Convert.toDouble(json['total_holdings'], 0),
        this.totalValueUsd = Convert.toDouble(json['total_value_usd'], 0),
        this.marketCapDominance =
            Convert.toDouble(json['market_cap_dominance'], 0),
        this.companies = _parseCompanies(json['companies']);

  /// Returns a string representation of the [CompaniesData] instance.
  @override
  String toString() {
    return '${Helpers.getTypeName(CompaniesData)}';
  }
}
