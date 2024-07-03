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
  /// Client object to make requests to the CoinGecko API.
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

  /// Getter for the PingSection object.
  PingSection get ping => _ping;

  /// Getter for the SimpleSection object.
  SimpleSection get simple => _simple;

  /// Getter for the CoinsSection object.
  CoinsSection get coins => _coins;

  /// Getter for the ContractSection object.
  ContractSection get contract => _contract;

  /// Getter for the CategoriesSection object.
  CategoriesSection get categories => _categories;

  /// Getter for the NftsSection object.
  NftsSection get nfts => _nfts;

  /// Getter for the ExchangesSection object.
  ExchangesSection get exchanges => _exchanges;

  /// Getter for the DerivativesSection object.
  DerivativesSection get derivatives => _derivatives;

  /// Getter for the AssetPlatformsSection object.
  AssetPlatformsSection get assetPlatforms => _assetPlatforms;

  /// Getter for the ExchangeRatesSection object.
  ExchangeRatesSection get exchangeRates => _exchangeRates;

  /// Getter for the SearchSection object.
  SearchSection get search => _search;

  /// Getter for the TrendingSection object.
  TrendingSection get trending => _trending;

  /// Getter for the GlobalSection object.
  GlobalSection get global => _global;

  /// Getter for the CompaniesSection object.
  CompaniesSection get companies => _companies;

  /// Getter for the IndexesSection object.
  IndexesSection get indexes => _indexes;

  /// Constructor for the CoinGeckoApi class.
  ///
  /// [connectTimeout] is the maximum amount of time the API will wait for a connection before giving up.
  /// [receiveTimeout] is the maximum amount of time the API will wait for a response before giving up.
  /// [autoRetry] determines whether the API should automatically retry failed requests.
  /// [credentials] are the credentials used to authenticate with the CoinGecko API.
  CoinGeckoApi({
    Duration connectTimeout = const Duration(seconds: 30),
    Duration receiveTimeout = const Duration(seconds: 10),
    bool autoRetry = true,
    Credentials? credentials,
  }) {
    // Determine the base URL based on the provided credentials
    final baseUrl = credentials is ProCredentials
        ? 'https://pro-api.coingecko.com/api/v3/'
        : 'https://api.coingecko.com/api/v3';

    // Create the base options for the Dio client
    final options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      responseType: ResponseType.json,
      validateStatus: (status) => status != status429TooManyRequests,
    );

    // If credentials are provided, add them to the headers
    if (credentials != null) {
      options.headers = {
        'x-cg-demo-api-key': credentials.apiKey,
      };
    }

    // Create the Dio client
    final dio = Dio(options);

    // If autoRetry is enabled, add a RetryInterceptor to the Dio client
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
        ),
      );
    }

    // Create the client and all the API sections
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
