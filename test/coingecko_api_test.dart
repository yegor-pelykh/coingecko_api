import 'package:coingecko_api/coingecko_api.dart';
import 'package:coingecko_api/data/enumerations.dart';
import 'package:coingecko_api/helpers/helpers.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  CoinGeckoApi api = CoinGeckoApi(rateLimitManagement: false);

  test('call /ping', () async {
    final result = await api.ping.ping();
    expect(result.data, true);
  });

  test('check /simple/price', () async {
    final result = await api.simple.listPrices(
      ids: ['bitcoin'],
      vsCurrencies: ['usd'],
      includeMarketCap: true,
      include24hVol: true,
      include24hChange: true,
      includeLastUpdatedAt: true,
    );
    final price =
        result.data.length > 0 ? result.data[0].getPriceIn('usd') : null;
    final marketCap =
        result.data.length > 0 ? result.data[0].getMarketCapIn('usd') : null;
    final vol =
        result.data.length > 0 ? result.data[0].get24hVolIn('usd') : null;
    final change =
        result.data.length > 0 ? result.data[0].get24hChangeIn('usd') : null;
    final isOk =
        price != null && marketCap != null && vol != null && change != null;
    expect(isOk, true);
  });

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
    final price =
        result.data.length > 0 ? result.data[0].getPriceIn('usd') : null;
    final marketCap =
        result.data.length > 0 ? result.data[0].getMarketCapIn('usd') : null;
    final vol =
        result.data.length > 0 ? result.data[0].get24hVolIn('usd') : null;
    final change =
        result.data.length > 0 ? result.data[0].get24hChangeIn('usd') : null;
    final isOk =
        price != null && marketCap != null && vol != null && change != null;
    expect(isOk, true);
  });

  test('check /simple/supported_vs_currencies', () async {
    final result = await api.simple.listSupportedVsCurrencies();
    final isOk = result.data.contains('usd');
    expect(isOk, true);
  });

  test('check /coins/list', () async {
    final result = await api.coins.listCoins(
      includePlatforms: true,
    );
    final isOk = result.data.any((element) => element.symbol == 'btc');
    expect(isOk, true);
  });

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
    final isOk = result.data.any((e) => e.id == 'tether');
    expect(isOk, true);
  });

  test('check /coins/{id}', () async {
    final result = await api.coins.getCoinData(
      id: 'bitcoin',
      localization: true,
      sparkline: true,
    );
    bool isOk = !result.isError && result.data != null;
    expect(isOk, true);
  });

  test('check /coins/{id}/tickers', () async {
    final result = await api.coins.listCoinTickers(
      id: 'bitcoin',
      includeExchangeLogo: true,
    );
    bool isOk = result.data.any((e) => e.base.toLowerCase() == 'btc');
    expect(isOk, true);
  });

  test('check /coins/{id}/history', () async {
    final result = await api.coins.getCoinHistory(
      id: 'bitcoin',
      date: DateTime(2020, 2, 22),
      localization: true,
    );
    bool isOk = !result.isError;
    expect(isOk, true);
  });

  test('check /coins/{id}/market_chart', () async {
    final result = await api.coins.getCoinMarketChart(
      id: 'bitcoin',
      vsCurrency: 'usd',
      days: 30,
      interval: CoinMarketChartInterval.daily,
    );
    final isOk = result.data.length > 0;
    expect(isOk, true);
  });

  test('check /coins/{id}/market_chart/range', () async {
    final result = await api.coins.getCoinMarketChartRanged(
      id: 'bitcoin',
      vsCurrency: 'usd',
      from: DateTime(2021, 1, 1),
      to: DateTime(2021, 7, 1),
    );
    final isOk = result.data.length > 0;
    expect(isOk, true);
  });

  test('check /coins/{id}/status_updates', () async {
    final result = await api.coins.listCoinStatusUpdates(
      id: 'nem',
    );
    final isOk = result.data.length > 0;
    expect(isOk, true);
  });

  test('check /coins/{id}/ohlc', () async {
    final result = await api.coins.getCoinOHLC(
      id: 'bitcoin',
      vsCurrency: 'usd',
      days: 7,
    );
    final isOk = result.data.length > 0 &&
        result.data.every((e) =>
            !Helpers.isDefaultDateTime(e.timestamp) &&
            e.open > 0 &&
            e.high > 0 &&
            e.low > 0 &&
            e.close > 0);
    expect(isOk, true);
  });

  test('check /coins/{id}/contract/{contract_address}', () async {
    var result = await api.contract.getContractTokenData(
      id: 'ethereum',
      contractAddress: '0x4fabb145d64652a948d72533023f6e7a623c7c53',
    );
    final isOk = !result.isError && result.data != null;
    expect(isOk, true);
  });

  test('check /coins/{id}/contract/{contract_address}/market_chart', () async {
    final result = await api.contract.getContractMarketChart(
      id: 'ethereum',
      contractAddress: '0x4fabb145d64652a948d72533023f6e7a623c7c53',
      vsCurrency: 'usd',
      days: 30,
    );
    final isOk = result.data.length > 0;
    expect(isOk, true);
  });

  test('check /coins/{id}/contract/{contract_address}/market_chart/range',
      () async {
    final result = await api.contract.getContractMarketChartRanged(
      id: 'ethereum',
      contractAddress: '0x4fabb145d64652a948d72533023f6e7a623c7c53',
      vsCurrency: 'usd',
      from: DateTime(2021, 1, 1),
      to: DateTime(2021, 7, 1),
    );
    final isOk = result.data.length > 0;
    expect(isOk, true);
  });

  test('check /asset_platforms', () async {
    final result = await api.assetPlatforms.listAssetPlatforms();
    final isOk = result.data.length > 0;
    expect(isOk, true);
  });

  test('check /coins/categories/list', () async {
    final result = await api.categories.listCategories();
    final isOk = result.data.any((element) => element.id == 'stablecoins');
    expect(isOk, true);
  });

  test('check /coins/categories', () async {
    final result = await api.categories.listCategories();
    final isOk = result.data.any((element) => element.id == 'stablecoins');
    expect(isOk, true);
  });

  test('check /exchanges', () async {
    final result = await api.exchanges.listExchanges(
      page: 1,
      itemsPerPage: 100,
    );
    final isOk = result.data.any((e) => e.id == 'binance');
    expect(isOk, true);
  });

  test('check /exchanges/list', () async {
    final result = await api.exchanges.listExchangesShort();
    final isOk = result.data.any((e) => e.id == 'binance');
    expect(isOk, true);
  });

  test('check /exchanges/{id}', () async {
    final result = await api.exchanges.getExchangeData(
      id: 'binance',
    );
    final isOk = result.data != null && result.data!.yearEstablished == 2017;
    expect(isOk, true);
  });

  test('check /exchanges/{id}/tickers', () async {
    final result = await api.exchanges.getExchangeTickers(
      id: 'binance',
      coinIds: ['bitcoin'],
      includeExchangeLogo: true,
      depth: true,
    );
    final isOk = result.data.length > 0;
    expect(isOk, true);
  });

  test('check /exchanges/{id}/status_updates', () async {
    final result = await api.exchanges.getExchangeStatusUpdates(
      id: 'binance',
      page: 1,
      itemsPerPage: 100,
    );
    final isOk = result.data.length > 0;
    expect(isOk, true);
  });

  test('check /exchanges/{id}/volume_chart', () async {
    final result = await api.exchanges.getExchangeVolumeChartData(
      id: 'kuna',
      days: 1,
    );
    final isOk = result.data.length > 0;
    expect(isOk, true);
  });

  test('check /finance_platforms', () async {
    final result = await api.finance.listFinancePlatforms(
      itemsPerPage: 100,
    );
    final isOk = result.data.length > 0;
    expect(isOk, true);
  });

  test('check /finance_products', () async {
    final result = await api.finance.listFinanceProducts(
      itemsPerPage: 100,
    );
    final isOk = result.data.length > 0;
    expect(isOk, true);
  });

  test('check /indexes', () async {
    final result = await api.indexes.listMarketIndexes();
    final isOk = result.data.length > 0;
    expect(isOk, true);
  });

  test('check /indexes/{market_id}/{id}', () async {
    final result = await api.indexes.getMarketIndex(
      marketId: 'binance_futures',
      indexId: 'btc',
    );
    final isOk = !result.isError && result.data != null;
    expect(isOk, true);
  });

  test('check /indexes/list', () async {
    final result = await api.indexes.listMarketIndexesShort();
    final isOk = result.data.length > 0;
    expect(isOk, true);
  });

  test('check /derivatives', () async {
    final result = await api.derivatives.listDerivatives(
      includeTickers: DerivativeTickersFilter.all,
    );
    final isOk = !result.isError && result.data.length > 0;
    expect(isOk, true);
  });

  test('check /derivatives/exchanges', () async {
    final result = await api.derivatives.listDerivativeExchanges(
      order: DerivativeExchangesOrder.nameAscending,
      itemsPerPage: 10,
    );
    final isOk = !result.isError && result.data.length == 10;
    expect(isOk, true);
  });

  test('check /derivatives/exchanges/{id}', () async {
    final result = await api.derivatives.getDerivativeExchange(
      id: 'binance_futures',
      includeTickers: DerivativeTickersFilter.all,
    );
    final isOk = !result.isError && result.data != null;
    expect(isOk, true);
  });

  test('check /derivatives/exchanges/list', () async {
    final result = await api.derivatives.listDerivativeExchangesShort();
    final isOk = !result.isError && result.data.length > 0;
    expect(isOk, true);
  });

  test('check /status_updates', () async {
    final result = await api.statusUpdates.listStatusUpdates(
      category: StatusUpdateCategory.general,
      projectType: StatusUpdateProjectType.coin,
    );
    final isOk = !result.isError && result.data.length > 0;
    expect(isOk, true);
  });

  test('check /events', () async {
    final result = await api.events.listEvents();
    final isOk = !result.isError && result.data.length > 0;
    expect(isOk, true);
  });

  test('check /events/countries', () async {
    final result = await api.events.listEventCountries();
    final isOk = !result.isError && result.data.length > 0;
    expect(isOk, true);
  });

  test('check /events/types', () async {
    final result = await api.events.listEventTypes();
    final isOk = !result.isError && result.data.length > 0;
    expect(isOk, true);
  });

  test('call /exchange_rates', () async {
    final result = await api.exchangeRates.getBtcExchangeRates();
    final isOk = !result.isError && result.data.length > 0;
    expect(isOk, true);
  });

  test('call /search/trending', () async {
    final result = await api.trending.getSearchTrending();
    bool isOk =
        !result.isError && result.data != null && result.data!.coins.length > 0;
    expect(isOk, true);
  });

  test('call /global', () async {
    final result = await api.global.getGlobalData();
    bool isOk = !result.isError &&
        result.data != null &&
        result.data!.activeCryptocurrencies > 0;
    expect(isOk, true);
  });

  test('call /global/defi', () async {
    final result = await api.global.getGlobalDefiData();
    bool isOk = !result.isError &&
        result.data != null &&
        result.data!.defiMarketCap != null &&
        result.data!.defiMarketCap! > 0;
    expect(isOk, true);
  });

  test('call /companies/public_treasury/{coin_id}', () async {
    final result = await api.companies.getCompaniesData();
    bool isOk = !result.isError && result.data != null;
    expect(isOk, true);
  });
}
