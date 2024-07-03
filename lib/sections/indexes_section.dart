import 'package:coingecko_api/coingecko_result.dart';
import 'package:coingecko_api/data/market_index.dart';
import 'package:coingecko_api/data/market_index_identified.dart';
import 'package:coingecko_api/data/market_index_short.dart';
import 'package:coingecko_api/helpers/client.dart';
import 'package:coingecko_api/helpers/convert.dart';

/// The section that brings together the requests that are related to indexes
class IndexesSection {
  /// The client used to make requests to the CoinGecko API
  final Client _client;

  /// Constructs an [IndexesSection] with the given [Client].
  const IndexesSection(this._client);

  /// List all market indexes.
  ///
  /// [itemsPerPage] sets total results per page.
  ///
  /// [page] sets page through results.
  ///
  /// Query path: /indexes
  Future<CoinGeckoResult<List<MarketIndexIdentified>>> listMarketIndexes({
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
    final response = await _client.dio.get(
      '/indexes',
      queryParameters: queryParameters,
    );
    if (response.statusCode == 200) {
      final data = Convert.toList(response.data, []);
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

  /// Get market index by market id and index id.
  ///
  /// [marketId] sets the market id.
  ///
  /// [indexId] sets the index id.
  ///
  /// Query path: /indexes/{market_id}/{id}
  Future<CoinGeckoResult<MarketIndex?>> getMarketIndex({
    required String marketId,
    required String indexId,
  }) async {
    final response = await _client.dio.get(
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

  /// List market indexes id and name.
  ///
  /// Query path: /indexes/list
  Future<CoinGeckoResult<List<MarketIndexShort>>>
      listMarketIndexesShort() async {
    final response = await _client.dio.get(
      '/indexes/list',
    );
    if (response.statusCode == 200) {
      final data = Convert.toList(response.data, []);
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
