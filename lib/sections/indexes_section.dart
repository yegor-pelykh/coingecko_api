import 'package:coingecko_api/coingecko_result.dart';
import 'package:coingecko_api/data/market_index.dart';
import 'package:coingecko_api/data/market_index_identified.dart';
import 'package:coingecko_api/data/market_index_short.dart';
import 'package:coingecko_api/helpers/convert.dart';
import 'package:dio/dio.dart';

class IndexesSection {
  final Dio _dio;

  const IndexesSection(this._dio);

  ///
  /// List all market indexes.
  ///
  /// * Coingecko API ( **GET** /indexes )
  ///
  Future<CoinGeckoResult<List<MarketIndexIdentified>>> listMarketIndexes({
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
      '/indexes',
      queryParameters: queryParameters,
    );
    if (response.statusCode == 200) {
      final data = Convert.toList(response.data) ?? [];
      final list = data.map((e) => MarketIndexIdentified.fromJson(e)).toList();
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
  /// Get market index by market id and index id.
  ///
  /// * Coingecko API ( **GET** /indexes/{market_id}/{id} )
  ///
  Future<CoinGeckoResult<MarketIndex?>> getMarketIndex({
    required String marketId,
    required String indexId,
  }) async {
    final response = await _dio.get(
      '/indexes/$marketId/$indexId',
    );
    if (response.statusCode == 200) {
      final data = MarketIndex.fromJson(response.data);
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
  /// list market indexes id and name.
  ///
  /// * Coingecko API ( **GET** /indexes/list )
  ///
  Future<CoinGeckoResult<List<MarketIndexShort>>> listMarketIndexesShort() async {
    final response = await _dio.get(
      '/indexes/list',
    );
    if (response.statusCode == 200) {
      final data = Convert.toList(response.data) ?? [];
      final list = data.map((e) => MarketIndexShort.fromJson(e)).toList();
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
