/// Provides simple access to the CoinGecko API (Version 3)
library coingecko_api;

import 'package:coingecko_api/helpers/client.dart';
import 'package:coingecko_api/helpers/credentials/credentials.dart';
import 'package:coingecko_api/helpers/credentials/pro_credentials.dart';
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
import 'package:coingecko_api/sections/nfts_section.dart';
import 'package:coingecko_api/sections/ping_section.dart';
import 'package:coingecko_api/sections/search_section.dart';
import 'package:coingecko_api/sections/simple_section.dart';
import 'package:coingecko_api/sections/trending_section.dart';
import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';

/// The main class for making requests to the CoinGecko API.
class CoinGeckoApi {
  late Client _client;

  // sections
  late PingSection _ping;
  late SimpleSection _simple;
  late CoinsSection _coins;
  late ContractSection _contract;
  late CategoriesSection _categories;
  late NftsSection _nfts;
  late ExchangesSection _exchanges;
  late DerivativesSection _derivatives;
  late AssetPlatformsSection _assetPlatforms;
  late ExchangeRatesSection _exchangeRates;
  late SearchSection _search;
  late TrendingSection _trending;
  late GlobalSection _global;
  late CompaniesSection _companies;
  late IndexesSection _indexes;

  /// The section for ping requests
  PingSection get ping => _ping;

  /// The section that brings together the requests
  /// that are related to simple coins / currencies
  SimpleSection get simple => _simple;

  /// The section that brings together the requests that are related to coins
  CoinsSection get coins => _coins;

  /// The section that brings together the requests that are related to contract tokens
  ContractSection get contract => _contract;

  /// The section that brings together the requests that are related to categories
  CategoriesSection get categories => _categories;

  /// The section that brings together the requests that are related to NFTs
  NftsSection get nfts => _nfts;

  /// The section that brings together the requests that are related to exchanges
  ExchangesSection get exchanges => _exchanges;

  /// The section that brings together the requests that are related to derivatives
  DerivativesSection get derivatives => _derivatives;

  /// The section that brings together the requests that are related
  /// to asset platforms
  AssetPlatformsSection get assetPlatforms => _assetPlatforms;

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

  /// The section that brings together the requests that are related to indexes
  IndexesSection get indexes => _indexes;

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
  CoinGeckoApi({
    Duration connectTimeout = const Duration(seconds: 30),
    Duration receiveTimeout = const Duration(seconds: 10),
    bool autoRetry = true,
    Credentials? credentials,
  }) {
    final baseUrl = credentials is ProCredentials
        ? 'https://pro-api.coingecko.com/api/v3/'
        : 'https://api.coingecko.com/api/v3';
    final options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      responseType: ResponseType.json,
      validateStatus: (status) => status != status429TooManyRequests,
    );
    if (credentials != null) {
      options.headers = {
        'x-cg-demo-api-key': credentials.apiKey,
      };
    }
    final dio = Dio(options);
    if (autoRetry) {
      final retryDelays = List.generate(
        24,
        (_) => Duration(seconds: 5),
      );
      dio.interceptors.add(
        RetryInterceptor(
          dio: dio,
          retries: retryDelays.length,
          retryDelays: retryDelays,
          retryEvaluator: DefaultRetryEvaluator({
            status429TooManyRequests,
          }).evaluate,
          // retryableExtraStatuses: {status429TooManyRequests}),
        ),
      );
    }
    _client = Client(
      credentials: credentials,
      dio: dio,
    );

    _ping = PingSection(_client);
    _simple = SimpleSection(_client);
    _coins = CoinsSection(_client);
    _contract = ContractSection(_client);
    _categories = CategoriesSection(_client);
    _nfts = NftsSection(_client);
    _exchanges = ExchangesSection(_client);
    _derivatives = DerivativesSection(_client);
    _assetPlatforms = AssetPlatformsSection(_client);
    _exchangeRates = ExchangeRatesSection(_client);
    _search = SearchSection(_client);
    _trending = TrendingSection(_client);
    _global = GlobalSection(_client);
    _companies = CompaniesSection(_client);
    _indexes = IndexesSection(_client);
  }
}
