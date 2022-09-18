import 'package:coingecko_api/coingecko_result.dart';
import 'package:coingecko_api/data/price_info.dart';
import 'package:coingecko_api/helpers/convert.dart';
import 'package:dio/dio.dart';

/// The section that brings together the requests
/// that are related to simple coins / currencies
class SimpleSection {
  final Dio _dio;

  const SimpleSection(this._dio);

  ///
  /// Get the current price of any cryptocurrencies in any other
  /// supported currencies that you need.
  ///
  /// **[ids]** sets identifiers of coins.
  ///
  /// **[vsCurrencies]** sets vs currency of coins.
  ///
  /// **[includeMarketCap]** sets whether to include market capitalization.
  /// Default is false.
  ///
  /// **[include24hVol]** sets whether to include volume in 24 hours.
  /// Default is false.
  ///
  /// **[include24hChange]** sets whether to include change in 24 hours.
  /// Default is false.
  ///
  /// **[includeLastUpdatedAt]** sets whether to include last updated date.
  /// Default is false.
  ///
  /// Query: **/simple/price**
  ///
  Future<CoinGeckoResult<List<PriceInfo>>> listPrices({
    required List<String> ids,
    required List<String> vsCurrencies,
    bool includeMarketCap = false,
    bool include24hVol = false,
    bool include24hChange = false,
    bool includeLastUpdatedAt = false,
  }) async {
    final response = await _dio.get(
      '/simple/price',
      queryParameters: {
        'ids': ids.join(','),
        'vs_currencies': vsCurrencies.join(','),
        'include_market_cap': includeMarketCap,
        'include_24hr_vol': include24hVol,
        'include_24hr_change': include24hChange,
        'include_last_updated_at': includeLastUpdatedAt
      },
    );
    if (response.statusCode == 200) {
      List<PriceInfo> priceInfo = [];
      final map = Convert.toMapN<String, dynamic>(response.data);
      if (map != null) {
        map.forEach((key, value) {
          priceInfo.add(PriceInfo.fromJson(key, value));
        });
      }
      return CoinGeckoResult(priceInfo);
    } else {
      return CoinGeckoResult(
        [],
        errorMessage: response.data,
        errorCode: response.statusCode ?? null,
        isError: true,
      );
    }
  }

  ///
  /// Get current price of tokens (using contract addresses) for
  /// a given platform in any other currency that you need.
  ///
  /// **[id]** sets the id of the platform issuing tokens.
  ///
  /// **[contractAddresses]** sets the contract addresses of tokens.
  ///
  /// **[vsCurrencies]** sets vs currencies of coins.
  ///
  /// **[includeMarketCap]** sets whether to include market capitalization.
  /// Default is false.
  ///
  /// **[include24hVol]** sets whether to include volume in 24 hours.
  /// Default is false.
  ///
  /// **[include24hChange]** sets whether to include change in 24 hours.
  /// Default is false.
  ///
  /// **[includeLastUpdatedAt]** sets whether to include last updated date.
  /// Default is false.
  ///
  /// Query: **/simple/token\_price/{id}**
  ///
  Future<CoinGeckoResult<List<PriceInfo>>> listTokenPrices({
    required String id,
    required List<String> contractAddresses,
    required List<String> vsCurrencies,
    bool includeMarketCap = false,
    bool include24hVol = false,
    bool include24hChange = false,
    bool includeLastUpdatedAt = false,
  }) async {
    final response = await _dio.get(
      '/simple/token_price/$id',
      queryParameters: {
        'contract_addresses': contractAddresses.join(','),
        'vs_currencies': vsCurrencies.join(','),
        'include_market_cap': includeMarketCap,
        'include_24hr_vol': include24hVol,
        'include_24hr_change': include24hChange,
        'include_last_updated_at': includeLastUpdatedAt
      },
    );
    if (response.statusCode == 200) {
      List<PriceInfo> priceInfo = [];
      final map = Convert.toMapN<String, dynamic>(response.data);
      if (map != null) {
        map.forEach((key, value) {
          priceInfo.add(PriceInfo.fromJson(key, value));
        });
      }
      return CoinGeckoResult(priceInfo);
    } else {
      return CoinGeckoResult(
        [],
        errorMessage: response.data,
        errorCode: response.statusCode ?? null,
        isError: true,
      );
    }
  }

  ///
  /// Get list of supported vs currencies.
  ///
  /// Query: **/simple/supported\_vs\_currencies**
  ///
  Future<CoinGeckoResult<List<String>>> listSupportedVsCurrencies() async {
    final response = await _dio.get(
      '/simple/supported_vs_currencies',
    );
    if (response.statusCode == 200) {
      final list = Convert.toListN(response.data);
      final List<String> currencyList =
          list != null ? list.map((e) => e.toString()).toList() : [];
      return CoinGeckoResult(currencyList);
    } else {
      return CoinGeckoResult(
        [],
        errorMessage: response.data,
        errorCode: response.statusCode ?? 0,
        isError: true,
      );
    }
  }
}
