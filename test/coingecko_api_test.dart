import 'dart:io';
import 'package:coingecko_api/coingecko_api.dart';
import 'package:coingecko_api/data/enumerations.dart';
import 'package:coingecko_api/helpers/credentials/demo_credentials.dart';
import 'package:coingecko_api/helpers/helpers.dart';
import 'package:test/test.dart';

void main() async {
  /// Retrieves the CoinGecko API key from environment variables.
  final key = Platform.environment['COINGECKO_API_KEY'];
  if (key == null || key.isEmpty) {
    print('No API key provided.');
    print('Please declare the environment variable "COINGECKO_API_KEY".');
    // Example of 'launch.json' with the environment variable:
    // {
    //     "version": "0.2.0",
    //     "configurations": [
    //         {
    //             "name": "coingecko_api",
    //             "request": "launch",
    //             "type": "dart",
    //             "templateFor": "",
    //             "env": {
    //                 "COINGECKO_API_KEY": "[API key]",
    //             }
    //         }
    //     ]
    // }
    return;
  }

  /// Initializes the CoinGecko API client with the provided API key.
  CoinGeckoApi api = CoinGeckoApi(credentials: DemoCredentials(apiKey: key));

  /// Tests the /ping endpoint to check if the API is reachable.
  test('check /ping', () async {
    final result = await api.ping.ping();
    expect(result.data, true);
  }, timeout: Timeout(Duration(minutes: 2)));

  /// Tests the /simple/price endpoint to retrieve the price of Bitcoin in USD.
  test('check /simple/price', () async {
    final result = await api.simple.listPrices(
      ids: ['bitcoin'],
      vsCurrencies: ['usd'],
      includeMarketCap: true,
      include24hVol: true,
      include24hChange: true,
      includeLastUpdatedAt: true,
    );
    final price = result.data.isNotEmpty
        ? result.data[0].getPriceIn('usd')
        : null;
    final marketCap = result.data.isNotEmpty
        ? result.data[0].getMarketCapIn('usd')
        : null;
    final vol = result.data.isNotEmpty
        ? result.data[0].get24hVolIn('usd')
        : null;
    final change = result.data.isNotEmpty
        ? result.data[0].get24hChangeIn('usd')
        : null;
    final isOk =
        price != null && marketCap != null && vol != null && change != null;
    expect(isOk, true);
  }, timeout: Timeout(Duration(minutes: 2)));

  /// Tests the /simple/token_price/{id} endpoint to retrieve the price of a token.
  test('check /simple/token_price/{id}', () async {
    // get info about uniswap token
    final result = await api.simple.listTokenPrices(
      id: 'ethereum',
      contractAddresses: ['0x1f9840a85d5af5bf1d1762f925bdaddc4201f984'],
      vsCurrencies: ['usd'],
      includeMarketCap: true,
      include24hVol: true,
      include24hChange: true,
      includeLastUpdatedAt: true,
    );
    final price = result.data.isNotEmpty
        ? result.data[0].getPriceIn('usd')
        : null;
    final marketCap = result.data.isNotEmpty
        ? result.data[0].getMarketCapIn('usd')
        : null;
    final vol = result.data.isNotEmpty
        ? result.data[0].get24hVolIn('usd')
        : null;
    final change = result.data.isNotEmpty
        ? result.data[0].get24hChangeIn('usd')
        : null;
    final isOk =
        price != null && marketCap != null && vol != null && change != null;
    expect(isOk, true);
  }, timeout: Timeout(Duration(minutes: 2)));

  /// Tests the /simple/supported_vs_currencies endpoint to check if USD is supported.
  test('check /simple/supported_vs_currencies', () async {
    final result = await api.simple.listSupportedVsCurrencies();
    final isOk = !result.isError && result.data.contains('usd');
    expect(isOk, true);
  }, timeout: Timeout(Duration(minutes: 2)));

  /// Tests the /coins/list endpoint to retrieve the list of coins.
  test('check /coins/list', () async {
    final result = await api.coins.listCoins(includePlatforms: true);
    final isOk =
        !result.isError &&
        result.data.any((element) => element.symbol == 'btc');
    expect(isOk, true);
  }, timeout: Timeout(Duration(minutes: 2)));

  /// Tests the /coins/markets endpoint to retrieve market data for stablecoins.
  test('check /coins/markets', () async {
    final result = await api.coins.listCoinMarkets(
      vsCurrency: 'usd',
      category: 'stablecoins',
      sparkline: true,
      priceChangePercentageIntervals: [
        PriceChangeInterval.h1,
        PriceChangeInterval.h24,
      ],
    );
    final isOk = !result.isError && result.data.any((e) => e.id == 'tether');
    expect(isOk, true);
  }, timeout: Timeout(Duration(minutes: 2)));

  /// Tests the /coins/{id} endpoint to retrieve data for Bitcoin.
  test('check /coins/{id}', () async {
    final result = await api.coins.getCoinData(
      id: 'bitcoin',
      localization: true,
      sparkline: true,
    );
    bool isOk = !result.isError && result.data != null;
    expect(isOk, true);
  }, timeout: Timeout(Duration(minutes: 2)));

  /// Tests the /coins/{id}/tickers endpoint to retrieve tickers for Bitcoin.
  test('check /coins/{id}/tickers', () async {
    final result = await api.coins.listCoinTickers(
      id: 'bitcoin',
      includeExchangeLogo: true,
    );
    bool isOk =
        !result.isError &&
        result.data.any((e) => e.base.toLowerCase() == 'btc');
    expect(isOk, true);
  }, timeout: Timeout(Duration(minutes: 2)));

  /// Tests the /coins/{id}/history endpoint to retrieve historical data for Bitcoin.
  test('check /coins/{id}/history', () async {
    final result = await api.coins.getCoinHistory(
      id: 'bitcoin',
      date: DateTime(2024, 6, 1),
      localization: true,
    );
    bool isOk = !result.isError;
    expect(isOk, true);
  }, timeout: Timeout(Duration(minutes: 2)));

  /// Tests the /coins/{id}/market_chart endpoint to retrieve market chart data for Bitcoin.
  test('check /coins/{id}/market_chart', () async {
    final result = await api.coins.getCoinMarketChart(
      id: 'bitcoin',
      vsCurrency: 'usd',
      days: 30,
      interval: CoinMarketChartInterval.daily,
    );
    final isOk = !result.isError && result.data.isNotEmpty;
    expect(isOk, true);
  }, timeout: Timeout(Duration(minutes: 2)));

  /// Tests the /coins/{id}/market_chart/range endpoint to retrieve ranged market chart data for Bitcoin.
  test('check /coins/{id}/market_chart/range', () async {
    final toDate = DateTime.now();
    final fromDate = toDate.subtract(Duration(days: 90));
    final result = await api.coins.getCoinMarketChartRanged(
      id: 'bitcoin',
      vsCurrency: 'usd',
      from: fromDate,
      to: toDate,
    );
    final isOk = !result.isError && result.data.isNotEmpty;
    expect(isOk, true);
  }, timeout: Timeout(Duration(minutes: 2)));

  /// Tests the /coins/{id}/ohlc endpoint to retrieve OHLC data for Bitcoin.
  test('check /coins/{id}/ohlc', () async {
    final result = await api.coins.getCoinOHLC(
      id: 'bitcoin',
      vsCurrency: 'usd',
      days: 7,
    );
    final isOk =
        !result.isError &&
        result.data.isNotEmpty &&
        result.data.every(
          (e) =>
              !Helpers.isDefaultDateTime(e.timestamp) &&
              e.open > 0 &&
              e.high > 0 &&
              e.low > 0 &&
              e.close > 0,
        );
    expect(isOk, true);
  }, timeout: Timeout(Duration(minutes: 2)));

  /// Tests the /coins/{id}/contract/{contract_address} endpoint to retrieve token data for a specific contract.
  test(
    'check /coins/{id}/contract/{contract_address}',
    () async {
      var result = await api.contract.getContractTokenData(
        id: 'ethereum',
        contractAddress: '0x4fabb145d64652a948d72533023f6e7a623c7c53',
      );
      final isOk = !result.isError && result.data != null;
      expect(isOk, true);
    },
    timeout: Timeout(Duration(minutes: 2)),
  );

  /// Tests the /coins/{id}/contract/{contract_address}/market_chart endpoint to retrieve market chart data for a specific contract.
  test(
    'check /coins/{id}/contract/{contract_address}/market_chart',
    () async {
      final result = await api.contract.getContractMarketChart(
        id: 'ethereum',
        contractAddress: '0x4fabb145d64652a948d72533023f6e7a623c7c53',
        vsCurrency: 'usd',
        days: 30,
      );
      final isOk = !result.isError && result.data.isNotEmpty;
      expect(isOk, true);
    },
    timeout: Timeout(Duration(minutes: 2)),
  );

  /// Tests the /coins/{id}/contract/{contract_address}/market_chart/range endpoint to retrieve market chart data for a specific contract within a date range.
  test(
    'check /coins/{id}/contract/{contract_address}/market_chart/range',
    () async {
      final toDate = DateTime.now();
      final fromDate = toDate.subtract(Duration(days: 90));
      final result = await api.contract.getContractMarketChartRanged(
        id: 'ethereum',
        contractAddress: '0x4fabb145d64652a948d72533023f6e7a623c7c53',
        vsCurrency: 'usd',
        from: fromDate,
        to: toDate,
      );
      final isOk = !result.isError && result.data.isNotEmpty;
      expect(isOk, true);
    },
    timeout: Timeout(Duration(minutes: 2)),
  );

  /// Tests the /asset_platforms endpoint to list all asset platforms.
  test('check /asset_platforms', () async {
    final result = await api.assetPlatforms.listAssetPlatforms();
    final isOk = !result.isError && result.data.isNotEmpty;
    expect(isOk, true);
  }, timeout: Timeout(Duration(minutes: 2)));

  /// Tests the /coins/categories/list endpoint to list all coin categories in a short format.
  test('check /coins/categories/list', () async {
    final result = await api.categories.listCategoriesShort();
    final isOk =
        !result.isError &&
        result.data.any((element) => element.id == 'stablecoins');
    expect(isOk, true);
  }, timeout: Timeout(Duration(minutes: 2)));

  /// Tests the /coins/categories endpoint to list all coin categories.
  test('check /coins/categories', () async {
    final result = await api.categories.listCategories();
    final isOk =
        !result.isError &&
        result.data.any((element) => element.id == 'stablecoins');
    expect(isOk, true);
  }, timeout: Timeout(Duration(minutes: 2)));

  /// Tests the /nfts/list endpoint to list all NFTs.
  test('check /nfts/list', () async {
    final result = await api.nfts.listNfts();
    final isOk = !result.isError && result.data.length > 0;
    expect(isOk, true);
  }, timeout: Timeout(Duration(minutes: 2)));

  /// Tests the /nfts/{id} endpoint to get NFT data by ID.
  test('check /nfts/{id}', () async {
    final result = await api.nfts.getDataById(id: 'cryptopunks');
    final isOk = !result.isError && result.data != null;
    expect(isOk, true);
  }, timeout: Timeout(Duration(minutes: 2)));

  /// Tests the /nfts/{asset_platform_id}/contract/{contract_address} endpoint to get NFT data by contract address.
  test(
    'check /nfts/{asset_platform_id}/contract/{contract_address}',
    () async {
      final result = await api.nfts.getDataByContractAddress(
        assetPlatformId: 'ethereum',
        contractAddress: '0xb47e3cd837dDF8e4c57F05d70Ab865de6e193BBB',
      );
      final isOk = !result.isError && result.data != null;
      expect(isOk, true);
    },
    timeout: Timeout(Duration(minutes: 2)),
  );

  /// Tests the /exchanges endpoint to list all exchanges.
  test('check /exchanges', () async {
    final result = await api.exchanges.listExchanges(
      page: 1,
      itemsPerPage: 100,
    );
    final isOk = !result.isError && result.data.any((e) => e.id == 'binance');
    expect(isOk, true);
  }, timeout: Timeout(Duration(minutes: 2)));

  /// Tests the /exchanges/list endpoint to list all exchanges in short form.
  test('check /exchanges/list', () async {
    final result = await api.exchanges.listExchangesShort();
    final isOk = !result.isError && result.data.any((e) => e.id == 'binance');
    expect(isOk, true);
  }, timeout: Timeout(Duration(minutes: 2)));

  /// Tests the /exchanges/{id} endpoint to get exchange data by ID.
  test('check /exchanges/{id}', () async {
    final result = await api.exchanges.getExchangeData(id: 'binance');
    final isOk =
        result.data != null &&
        !result.isError &&
        result.data!.yearEstablished == 2017;
    expect(isOk, true);
  }, timeout: Timeout(Duration(minutes: 2)));

  /// Tests the /exchanges/{id}/tickers endpoint to get exchange tickers by ID.
  test('check /exchanges/{id}/tickers', () async {
    final result = await api.exchanges.getExchangeTickers(
      id: 'binance',
      coinIds: ['bitcoin'],
      includeExchangeLogo: true,
      depth: true,
    );
    final isOk = !result.isError && result.data.isNotEmpty;
    expect(isOk, true);
  }, timeout: Timeout(Duration(minutes: 2)));

  /// Tests the /exchanges/{id}/volume_chart endpoint to get exchange volume chart data.
  test('check /exchanges/{id}/volume_chart', () async {
    final result = await api.exchanges.getExchangeVolumeChartData(
      id: 'kuna',
      days: 1,
    );
    final isOk = !result.isError && result.data.isNotEmpty;
    expect(isOk, true);
  }, timeout: Timeout(Duration(minutes: 2)));

  /// Tests the /indexes endpoint to list all market indexes.
  test('check /indexes', () async {
    final result = await api.indexes.listMarketIndexes();
    final isOk = !result.isError && result.data.isNotEmpty;
    expect(isOk, true);
  }, timeout: Timeout(Duration(minutes: 2)));

  /// Tests the /indexes/{market_id}/{id} endpoint to get market index data by ID.
  test('check /indexes/{market_id}/{id}', () async {
    final result = await api.indexes.getMarketIndex(
      marketId: 'binance_futures',
      indexId: 'btc',
    );
    final isOk = !result.isError && result.data != null;
    expect(isOk, true);
  }, timeout: Timeout(Duration(minutes: 2)));

  /// Tests the /indexes/list endpoint to list all market indexes in short form.
  test('check /indexes/list', () async {
    final result = await api.indexes.listMarketIndexesShort();
    final isOk = !result.isError && result.data.isNotEmpty;
    expect(isOk, true);
  }, timeout: Timeout(Duration(minutes: 2)));

  /// Tests the /derivatives endpoint to list all derivatives.
  test('check /derivatives', () async {
    final result = await api.derivatives.listDerivatives(
      includeTickers: DerivativeTickersFilter.all,
    );
    final isOk = !result.isError && result.data.isNotEmpty;
    expect(isOk, true);
  }, timeout: Timeout(Duration(minutes: 2)));

  /// Tests the /derivatives/exchanges endpoint to list all derivative exchanges.
  test('check /derivatives/exchanges', () async {
    final result = await api.derivatives.listDerivativeExchanges(
      order: DerivativeExchangesOrder.nameAscending,
      itemsPerPage: 10,
    );
    final isOk = !result.isError && result.data.length == 10;
    expect(isOk, true);
  }, timeout: Timeout(Duration(minutes: 2)));

  /// Tests the /derivatives/exchanges/{id} endpoint to get derivative exchange data by ID.
  test('check /derivatives/exchanges/{id}', () async {
    final result = await api.derivatives.getDerivativeExchange(
      id: 'binance_futures',
      includeTickers: DerivativeTickersFilter.all,
    );
    final isOk = !result.isError && result.data != null;
    expect(isOk, true);
  }, timeout: Timeout(Duration(minutes: 2)));

  /// Tests the /derivatives/exchanges/list endpoint to list all derivative exchanges in short form.
  test('check /derivatives/exchanges/list', () async {
    final result = await api.derivatives.listDerivativeExchangesShort();
    final isOk = !result.isError && result.data.isNotEmpty;
    expect(isOk, true);
  }, timeout: Timeout(Duration(minutes: 2)));

  /// Tests the /exchange_rates endpoint to get BTC exchange rates.
  test('check /exchange_rates', () async {
    final result = await api.exchangeRates.getBtcExchangeRates();
    final isOk = !result.isError && result.data.isNotEmpty;
    expect(isOk, true);
  }, timeout: Timeout(Duration(minutes: 2)));

  /// Tests the /search endpoint to search for a query.
  test('check /search', () async {
    final result = await api.search.searchFor(query: 'search');
    bool isOk = !result.isError && result.data != null;
    expect(isOk, true);
  }, timeout: Timeout(Duration(minutes: 2)));

  /// Tests the /search/trending endpoint to get trending search results.
  test('check /search/trending', () async {
    final result = await api.trending.getSearchTrending();
    bool isOk =
        !result.isError && result.data != null && result.data!.coins.isNotEmpty;
    expect(isOk, true);
  }, timeout: Timeout(Duration(minutes: 2)));

  /// Tests the /global endpoint to get global cryptocurrency data.
  test('check /global', () async {
    final result = await api.global.getGlobalData();
    bool isOk =
        !result.isError &&
        result.data != null &&
        result.data!.activeCryptocurrencies > 0;
    expect(isOk, true);
  }, timeout: Timeout(Duration(minutes: 2)));

  /// Tests the /global/decentralized_finance_defi endpoint to get global DeFi data.
  test(
    'check /global/decentralized_finance_defi',
    () async {
      final result = await api.global.getGlobalDefiData();
      bool isOk =
          !result.isError &&
          result.data != null &&
          result.data!.defiMarketCap != null &&
          result.data!.defiMarketCap! > 0;
      expect(isOk, true);
    },
    timeout: Timeout(Duration(minutes: 2)),
  );

  /// Tests the /companies/public_treasury/{coin_id} endpoint to get companies' public treasury data.
  test(
    'check /companies/public_treasury/{coin_id}',
    () async {
      final result = await api.companies.getCompaniesData();
      bool isOk = !result.isError && result.data != null;
      expect(isOk, true);
    },
    timeout: Timeout(Duration(minutes: 2)),
  );
}
