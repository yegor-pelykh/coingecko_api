import 'package:coingecko_api/coingecko_result.dart';
import 'package:coingecko_api/data/companies_data.dart';
import 'package:coingecko_api/data/enumerations.dart';
import 'package:dio/dio.dart';

class CompaniesSection {
  final Dio _dio;

  const CompaniesSection(this._dio);

  ///
  /// Get public companies data.
  ///
  /// * Coingecko API ( **GET** /companies/public_treasury/{coin_id} )
  ///
  Future<CoinGeckoResult<CompaniesData?>> getCompaniesData({
    String coin_id = CompanyHoldingsCoin.bitcoin,
  }) async {
    final response = await _dio.get(
      '/companies/public_treasury/$coin_id',
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
