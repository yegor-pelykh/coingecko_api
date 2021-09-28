library coingecko_api;

import 'package:coingecko_api/helpers/coingecko_rate_limit_exception.dart';
import 'package:coingecko_api/sections/asset_platforms_section.dart';
import 'package:coingecko_api/sections/categories_section.dart';
import 'package:coingecko_api/sections/coins_section.dart';
import 'package:coingecko_api/sections/companies_section.dart';
import 'package:coingecko_api/sections/contract_section.dart';
import 'package:coingecko_api/sections/derivatives_section.dart';
import 'package:coingecko_api/sections/events_section.dart';
import 'package:coingecko_api/sections/exchange_rates_section.dart';
import 'package:coingecko_api/sections/exchanges_section.dart';
import 'package:coingecko_api/sections/finance_section.dart';
import 'package:coingecko_api/sections/global_section.dart';
import 'package:coingecko_api/sections/indexes_section.dart';
import 'package:coingecko_api/sections/ping_section.dart';
import 'package:coingecko_api/sections/simple_section.dart';
import 'package:coingecko_api/sections/status_updates_section.dart';
import 'package:coingecko_api/sections/trending_section.dart';
import 'package:dio/dio.dart';

class CoinGeckoApi {
  late Dio _dio;
  int _requestCount = 0;
  DateTime _firstRequest = DateTime.now();
  bool enableLogging;

  // sections
  late PingSection _ping;
  late SimpleSection _simple;
  late CoinsSection _coins;
  late ContractSection _contract;
  late AssetPlatformsSection _assetPlatforms;
  late CategoriesSection _categories;
  late ExchangesSection _exchanges;
  late FinanceSection _finance;
  late IndexesSection _indexes;
  late DerivativesSection _derivatives;
  late StatusUpdatesSection _statusUpdates;
  late EventsSection _events;
  late ExchangeRatesSection _exchangeRates;
  late TrendingSection _trending;
  late GlobalSection _global;
  late CompaniesSection _companies;

  PingSection get ping => _ping;
  SimpleSection get simple => _simple;
  CoinsSection get coins => _coins;
  ContractSection get contract => _contract;
  AssetPlatformsSection get assetPlatforms => _assetPlatforms;
  CategoriesSection get categories => _categories;
  ExchangesSection get exchanges => _exchanges;
  FinanceSection get finance => _finance;
  IndexesSection get indexes => _indexes;
  DerivativesSection get derivatives => _derivatives;
  StatusUpdatesSection get statusUpdates => _statusUpdates;
  EventsSection get events => _events;
  ExchangeRatesSection get exchangeRates => _exchangeRates;
  TrendingSection get trending => _trending;
  GlobalSection get global => _global;
  CompaniesSection get companies => _companies;

  ///
  /// used to initialize the http client
  /// * [connectTimeout] specified in ms controls how long before connection request is timed out
  /// * [receiveTimeout] specified in ms controls how long before server sends response once request is accepted
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
                  print(
                      'holding all requests for 2 seconds, difference is ${DateTime.now().difference(_firstRequest).inSeconds}');
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
    _finance = FinanceSection(_dio);
    _indexes = IndexesSection(_dio);
    _derivatives = DerivativesSection(_dio);
    _statusUpdates = StatusUpdatesSection(_dio);
    _events = EventsSection(_dio);
    _exchangeRates = ExchangeRatesSection(_dio);
    _trending = TrendingSection(_dio);
    _global = GlobalSection(_dio);
    _companies = CompaniesSection(_dio);
  }
}
