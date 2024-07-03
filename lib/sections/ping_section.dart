import 'package:coingecko_api/coingecko_result.dart';
import 'package:coingecko_api/helpers/client.dart';
import 'package:dio/dio.dart';

/// The section for ping requests to check the API server status.
class PingSection {
  /// The client used to make HTTP requests.
  final Client _client;

  /// Creates an instance of [PingSection] with the given [Client].
  const PingSection(this._client);

  /// Check API server status.
  ///
  /// Query path: /ping
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
