import 'package:coingecko_api/coingecko_result.dart';
import 'package:coingecko_api/data/enumerations.dart';
import 'package:coingecko_api/data/exchange_extended.dart';
import 'package:coingecko_api/data/exchange_short.dart';
import 'package:coingecko_api/data/exchange.dart';
import 'package:coingecko_api/data/ticker.dart';
import 'package:coingecko_api/data/exchange_volume_data.dart';
import 'package:coingecko_api/helpers/client.dart';
import 'package:coingecko_api/helpers/convert.dart';

/// The section that brings together the requests that are related to exchanges
class ExchangesSection {
  final Client _client;

  const ExchangesSection(this._client);

  ///
  /// List all exchanges.
  ///
  /// **[itemsPerPage]** sets total results per page. Default is 100.
  ///
  /// **[page]** sets page through results. Default is 1.
  ///
  /// Query: **/exchanges**
  ///
  Future<CoinGeckoResult<List<Exchange>>> listExchanges({
    int itemsPerPage = 100,
    int page = 1,
  }) async {
    final response = await _client.dio.get(
      '/exchanges',
      queryParameters: {
        'per_page': itemsPerPage,
        'page': page,
      },
    );
    if (response.statusCode == 200) {
      final data = Convert.toList(response.data, []);
      final list = data.map((e) => Exchange.fromJson(e)).toList();
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

  ///
  /// List all supported exchanges: id and name.
  ///
  /// Query: **/exchanges/list**
  ///
  Future<CoinGeckoResult<List<ExchangeShort>>> listExchangesShort() async {
    final response = await _client.dio.get(
      '/exchanges/list',
    );
    if (response.statusCode == 200) {
      final data = Convert.toList(response.data, []);
      final list = data.map((e) => ExchangeShort.fromJson(e)).toList();
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

  ///
  /// Get exchange volume in BTC and top 100 tickers only.
  ///
  /// **[id]** sets the exchange id.
  ///
  /// Query: **/exchanges/{id}**
  ///
  Future<CoinGeckoResult<ExchangeExtended?>> getExchangeData({
    required String id,
  }) async {
    final response = await _client.dio.get(
      '/exchanges/$id',
    );
    if (response.statusCode == 200) {
      final info = ExchangeExtended.fromJson(response.data);
      return CoinGeckoResult(info);
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
  /// Get exchange tickers (paginated, 100 tickers per page).
  ///
  /// **[id]** sets the exchange id.
  ///
  /// **[coinIds]** filters tickers by coin identifiers.
  ///
  /// **[page]** sets page through results.
  ///
  /// **[includeExchangeLogo]** sets whether to include exchange logo.
  /// Default is false.
  ///
  /// **[depth]** sets whether to include 2% orderbook depth. Default is false.
  ///
  /// **[order]** sets tickers order. Use [TickersOrder] enumeration
  /// as values. Default is [TickersOrder.trustScoreDescending].
  ///
  /// Query: **/exchanges/{id}/tickers**
  ///
  Future<CoinGeckoResult<List<Ticker>>> getExchangeTickers({
    required String id,
    List<String> coinIds = const [],
    int? page,
    bool includeExchangeLogo = false,
    bool depth = false,
    String order = TickersOrder.trustScoreDescending,
  }) async {
    final Map<String, dynamic> queryParameters = {
      'include_exchange_logo': includeExchangeLogo,
      'depth': depth,
      'order': order,
    };
    if (coinIds.isNotEmpty) {
      queryParameters['coin_ids'] = coinIds.join(',');
    }
    if (page is int) {
      queryParameters['page'] = page;
    }
    final response = await _client.dio.get(
      '/exchanges/$id/tickers',
      queryParameters: queryParameters,
    );
    if (response.statusCode == 200) {
      final list = Convert.toListN(response.data['tickers']);
      if (list != null) {
        final tickerList = list.map((e) => Ticker.fromJson(e)).toList();
        return CoinGeckoResult(tickerList);
      } else {
        return CoinGeckoResult([]);
      }
    } else {
      return CoinGeckoResult(
        [],
        errorCode: response.statusCode ?? null,
        errorMessage: '${response.statusMessage} - ${response.data.toString()}',
        isError: true,
      );
    }
  }

  ///
  /// Get volume_chart data for a given exchange.
  ///
  /// **[id]** sets the exchange id.
  ///
  /// **[days]** indicates in how many days to include information.
  ///
  /// Query: **/exchanges/{id}/volume\_chart**
  ///
  Future<CoinGeckoResult<List<ExchangeVolumeData>>> getExchangeVolumeChartData({
    required String id,
    required int days,
  }) async {
    final response = await _client.dio.get(
      '/exchanges/$id/volume_chart',
      queryParameters: {
        'days': days,
      },
    );
    if (response.statusCode == 200) {
      final list = Convert.toListN(response.data);
      if (list != null) {
        var volumeList =
            list.map((e) => ExchangeVolumeData.fromArray(e)).toList();
        volumeList.removeWhere((e) => e.date.millisecondsSinceEpoch == 0);
        return CoinGeckoResult(volumeList);
      } else {
        return CoinGeckoResult([]);
      }
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
