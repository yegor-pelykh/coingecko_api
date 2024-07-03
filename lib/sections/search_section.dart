import 'package:coingecko_api/coingecko_result.dart';
import 'package:coingecko_api/data/search_results.dart';
import 'package:coingecko_api/helpers/client.dart';

/// The section that brings together the requests
/// that are related to search.
class SearchSection {
  /// The client used to make HTTP requests.
  final Client _client;

  /// Constructs a [SearchSection] with the given [Client].
  const SearchSection(this._client);

  /// Search for coins, categories, and markets listed on CoinGecko
  /// ordered by largest Market Cap first.
  ///
  /// [query]: The search query string.
  ///
  /// Query path: /search
  ///
  Future<CoinGeckoResult<SearchResults?>> searchFor({
    required String query,
  }) async {
    final response = await _client.dio.get(
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
