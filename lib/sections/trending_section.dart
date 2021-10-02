import 'package:coingecko_api/coingecko_result.dart';
import 'package:coingecko_api/data/search_trending.dart';
import 'package:dio/dio.dart';

/// The section that brings together the requests
/// that are related to trending stats
class TrendingSection {
  final Dio _dio;

  const TrendingSection(this._dio);

  ///
  /// Get trending search coins (Top-7) on CoinGecko in the last 24 hours.
  ///
  /// Query: **/search/trending**
  ///
  Future<CoinGeckoResult<SearchTrending?>> getSearchTrending() async {
    final response = await _dio.get(
      '/search/trending',
    );
    if (response.statusCode == 200) {
      final searchTrending = SearchTrending.fromJson(response.data);
      return CoinGeckoResult(searchTrending);
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
