import 'package:coingecko_api/coingecko_result.dart';
import 'package:coingecko_api/data/derivative_exchange_extended.dart';
import 'package:coingecko_api/data/derivative.dart';
import 'package:coingecko_api/data/derivative_exchange.dart';
import 'package:coingecko_api/data/derivative_exchange_short.dart';
import 'package:coingecko_api/data/enumerations.dart';
import 'package:coingecko_api/helpers/client.dart';
import 'package:coingecko_api/helpers/convert.dart';

/// The section that brings together the requests that are related to derivatives
class DerivativesSection {
  /// The client used to make HTTP requests.
  final Client _client;

  /// Constructs a [DerivativesSection] with the given [Client].
  const DerivativesSection(this._client);

  /// List all derivative tickers.
  ///
  /// [includeTickers] filters tickers by expiration.
  /// Use [DerivativeTickersFilter] enumeration as values.
  /// Default is [DerivativeTickersFilter.unexpired].
  ///
  /// Query path: /derivatives
  Future<CoinGeckoResult<List<Derivative>>> listDerivatives({
    String includeTickers = DerivativeTickersFilter.unexpired,
  }) async {
    final response = await _client.dio.get(
      '/derivatives',
      queryParameters: {
        'include_tickers': includeTickers,
      },
    );
    if (response.statusCode == 200) {
      final data = Convert.toList(response.data, []);
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

  /// List all derivative exchanges.
  ///
  /// [order] sets results order.
  /// Use [DerivativeExchangesOrder] enumeration as values.
  /// Default is [DerivativeExchangesOrder.nameAscending].
  ///
  /// [itemsPerPage] sets total results per page.
  ///
  /// [page] sets page through results.
  ///
  /// Query path: /derivatives/exchanges
  Future<CoinGeckoResult<List<DerivativeExchange>>> listDerivativeExchanges({
    String order = DerivativeExchangesOrder.nameAscending,
    int? itemsPerPage,
    int? page,
  }) async {
    final Map<String, dynamic> queryParameters = {
      'order': order,
    };
    if (itemsPerPage is int) {
      queryParameters['per_page'] = itemsPerPage;
    }
    if (page is int) {
      queryParameters['page'] = page;
    }
    final response = await _client.dio.get(
      '/derivatives/exchanges',
      queryParameters: queryParameters,
    );
    if (response.statusCode == 200) {
      final data = Convert.toList(response.data, []);
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

  /// Show derivative exchange data.
  ///
  /// [id] sets the exchange identifier.
  ///
  /// [includeTickers] filters tickers by expiration.
  /// Use [DerivativeTickersFilter] enumeration as values.
  /// If null, tickers data in response will be omitted.
  ///
  /// Query path: /derivatives/exchanges/{id}
  Future<CoinGeckoResult<DerivativeExchangeExtended?>> getDerivativeExchange({
    required String id,
    String? includeTickers,
  }) async {
    final response = await _client.dio.get(
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

  /// List all derivative exchanges name and identifier.
  ///
  /// Query path: /derivatives/exchanges/list
  Future<CoinGeckoResult<List<DerivativeExchangeShort>>>
      listDerivativeExchangesShort() async {
    final response = await _client.dio.get(
      '/derivatives/exchanges/list',
    );
    if (response.statusCode == 200) {
      final data = Convert.toList(response.data, []);
      final list =
          data.map((e) => DerivativeExchangeShort.fromJson(e)).toList();
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
