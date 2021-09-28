import 'package:coingecko_api/coingecko_result.dart';
import 'package:coingecko_api/data/price_info.dart';
import 'package:coingecko_api/helpers/convert.dart';
import 'package:dio/dio.dart';

class SimpleSection {
  final Dio _dio;

  const SimpleSection(this._dio);

  ///
  /// Get the current price of any cryptocurrencies in any other supported currencies that you need.
  ///
  /// * Coingecko API ( **GET** /simple/price )
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
      final map = Convert.toMap<String, dynamic>(response.data);
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
  /// Get current price of tokens (using contract addresses) for a given platform in any other currency that you need.
  ///
  /// * Coingecko API ( **GET** /simple/token_price/{id} )
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
      final map = Convert.toMap<String, dynamic>(response.data);
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
  /// * Coingecko API ( **GET** /simple/supported_vs_currencies )
  ///
  Future<CoinGeckoResult<List<String>>> listSupportedVsCurrencies() async {
    final response = await _dio.get(
      '/simple/supported_vs_currencies',
    );
    if (response.statusCode == 200) {
      final list = Convert.toList(response.data);
      final List<String> currencyList = list != null ? list.map((e) => e.toString()).toList() : [];
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
