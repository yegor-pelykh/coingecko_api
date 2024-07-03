import 'package:coingecko_api/coingecko_result.dart';
import 'package:coingecko_api/data/coin.dart';
import 'package:coingecko_api/data/coin_history.dart';
import 'package:coingecko_api/data/coin_short.dart';
import 'package:coingecko_api/data/enumerations.dart';
import 'package:coingecko_api/data/ticker.dart';
import 'package:coingecko_api/data/market.dart';
import 'package:coingecko_api/data/market_chart_data.dart';
import 'package:coingecko_api/data/ohlc_info.dart';
import 'package:coingecko_api/helpers/client.dart';
import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';
import 'package:intl/intl.dart';

/// The section that brings together the requests that are related to coins
class CoinsSection {
  /// The client used to make requests to the CoinGecko API.
  final Client _client;

  /// Constructs a [CoinsSection] with the given [Client].
  const CoinsSection(this._client);

  /// List all supported coins id, name and symbol.
  ///
  /// [includePlatforms] sets whether platform information
  /// should be included. Default is false.
  ///
  /// Query path: /coins/list
  Future<CoinGeckoResult<List<CoinShort>>> listCoins({
    bool includePlatforms = false,
  }) async {
    final response = await _client.dio.get(
      '/coins/list',
      queryParameters: {
        'include_platform': includePlatforms,
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
        errorMessage: response.data.toString(),
        errorCode: response.statusCode ?? 0,
        isError: true,
      );
    }
  }

