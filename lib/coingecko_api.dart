/// Provides simple access to the CoinGecko API (Version 3)
library coingecko_api;

import 'package:coingecko_api/helpers/coingecko_rate_limit_exception.dart';
import 'package:coingecko_api/sections/asset_platforms_section.dart';
import 'package:coingecko_api/sections/categories_section.dart';
import 'package:coingecko_api/sections/coins_section.dart';
import 'package:coingecko_api/sections/companies_section.dart';
import 'package:coingecko_api/sections/contract_section.dart';
import 'package:coingecko_api/sections/derivatives_section.dart';
import 'package:coingecko_api/sections/exchange_rates_section.dart';
import 'package:coingecko_api/sections/exchanges_section.dart';
import 'package:coingecko_api/sections/global_section.dart';
import 'package:coingecko_api/sections/indexes_section.dart';
import 'package:coingecko_api/sections/ping_section.dart';
import 'package:coingecko_api/sections/search_section.dart';
import 'package:coingecko_api/sections/simple_section.dart';
import 'package:coingecko_api/sections/trending_section.dart';
import 'package:dio/dio.dart';

/// The main class for making requests to the CoinGecko API.
class CoinGeckoApi {
  late Dio _dio;
  int _requestCount = 0;
  DateTime _firstRequest = DateTime.now();

  // sections
  late PingSection _ping;
  late SimpleSection _simple;
  late CoinsSection _coins;
  late ContractSection _contract;
  late AssetPlatformsSection _assetPlatforms;
  late CategoriesSection _categories;
  late ExchangesSection _exchanges;
  late IndexesSection _indexes;
  late DerivativesSection _derivatives;
  late ExchangeRatesSection _exchangeRates;
  late SearchSection _search;
  late TrendingSection _trending;
  late GlobalSection _global;
  late CompaniesSection _companies;

  /// The section for ping requests
  PingSection get ping => _ping;

  /// The section that brings together the requests
  /// that are related to simple coins / currencies
  SimpleSection get simple => _simple;

  /// The section that brings together the requests that are related to coins
  CoinsSection get coins => _coins;

  /// The section that brings together the requests that are related to contract tokens
  ContractSection get contract => _contract;

  /// The section that brings together the requests that are related
  /// to asset platforms
  AssetPlatformsSection get assetPlatforms => _assetPlatforms;

  /// The section that brings together the requests that are related to categories
  CategoriesSection get categories => _categories;

  /// The section that brings together the requests that are related to exchanges
  ExchangesSection get exchanges => _exchanges;

  /// The section that brings together the requests that are related to indexes
  IndexesSection get indexes => _indexes;

  /// The section that brings together the requests that are related to derivatives
  DerivativesSection get derivatives => _derivatives;

  /// The section that brings together the requests that are related to exchange rates
  ExchangeRatesSection get exchangeRates => _exchangeRates;

  /// The section that brings together the requests
  /// that are related to search
  SearchSection get search => _search;

  /// The section that brings together the requests
  /// that are related to trending stats
  TrendingSection get trending => _trending;

  /// The section that brings together the requests that are related to global information
  GlobalSection get global => _global;

  /// The section that brings together the requests that are related to companies
  CompaniesSection get companies => _companies;

  /// Sets whether logging should be enabled.
  bool enableLogging;

  ///
  /// Used to initialize the http client
  ///
  /// **[connectTimeout]** sets the timeout (milliseconds) for establishing
  /// a connection. Default is 30 seconds.
  ///
  /// **[receiveTimeout]** sets the timeout (milliseconds) for receiving data
  /// from server. Default is 10 seconds.
  ///
  /// **[rateLimitManagement]** sets whether to monitor the request per
  /// minute rate. Default is true.
  ///
  /// **[enableLogging]** sets whether logging should be enabled.
  /// Default is true.
  ///
  CoinGeckoApi({
    int connectTimeout = 30000,
    int receiveTimeout = 10000,
    bool? rateLimitManagement = true,
    this.enableLogging = true,
  }) {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.coingecko.com/api/v3',
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
        validateStatus: (code) => true,
        responseType: ResponseType.json,
      ),
    );
    if (rateLimitManagement != null) {
      _dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            _requestCount++;
            if (_requestCount == 1) {
              _firstRequest = DateTime.now();
            }
            if (_requestCount >= CoinGeckoRateLimitException.requestPerMinute &&
                DateTime.now().difference(_firstRequest).inSeconds <= 60) {
              if (rateLimitManagement == false) {
                throw new CoinGeckoRateLimitException();
              }
              while (DateTime.now().difference(_firstRequest).inSeconds <= 60) {
                if (enableLogging) {
                  print('holding all requests for 2 seconds, difference is '
                      '${DateTime.now().difference(_firstRequest).inSeconds}');
                }
                await Future.delayed(
                  Duration(seconds: 2),
                ); //hold all requests for 2 seconds.
              }
              if (enableLogging) {
                print('requests may pass');
              }
              _requestCount = 0;
            }
            return handler.next(options);
          },
        ),
      );
    }
    _ping = PingSection(_dio);
    _simple = SimpleSection(_dio);
    _coins = CoinsSection(_dio);
    _contract = ContractSection(_dio);
    _assetPlatforms = AssetPlatformsSection(_dio);
    _categories = CategoriesSection(_dio);
    _exchanges = ExchangesSection(_dio);
    _indexes = IndexesSection(_dio);
    _derivatives = DerivativesSection(_dio);
    _exchangeRates = ExchangeRatesSection(_dio);
    _search = SearchSection(_dio);
    _trending = TrendingSection(_dio);
    _global = GlobalSection(_dio);
    _companies = CompaniesSection(_dio);
  }
}
