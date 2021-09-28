import 'package:coingecko_api/coingecko_result.dart';
import 'package:coingecko_api/data/derivative_exchange_extended.dart';
import 'package:coingecko_api/data/derivative.dart';
import 'package:coingecko_api/data/derivative_exchange.dart';
import 'package:coingecko_api/data/derivative_exchange_short.dart';
import 'package:coingecko_api/data/enumerations.dart';
import 'package:coingecko_api/helpers/convert.dart';
import 'package:dio/dio.dart';

class DerivativesSection {
  final Dio _dio;

  const DerivativesSection(this._dio);

  ///
  /// List all derivative tickers.
  ///
  /// * Coingecko API ( **GET** /derivatives )
  ///
  Future<CoinGeckoResult<List<Derivative>>> listDerivatives({
    String includeTickers = DerivativeTickersFilter.unexpired,
  }) async {
    final response = await _dio.get(
      '/derivatives',
      queryParameters: {
        'include_tickers': includeTickers,
      },
    );
    if (response.statusCode == 200) {
      final data = Convert.toList(response.data) ?? [];
      final list = data.map((e) => Derivative.fromJson(e)).toList();
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
  /// List all derivative exchanges.
  ///
  /// * Coingecko API ( **GET** /derivatives/exchanges )
  ///
  Future<CoinGeckoResult<List<DerivativeExchange>>> listDerivativeExchanges({
    String? order,
    int? perPage,
    int? page,
  }) async {
    final Map<String, dynamic> queryParameters = {};
    if (order is String) {
      queryParameters['order'] = order;
    }
    if (perPage is int) {
      queryParameters['per_page'] = perPage;
    }
    if (page is int) {
      queryParameters['page'] = page;
    }
    final response = await _dio.get(
      '/derivatives/exchanges',
      queryParameters: queryParameters,
    );
    if (response.statusCode == 200) {
      final data = Convert.toList(response.data) ?? [];
      final list = data.map((e) => DerivativeExchange.fromJson(e)).toList();
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
  /// Show derivative exchange data.
  ///
  /// * Coingecko API ( **GET** /derivatives/exchanges/{id} )
  ///
  Future<CoinGeckoResult<DerivativeExchangeExtended?>> getDerivativeExchange({
    required String id,
    String? includeTickers,
  }) async {
    final response = await _dio.get(
      '/derivatives/exchanges/$id',
      queryParameters: {
        'include_tickers': includeTickers,
      },
    );
    if (response.statusCode == 200) {
      final data = DerivativeExchangeExtended.fromJson(response.data);
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

  ///
  /// List all derivative exchanges name and identifier.
  ///
  /// * Coingecko API ( **GET** /derivatives/exchanges/list )
  ///
  Future<CoinGeckoResult<List<DerivativeExchangeShort>>> listDerivativeExchangesShort() async {
    final response = await _dio.get(
      '/derivatives/exchanges/list',
    );
    if (response.statusCode == 200) {
      final data = Convert.toList(response.data) ?? [];
      final list = data.map((e) => DerivativeExchangeShort.fromJson(e)).toList();
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
