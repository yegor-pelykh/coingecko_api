import 'package:coingecko_api/coingecko_result.dart';
import 'package:coingecko_api/data/enumerations.dart';
import 'package:coingecko_api/data/exchange_extended.dart';
import 'package:coingecko_api/data/exchange_short.dart';
import 'package:coingecko_api/data/exchange.dart';
import 'package:coingecko_api/data/ticker.dart';
import 'package:coingecko_api/data/exchange_volume_data.dart';
import 'package:coingecko_api/data/status_update.dart';
import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';
import 'package:dio/dio.dart';

class ExchangesSection {
  final Dio _dio;

  const ExchangesSection(this._dio);

  ///
  /// List all exchanges.
  ///
  /// * Coingecko API ( **GET** /exchanges )
  ///
  Future<CoinGeckoResult<List<Exchange>>> listExchanges({
    int page = 1,
    int perPage = 100,
  }) async {
    final response = await _dio.get(
      '/exchanges',
      queryParameters: {
        'page': page,
        'per_page': perPage,
      },
    );
    if (response.statusCode == 200) {
      final data = Convert.toList(response.data) ?? [];
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
  /// * Coingecko API ( **GET** /exchanges/list )
  ///
  Future<CoinGeckoResult<List<ExchangeShort>>> listExchangesShort() async {
    final response = await _dio.get(
      '/exchanges/list',
    );
    if (response.statusCode == 200) {
      final data = Convert.toList(response.data) ?? [];
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
  /// * Coingecko API ( **GET** /exchanges/{id} )
  ///
  Future<CoinGeckoResult<ExchangeExtended?>> getExchangeData({
    required String id,
  }) async {
    final response = await _dio.get(
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
  /// * Coingecko API ( **GET** /exchanges/{id}/tickers )
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
    if (coinIds.length > 0) {
      queryParameters['coin_ids'] = coinIds.join(',');
    }
    if (page is int) {
      queryParameters['page'] = page;
    }
    final response = await _dio.get(
      '/exchanges/$id/tickers',
      queryParameters: queryParameters,
    );
    if (response.statusCode == 200) {
      final list = Convert.toList(response.data['tickers']);
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
  /// Get status updates for a given exchange.
  ///
  /// * Coingecko API ( **GET** /exchanges/{id}/status_updates )
  ///
  Future<CoinGeckoResult<List<StatusUpdate>>> getExchangeStatusUpdates({
    required String id,
    int? perPage,
    int? page,
  }) async {
    final Map<String, dynamic> queryParameters = {};
    if (page is int) {
      queryParameters['page'] = page;
    }
    if (perPage is int) {
      queryParameters['per_page'] = perPage;
    }
    final response = await _dio.get(
      '/exchanges/$id/status_updates',
      queryParameters: queryParameters,
    );
    if (response.statusCode == 200) {
      final list = Convert.toList<dynamic>(response.data['status_updates']);
      if (list != null) {
        List<StatusUpdate> statusUpdateList = list.map((e) => StatusUpdate.fromJson(e)).toList();
        statusUpdateList.removeWhere((e) => Helpers.isDefaultDateTime(e.createdAt));
        return CoinGeckoResult(statusUpdateList);
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
  /// * Coingecko API ( **GET** /exchanges/{id}/volume_chart )
  ///
  Future<CoinGeckoResult<List<ExchangeVolumeData>>> getExchangeVolumeChartData({
    required String id,
    required int days,
  }) async {
    final response = await _dio.get(
      '/exchanges/$id/volume_chart',
      queryParameters: {
        'days': days,
      },
    );
    if (response.statusCode == 200) {
      final list = Convert.toList(response.data);
      if (list != null) {
        var volumeList = list.map((e) => ExchangeVolumeData.fromArray(e)).toList();
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
