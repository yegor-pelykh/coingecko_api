import 'package:coingecko_api/coingecko_result.dart';
import 'package:coingecko_api/data/exchange_rate.dart';
import 'package:coingecko_api/helpers/convert.dart';
import 'package:dio/dio.dart';

/// The section that brings together the requests that are related to exchange rates
class ExchangeRatesSection {
  final Dio _dio;

  const ExchangeRatesSection(this._dio);

  ///
  /// Get BTC-to-Currency exchange rates.
  ///
  /// Query: **/exchange\_rates**
  ///
  Future<CoinGeckoResult<Map<String, ExchangeRate>>>
      getBtcExchangeRates() async {
    final response = await _dio.get(
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
