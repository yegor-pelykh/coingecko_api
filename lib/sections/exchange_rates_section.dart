import 'package:coingecko_api/coingecko_result.dart';
import 'package:coingecko_api/data/exchange_rate.dart';
import 'package:coingecko_api/helpers/convert.dart';
import 'package:dio/dio.dart';

class ExchangeRatesSection {
  final Dio _dio;

  const ExchangeRatesSection(this._dio);

  ///
  /// Get BTC-to-Currency exchange rates.
  ///
  /// * Coingecko API ( **GET** /exchange_rates )
  ///
  Future<CoinGeckoResult<Map<String, ExchangeRate>>> getBtcExchangeRates() async {
    final response = await _dio.get(
      '/exchange_rates',
    );
    if (response.statusCode == 200) {
      final responseMap = Convert.toMap(response.data['rates']) ?? {};
      final map =
          responseMap.map((key, value) => MapEntry(key.toString(), ExchangeRate.fromJson(value)));
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
