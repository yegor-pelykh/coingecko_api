import 'package:coingecko_api/coingecko_result.dart';
import 'package:coingecko_api/data/coin.dart';
import 'package:coingecko_api/data/coin_history.dart';
import 'package:coingecko_api/data/coin_short.dart';
import 'package:coingecko_api/data/enumerations.dart';
import 'package:coingecko_api/data/ticker.dart';
import 'package:coingecko_api/data/market.dart';
import 'package:coingecko_api/data/market_chart_data.dart';
import 'package:coingecko_api/data/ohlc_info.dart';
import 'package:coingecko_api/data/status_update.dart';
import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class CoinsSection {
  final Dio _dio;

  const CoinsSection(this._dio);

  ///
  /// List all supported coins id, name and symbol.
  ///
  /// * Coingecko API ( **GET** /coins/list )
  ///
  Future<CoinGeckoResult<List<CoinShort>>> listCoins({
    bool includePlatformFlag = false,
  }) async {
    final response = await _dio.get(
      '/coins/list',
      queryParameters: {
        'include_platform': includePlatformFlag,
      },
    );
    if (response.statusCode == 200) {
      List<CoinShort> coinList = [];
      for (dynamic coinJson in response.data) {
        coinList.add(CoinShort.fromJson(coinJson));
      }
      return CoinGeckoResult(coinList);
    } else {
      return CoinGeckoResult(
        [],
        errorMessage: response.data,
        errorCode: response.statusCode ?? 0,
        isError: true,
      );
    }
  }

  ///
  /// List all supported coins price, market cap, volume, and market related data.
  ///
  /// * Coingecko API ( **GET** /coins/markets )
  ///
  Future<CoinGeckoResult<List<Market>>> listCoinMarkets({
    required String vsCurrency,
    List<String> coinIds = const [],
    String category = 'all',
    String order = CoinMarketsOrder.marketCapDescending,
    int itemsPerPage = 100,
    int page = 1,
    bool sparkline = false,
    List<String> priceChangePercentage = const [],
  }) async {
    final Map<String, dynamic> queryParameters = {
      'vs_currency': vsCurrency,
      'order': order,
      'per_page': itemsPerPage,
      'page': page,
      'sparkline': sparkline,
    };
    if (category != 'all') {
      queryParameters['category'] = category;
    }
    if (coinIds.isNotEmpty) {
      queryParameters['ids'] = coinIds.join(',');
    }
    if (priceChangePercentage.isNotEmpty) {
      queryParameters['price_change_percentage'] = priceChangePercentage.join(',');
    }
    final response = await _dio.get(
      '/coins/markets',
      queryParameters: queryParameters,
    );
    if (response.statusCode == 200) {
      final list = Convert.toList(response.data);
      final List<Market> marketList =
          list != null ? list.map((element) => Market.fromJson(element)).toList() : [];
      return CoinGeckoResult(marketList);
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
  /// Get current data (name, price, market, ... including exchange tickers) for a coin.
  ///
  /// * Coingecko API ( **GET** /coins/{id} )
  ///
  Future<CoinGeckoResult<Coin?>> getCoinData({
    required String id,
    bool localization = true,
    bool tickers = true,
    bool marketData = true,
    bool communityData = true,
    bool developerData = true,
    bool sparkline = false,
  }) async {
    final response = await _dio.get(
      '/coins/$id',
      queryParameters: {
        'localization': localization,
        'tickers': tickers,
        'market_data': marketData,
        'community_data': communityData,
        'developer_data': developerData,
        'sparkline': sparkline,
      },
    );
    if (response.statusCode == 200) {
      final data = Coin.fromJson(response.data);
      return CoinGeckoResult(data);
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
  /// Get coin tickers (paginated to 100 items).
  ///
  /// Coingecko API ( **GET /coins/{id}/tickers** )
  ///
  Future<CoinGeckoResult<List<Ticker>>> listCoinTickers({
    required String id,
    List<String> exchangeIds = const [],
    bool includeExchangeLogo = true,
    int page = 1,
    String order = TickersOrder.trustScoreDescending,
    bool depth = true,
  }) async {
    final response = await _dio.get(
      '/coins/$id/tickers',
      queryParameters: {
        'id': id,
        'exchange_ids': exchangeIds,
        'include_exchange_logo': includeExchangeLogo,
        'page': page,
        'order': order,
        'depth': depth,
      },
    );
    if (response.statusCode == 200) {
      final jsonTickers = Convert.toList(response.data['tickers']);
      final List<Ticker> tickers =
          jsonTickers != null ? jsonTickers.map((e) => Ticker.fromJson(e)).toList() : [];
      return CoinGeckoResult(tickers);
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
  /// Get historical data (name, price, market, stats) at a given date for a coin.
  ///
  /// * Coingecko API ( **GET** /coins/{id}/history )
  ///
  Future<CoinGeckoResult<CoinHistory?>> getCoinHistory({
    required String id,
    required DateTime date,
    bool localization = true,
  }) async {
    final dateFormatted = DateFormat('dd-MM-yyyy').format(date);
    final response = await _dio.get(
      '/coins/$id/history',
      queryParameters: {
        'date': dateFormatted,
        'localization': localization,
      },
    );
    if (response.statusCode == 200) {
      return CoinGeckoResult(CoinHistory.fromJson(response.data));
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
  /// Get historical market data include price, market cap, and 24h volume (granularity auto).
  ///
  /// * Coingecko API ( **GET** /coins/{id}/market_chart )
  ///
  Future<CoinGeckoResult<List<MarketChartData>>> getCoinMarketChart({
    required String id,
    required String vsCurrency,
    required int days,
    String? interval,
  }) async {
    final Map<String, dynamic> queryParameters = {
      'vs_currency': vsCurrency,
      'days': days,
    };
    if (interval is String) {
      queryParameters['interval'] = interval;
    }
    final response = await _dio.get(
      '/coins/$id/market_chart',
      queryParameters: queryParameters,
    );
    if (response.statusCode == 200) {
      final list = Helpers.parseMarketChartData(response.data);
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
  /// Get historical market data include price, market cap, and 24h volume within a range of timestamp (granularity auto).
  ///
  /// * Coingecko API ( **GET** /coins/{id}/market_chart/range )
  ///
  Future<CoinGeckoResult<List<MarketChartData>>> getCoinMarketChartRanged({
    required String id,
    required String vsCurrency,
    required DateTime from,
    required DateTime to,
  }) async {
    final response = await _dio.get(
      '/coins/$id/market_chart/range',
      queryParameters: {
        'vs_currency': vsCurrency,
        'from': from.millisecondsSinceEpoch ~/ 1000,
        'to': to.millisecondsSinceEpoch ~/ 1000,
      },
    );
    if (response.statusCode == 200) {
      final list = Helpers.parseMarketChartData(response.data);
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
  /// Get status updates for a given coin.
  ///
  /// * Coingecko API ( **GET** /coins/{id}/status_updates )
  ///
  Future<CoinGeckoResult<List<StatusUpdate>>> listCoinStatusUpdates({
    required String id,
    int? page,
    int? perPage,
  }) async {
    final Map<String, dynamic> queryParameters = {};
    if (page is int) {
      queryParameters['page'] = page;
    }
    if (perPage is int) {
      queryParameters['per_page'] = perPage;
    }
    final response = await _dio.get(
      '/coins/$id/status_updates',
      queryParameters: queryParameters,
    );
    if (response.statusCode == 200) {
      final data = Convert.toList(response.data['status_updates']) ?? [];
      final list = data.map((e) => StatusUpdate.fromJson(e)).toList();
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
  /// Get coin's OHLC.
  ///
  /// * Coingecko API ( **GET** /coins/{id}/ohlc )
  ///
  Future<CoinGeckoResult<List<OHLCInfo>>> getCoinOHLC({
    required String id,
    required String vsCurrency,
    required int days,
  }) async {
    final response = await _dio.get(
      '/coins/$id/ohlc',
      queryParameters: {
        'vs_currency': vsCurrency,
        'days': days,
      },
    );
    if (response.statusCode == 200) {
      final data = Convert.toList(response.data) ?? [];
      final list = data.map((e) => OHLCInfo.fromArray(e)).toList();
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
}
