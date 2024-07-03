import 'package:coingecko_api/coingecko_result.dart';
import 'package:coingecko_api/data/exchange_rate.dart';
import 'package:coingecko_api/helpers/client.dart';
import 'package:coingecko_api/helpers/convert.dart';

/// The section that brings together the requests that are related to exchange rates.
class ExchangeRatesSection {
  /// The client used to make HTTP requests.
  final Client _client;

  /// Constructs an instance of [ExchangeRatesSection] with the given [Client].
  const ExchangeRatesSection(this._client);

  /// Get BTC-to-Currency exchange rates.
  ///
  /// Query path: /exchange_rates
  ///
  /// Returns a [Future] that completes with a [CoinGeckoResult] containing a map of [ExchangeRate] objects.
  Future<CoinGeckoResult<Map<String, ExchangeRate>>>
      getBtcExchangeRates() async {
    final response = await _client.dio.get(
      '/exchange_rates',
    );
    if (response.statusCode == 200) {
      final responseMap = Convert.toMapN(response.data['rates']) ?? {};
      final map = responseMap.map((key, value) =>
          MapEntry(key.toString(), ExchangeRate.fromJson(value)));
      return CoinGeckoResult(map);
    } else {
      return CoinGeckoResult(
        {},
        errorCode: response.statusCode ?? null,
        errorMessage: '${response.statusMessage} - ${response.data.toString()}',
        isError: true,
      );
    }
  }
}
