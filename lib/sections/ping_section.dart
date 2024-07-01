import 'package:coingecko_api/coingecko_result.dart';
import 'package:coingecko_api/helpers/client.dart';
import 'package:dio/dio.dart';

/// The section for ping requests
class PingSection {
  final Client _client;

  const PingSection(this._client);

  ///
  /// Check API server status.
  ///
  /// Query: **/ping**
  ///
  Future<CoinGeckoResult<bool>> ping() async {
    final response = await _client.dio.get(
      '/ping',
      options: Options(contentType: 'application/json'),
    );
    return CoinGeckoResult(
      response.statusCode == 200,
      errorCode: response.statusCode ?? null,
      errorMessage: '${response.statusMessage} - ${response.data.toString()}',
      isError: response.statusCode != 200,
    );
  }
}
