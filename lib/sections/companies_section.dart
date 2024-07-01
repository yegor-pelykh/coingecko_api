import 'package:coingecko_api/coingecko_result.dart';
import 'package:coingecko_api/data/companies_data.dart';
import 'package:coingecko_api/data/enumerations.dart';
import 'package:coingecko_api/helpers/client.dart';

/// The section that brings together the requests that are related to companies
class CompaniesSection {
  final Client _client;

  const CompaniesSection(this._client);

  ///
  /// Get public companies data.
  ///
  /// **[coin_id]** filters companies by specific holding coin
  /// (ethereum or bitcoin). Use [CompanyHoldingsCoin] enumeration
  /// as values. Default is [CompanyHoldingsCoin.bitcoin]
  ///
  /// Query: **/companies/public\_treasury/{coin\_id}**
  ///
  Future<CoinGeckoResult<CompaniesData?>> getCompaniesData({
    String coinId = CompanyHoldingsCoin.bitcoin,
  }) async {
    final response = await _client.dio.get(
      '/companies/public_treasury/$coinId',
    );
    if (response.statusCode == 200) {
      final data = CompaniesData.fromJson(response.data);
      return CoinGeckoResult(data);
    } else {
      return CoinGeckoResult(
        null,
        errorCode: response.statusCode ?? null,
        errorMessage: '${response.statusMessage} - ${response.data.toString()}',
        isError: true,
      );
    }
  }
}
