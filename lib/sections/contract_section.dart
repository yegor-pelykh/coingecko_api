import 'package:coingecko_api/coingecko_result.dart';
import 'package:coingecko_api/data/coin.dart';
import 'package:coingecko_api/data/market_chart_data.dart';
import 'package:coingecko_api/helpers/helpers.dart';
import 'package:dio/dio.dart';

class ContractSection {
  final Dio _dio;

  const ContractSection(this._dio);

  ///
  /// Get coin info from contract address.
  ///
  /// * Coingecko API ( **GET** /coins/{id}/contract/{contract_address} )
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
  /// * Coingecko API ( **GET** /coins/{id}/contract/{contract_address}/market_chart )
  ///
  Future<CoinGeckoResult<List<MarketChartData>>> getContractMarketChart({
    required String id,
    required String contractAddress,
    required String vsCurrency,
    required int days,
  }) async {
    final response = await _dio.get(
      '/coins/$id/contract/$contractAddress/market_chart',
      queryParameters: {
        'vs_currency': vsCurrency,
        'days': days,
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

  ///
  /// Get historical market data include price, market cap, and 24h volume
  /// within a range of timestamp (granularity auto) from a contract address.
  ///
  /// * Coingecko API ( **GET** /coins/{id}/contract/{contract_address}/market_chart/range )
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
