import 'package:coingecko_api/coingecko_result.dart';
import 'package:coingecko_api/data/global_coin_data.dart';
import 'package:coingecko_api/data/global_defi_data.dart';
import 'package:coingecko_api/helpers/convert.dart';
import 'package:dio/dio.dart';

/// The section that brings together the requests that are related to global information
class GlobalSection {
  final Dio _dio;

  const GlobalSection(this._dio);

  ///
  /// Get cryptocurrency global data.
  ///
  /// Query: **/global**
  ///
  Future<CoinGeckoResult<GlobalCoinData?>> getGlobalData() async {
    final response = await _dio.get(
      '/global',
    );
    if (response.statusCode == 200) {
      final data = Convert.toMap<String, dynamic>(response.data['data']);
      final result = data != null ? GlobalCoinData.fromJson(data) : null;
      return CoinGeckoResult(result);
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
  /// Get cryptocurrency global decentralized finance (defi) data.
  ///
  /// Query: **/global/decentralized\_finance\_defi**
  ///
  Future<CoinGeckoResult<GlobalDefiData?>> getGlobalDefiData() async {
    final response = await _dio.get(
      '/global/decentralized_finance_defi',
    );
    if (response.statusCode == 200) {
      final data = Convert.toMap<String, dynamic>(response.data['data']);
      final result = data != null ? GlobalDefiData.fromJson(data) : null;
      return CoinGeckoResult(result);
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
