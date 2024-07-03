import 'package:coingecko_api/coingecko_result.dart';
import 'package:coingecko_api/data/global_coin_data.dart';
import 'package:coingecko_api/data/global_defi_data.dart';
import 'package:coingecko_api/helpers/client.dart';
import 'package:coingecko_api/helpers/convert.dart';

/// The section that brings together the requests that are related to global information
class GlobalSection {
  /// The client used to make HTTP requests.
  final Client _client;

  /// Creates an instance of [GlobalSection] with the given [Client].
  const GlobalSection(this._client);

  /// Get cryptocurrency global data.
  ///
  /// Query path: /global
  Future<CoinGeckoResult<GlobalCoinData?>> getGlobalData() async {
    final response = await _client.dio.get(
      '/global',
    );
    if (response.statusCode == 200) {
      final data = Convert.toMapN<String, dynamic>(response.data['data']);
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

  /// Get cryptocurrency global decentralized finance (defi) data.
  ///
  /// Query path: /global/decentralized_finance_defi
  Future<CoinGeckoResult<GlobalDefiData?>> getGlobalDefiData() async {
    final response = await _client.dio.get(
      '/global/decentralized_finance_defi',
    );
    if (response.statusCode == 200) {
      final data = Convert.toMapN<String, dynamic>(response.data['data']);
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
