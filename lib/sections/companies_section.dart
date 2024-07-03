import 'package:coingecko_api/coingecko_result.dart';
import 'package:coingecko_api/data/companies_data.dart';
import 'package:coingecko_api/data/enumerations.dart';
import 'package:coingecko_api/helpers/client.dart';

/// The section that brings together the requests that are related to companies.
class CompaniesSection {
  /// The client used to make HTTP requests.
  final Client _client;

  /// Creates an instance of [CompaniesSection] with the given [Client].
  const CompaniesSection(this._client);

  /// Get public companies data.
  /// Filters companies by specific holding coin (ethereum or bitcoin).
  ///
  /// [coinId]: The ID of the coin to filter companies by. Default is [CompanyHoldingsCoin.bitcoin].
  ///
  /// Query path: /companies/public_treasury/{coin_id}
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
