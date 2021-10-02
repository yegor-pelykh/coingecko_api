import 'package:coingecko_api/coingecko_result.dart';
import 'package:coingecko_api/data/finance_platform.dart';
import 'package:coingecko_api/data/finance_product.dart';
import 'package:coingecko_api/helpers/convert.dart';
import 'package:dio/dio.dart';

/// The section that brings together the requests
/// that are related to finance platforms and products
class FinanceSection {
  final Dio _dio;

  const FinanceSection(this._dio);

  ///
  /// List all finance platforms.
  ///
  /// **[itemsPerPage]** sets total results per page.
  ///
  /// **[page]** sets the page of results (paginated by 100 by default).
  ///
  /// Query: **/finance\_platforms**
  ///
  Future<CoinGeckoResult<List<FinancePlatform>>> listFinancePlatforms({
    int? itemsPerPage,
    int? page,
  }) async {
    final Map<String, dynamic> queryParameters = {};
    if (itemsPerPage is int) {
      queryParameters['per_page'] = itemsPerPage;
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
  /// **[itemsPerPage]** sets total results per page.
  ///
  /// **[page]** sets the page of results (paginated by 100 by default).
  ///
  /// **[startAt]** sets start date of the financial products.
  ///
  /// **[endAt]** sets end date of the financial products.
  ///
  /// Query: **/finance\_products**
  ///
  Future<CoinGeckoResult<List<FinanceProduct>>> listFinanceProducts({
    int? itemsPerPage,
    int? page,
    DateTime? startAt,
    DateTime? endAt,
  }) async {
    final Map<String, dynamic> queryParameters = {};
    if (itemsPerPage is int) {
      queryParameters['per_page'] = itemsPerPage;
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