  /// List all supported coins price, market cap, volume,
  /// and market related data.
  ///
  /// [vsCurrency] sets the target currency of market data
  /// (usd, eur, jpy, etc.).
  ///
  /// [coinIds] sets the ids of the coins (cryptocurrency symbols).
  ///
  /// [category] filters by coin category.
  ///
  /// [order] sorts results by field. Use [CoinMarketsOrder] enumeration
  /// as values. Default is [CoinMarketsOrder.marketCapDescending]
  ///
  /// [itemsPerPage] sets total results per page. Default is 100.
  ///
  /// [page] sets page through results. Default is 1.
  ///
  /// [sparkline] sets whether sparkline in 7 days should be included.
  /// Default is false.
  ///
  /// [priceChangePercentageIntervals] sets the intervals
  /// at which the price change percentage should be included.
  /// Use [PriceChangeInterval] enumeration as values.
  ///
  /// Query path: /coins/markets
  Future<CoinGeckoResult<List<Market>>> listCoinMarkets({
    required String vsCurrency,
    List<String> coinIds = const [],
    String category = 'all',
    String order = CoinMarketsOrder.marketCapDescending,
    int itemsPerPage = 100,
    int page = 1,
    bool sparkline = false,
    List<String> priceChangePercentageIntervals = const [],
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
    if (priceChangePercentageIntervals.isNotEmpty) {
      queryParameters['price_change_percentage'] =
          priceChangePercentageIntervals.join(',');
    }
    final response = await _client.dio.get(
      '/coins/markets',
      queryParameters: queryParameters,
    );
    if (response.statusCode == 200) {
      final list = Convert.toListN(response.data);
      final List<Market> marketList = list != null
          ? list.map((element) => Market.fromJson(element)).toList()
          : [];
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

  /// Get current data (name, price, market, ... including exchange tickers)
  /// for a coin.
  ///
  /// [id] sets coin id.
  ///
  /// [localization] sets whether to include all localized
  /// languages in response. Default is true.
  ///
  /// [tickers] sets whether to include tickers data. Default is true.
  ///
  /// [marketData] sets whether to include market data. Default is true.
  ///
  /// [communityData] sets whether to include community data.
  /// Default is true.
  ///
  /// [developerData] sets whether to include developer data.
  /// Default is true.
  ///
  /// [sparkline] sets whether to include sparkline. Default is false.
  ///
  /// Query path: /coins/{id}
  Future<CoinGeckoResult<Coin?>> getCoinData({
    required String id,
    bool localization = true,
    bool tickers = true,
    bool marketData = true,
    bool communityData = true,
    bool developerData = true,
    bool sparkline = false,
  }) async {
    final response = await _client.dio.get(
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

  /// Get coin tickers (paginated to 100 items).
  ///
  /// [id] sets coin id.
  ///
  /// [exchangeIds] filters results by exchange ids.
  ///
  /// [includeExchangeLogo] sets whether to include exchange logo.
  /// Default is true.
  ///
  /// [page] sets page through results. Default is 1.
  ///
  /// [order] sets tickers order. Use [TickersOrder] enumeration
  /// as values. Default is [TickersOrder.trustScoreDescending].
  ///
  /// [depth] sets whether to include 2% orderbook depth. Default is true.
  ///
  /// Query path: /coins/{id}/tickers
  Future<CoinGeckoResult<List<Ticker>>> listCoinTickers({
    required String id,
    List<String> exchangeIds = const [],
    bool includeExchangeLogo = true,
    int page = 1,
    String order = TickersOrder.trustScoreDescending,
    bool depth = true,
  }) async {
    final response = await _client.dio.get(
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
      final jsonTickers = Convert.toListN(response.data['tickers']);
      final List<Ticker> tickers = jsonTickers != null
          ? jsonTickers.map((e) => Ticker.fromJson(e)).toList()
          : [];
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

  /// Get historical data (name, price, market, stats) at a given
  /// date for a coin.
  ///
  /// [id] sets coin id.
  ///
  /// [date] sets the date of data snapshot.
  ///
  /// [localization] sets whether to include all localized
  /// languages in response. Default is true.
  ///
  /// Query path: /coins/{id}/history
  Future<CoinGeckoResult<CoinHistory?>> getCoinHistory({
    required String id,
    required DateTime date,
    bool localization = true,
  }) async {
    final dateFormatted = DateFormat('dd-MM-yyyy').format(date);
    final response = await _client.dio.get(
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

  /// Get historical market data include price, market cap
  /// and 24h volume (granularity auto).
  ///
  /// [id] sets coin id.
  ///
  /// [vsCurrency] sets the target currency of market data
  /// (usd, eur, jpy, etc.).
  ///
  /// [days] indicates in how many days to include information.
  /// If the parameter is not specified, the maximum possible number of days is assumed.
  ///
  /// [interval] sets data interval. Use [CoinMarketChartInterval]
  /// enumeration as values.
  ///
  /// Query path: /coins/{id}/market_chart
  Future<CoinGeckoResult<List<MarketChartData>>> getCoinMarketChart({
    required String id,
    required String vsCurrency,
    int? days,
    String? interval,
  }) async {
    final Map<String, dynamic> queryParameters = {
      'vs_currency': vsCurrency,
      'days': days is int ? days : 'max',
    };
    if (interval is String) {
      queryParameters['interval'] = interval;
    }
    final response = await _client.dio.get(
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

  /// Get historical market data include price, market cap
  /// and 24h volume within a range of timestamp (granularity auto).
  ///
  /// [id] sets coin id.
  ///
  /// [vsCurrency] sets the target currency of market data
  /// (usd, eur, jpy, etc.).
  ///
  /// [from] sets FROM date.
  ///
  /// [to] sets TO date.
  ///
  /// Query path: /coins/{id}/market_chart/range
  Future<CoinGeckoResult<List<MarketChartData>>> getCoinMarketChartRanged({
    required String id,
    required String vsCurrency,
    required DateTime from,
    required DateTime to,
  }) async {
    final response = await _client.dio.get(
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

  /// Get coin's OHLC.
  ///
  /// [id] sets coin id.
  ///
  /// [vsCurrency] sets the target currency of market data
  /// (usd, eur, jpy, etc.).
  ///
  /// [days] indicates in how many days to include information.
  /// If the parameter is not specified, the maximum possible number of days is assumed.
  ///
  /// Query path: /coins/{id}/ohlc
  Future<CoinGeckoResult<List<OHLCInfo>>> getCoinOHLC({
    required String id,
    required String vsCurrency,
    int? days,
  }) async {
    final Map<String, dynamic> queryParameters = {
      'vs_currency': vsCurrency,
      'days': days is int ? days : 'max',
    };
    final response = await _client.dio.get(
      '/coins/$id/ohlc',
      queryParameters: queryParameters,
    );
    if (response.statusCode == 200) {
      final data = Convert.toList(response.data, []);
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
