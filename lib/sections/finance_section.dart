import 'package:coingecko_api/coingecko_result.dart';
import 'package:coingecko_api/data/finance_platform.dart';
import 'package:coingecko_api/data/finance_product.dart';
import 'package:coingecko_api/helpers/convert.dart';
import 'package:dio/dio.dart';

class FinanceSection {
  final Dio _dio;

  const FinanceSection(this._dio);

  ///
  /// List all finance platforms.
  ///
  /// * Coingecko API ( **GET** /finance_platforms )
  ///
  Future<CoinGeckoResult<List<FinancePlatform>>> listFinancePlatforms({
    int? perPage,
    int? page,
  }) async {
    final Map<String, dynamic> queryParameters = {};
    if (perPage is int) {
      queryParameters['per_page'] = perPage;
    }
    if (page is int) {
      queryParameters['page'] = page;
    }
    final response = await _dio.get(
      '/finance_platforms',
      queryParameters: queryParameters,
    );
    if (response.statusCode == 200) {
      final data = Convert.toList(response.data) ?? [];
      final list = data.map((e) => FinancePlatform.fromJson(e)).toList();
      return CoinGeckoResult(list);
    } else {
      return CoinGeckoResult(
        [],
        errorCode: response.statusCode ?? null,
        errorMessage: '${response.statusMessage} - ${response.data.toString()}',
        isError: true,
      );
    }
  }

  ///
  /// List all finance products.
  ///
  /// * Coingecko API ( **GET** /finance_products )
  ///
  Future<CoinGeckoResult<List<FinanceProduct>>> listFinanceProducts({
    int? perPage,
    int? page,
    DateTime? startAt,
    DateTime? endAt,
  }) async {
    final Map<String, dynamic> queryParameters = {};
    if (perPage is int) {
      queryParameters['per_page'] = perPage;
    }
    if (page is int) {
      queryParameters['page'] = page;
    }
    if (startAt is DateTime) {
      queryParameters['start_at'] = startAt.millisecondsSinceEpoch ~/ 1000;
    }
    if (endAt is DateTime) {
      queryParameters['end_at'] = endAt.millisecondsSinceEpoch ~/ 1000;
    }
    final response = await _dio.get(
      '/finance_products',
      queryParameters: queryParameters,
    );
    if (response.statusCode == 200) {
      final data = Convert.toList(response.data) ?? [];
      final list = data.map((e) => FinanceProduct.fromJson(e)).toList();
      return CoinGeckoResult(list);
    } else {
      return CoinGeckoResult(
        [],
        errorCode: response.statusCode ?? null,
        errorMessage: '${response.statusMessage} - ${response.data.toString()}',
        isError: true,
      );
    }
  }
}
