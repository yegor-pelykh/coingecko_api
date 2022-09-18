import 'package:coingecko_api/data/company.dart';
import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// Companies data wrapper
class CompaniesData {
  /// Total holdings
  final double totalHoldings;

  /// Total value in USD
  final double totalValueUsd;

  /// Market capitalization dominance
  final double marketCapDominance;

  /// List of companies
  final List<Company> companies;

  static List<Company> _parseCompanies(dynamic json) {
    final jsonList = Convert.toListN(json);
    return jsonList != null
        ? jsonList.map((e) => Company.fromJson(e)).toList()
        : [];
  }

  CompaniesData.fromJson(Map<String, dynamic> json)
      : this.totalHoldings = Convert.toDouble(json['total_holdings'], 0),
        this.totalValueUsd = Convert.toDouble(json['total_value_usd'], 0),
        this.marketCapDominance =
            Convert.toDouble(json['market_cap_dominance'], 0),
        this.companies = _parseCompanies(json['companies']);

  @override
  String toString() {
    return '${Helpers.getTypeName(CompaniesData)}';
  }
}
