import 'package:coingecko_api/coingecko_result.dart';
import 'package:coingecko_api/data/coin.dart';
import 'package:coingecko_api/data/market_chart_data.dart';
import 'package:coingecko_api/helpers/helpers.dart';
import 'package:dio/dio.dart';

/// The section that brings together the requests that are related to contract tokens
class ContractSection {
  final Dio _dio;

  const ContractSection(this._dio);

  ///
  /// Get coin info from contract address.
  ///
  /// **[id]** sets asset platform identifier.
  ///
  /// **[contractAddress]** is token's contract address.
  ///
  /// Query: **/coins/{id}/contract/{contract\_address}**
  ///
  Future<CoinGeckoResult<Coin?>> getContractTokenData({
    required String id,
    required String contractAddress,
  }) async {
    final response = await _dio.get(
      '/coins/$id/contract/$contractAddress',
    );
    if (response.statusCode == 200) {
      final data = Coin.fromJson(response.data);
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
  /// Get historical market data include price, market cap, and 24h volume
  /// (granularity auto) from a contract address.
  ///
  /// **[id]** sets the id of the platform issuing tokens.
  ///
  /// **[contractAddress]** is token's contract address.
  ///
  /// **[vsCurrency]** sets the target currency of market data
  /// (usd, eur, jpy, etc.).
  ///
  /// **[days]** indicates in how many days to include information.
  /// If the parameter is not specified, the maximum possible number of days is assumed.
  ///
  /// Query: **/coins/{id}/contract/{contract\_address}/market\_chart**
  ///
  Future<CoinGeckoResult<List<MarketChartData>>> getContractMarketChart({
    required String id,
    required String contractAddress,
    required String vsCurrency,
    int? days,
  }) async {
    final Map<String, dynamic> queryParameters = {
      'vs_currency': vsCurrency,
      'days': days is int ? days : 'max',
    };
    final response = await _dio.get(
      '/coins/$id/contract/$contractAddress/market_chart',
      queryParameters: queryParameters,
    );
    if (response.statusCode == 200) {
      final list = Helpers.parseMarketChartData(response.data);
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
  /// Get historical market data include price, market cap, and 24h volume
  /// within a range of timestamp (granularity auto) from a contract address.
  ///
  /// **[id]** sets the id of the platform issuing tokens.
  ///
  /// **[contractAddress]** is token's contract address.
  ///
  /// **[vsCurrency]** sets the target currency of market data
  /// (usd, eur, jpy, etc.).
  ///
  /// **[from]** sets FROM date.
  ///
  /// **[to]** sets TO date.
  ///
  /// Query: **/coins/{id}/contract/{contract\_address}/market\_chart/range**
  ///
  Future<CoinGeckoResult<List<MarketChartData>>> getContractMarketChartRanged({
    required String id,
    required String contractAddress,
    required String vsCurrency,
    required DateTime from,
    required DateTime to,
  }) async {
    final response = await _dio.get(
      '/coins/$id/contract/$contractAddress/market_chart/range',
      queryParameters: {
        'vs_currency': vsCurrency,
        'from': from.millisecondsSinceEpoch ~/ 1000,
        'to': to.millisecondsSinceEpoch ~/ 1000,
      },
    );
    if (response.statusCode == 200) {
      final list = Helpers.parseMarketChartData(response.data);
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
