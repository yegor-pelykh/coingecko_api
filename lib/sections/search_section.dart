import 'package:coingecko_api/coingecko_result.dart';
import 'package:coingecko_api/data/search_results.dart';
import 'package:dio/dio.dart';

/// The section that brings together the requests
/// that are related to search
class SearchSection {
  final Dio _dio;

  const SearchSection(this._dio);

  ///
  /// Search for coins, categories and markets listed on CoinGecko
  /// ordered by largest Market Cap first.
  ///
  /// Query: **/search**
  ///
  Future<CoinGeckoResult<SearchResults?>> searchFor({
    required String query,
  }) async {
    final response = await _dio.get(
      '/search',
      queryParameters: {
        'query': query,
      },
    );
    if (response.statusCode == 200) {
      final searchResults = SearchResults.fromJson(response.data);
      return CoinGeckoResult(searchResults);
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
