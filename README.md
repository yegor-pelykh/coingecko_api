<p align="center">
    <img src="https://static.coingecko.com/s/thumbnail-007177f3eca19695592f0b8b0eabbdae282b54154e1be912285c9034ea6cbaf2.png" height="200" />
</p>
<p align="center">
    <img src="https://dart.dev/assets/shared/dart-logo-for-shares.png" height="200" />
</p>

<h1 align="center">Simple Dart wrapper for the CoinGecko API</h1>

[![popularity](https://badges.bar/coingecko_api/popularity)](https://pub.dev/packages/coingecko_api)
[![likes](https://badges.bar/coingecko_api/likes)](https://pub.dev/packages/coingecko_api)

Table of contents
=================

* [Installation](#installation)
* [Usage](#usage)
* [Documentation](#documentation)
    * [Query results](#query-results)
    * [Sections](#sections)
        * [ping](#ping)
        * [simple](#simple)
        * [coins](#coins)
        * [contract](#contract)
        * [asset_platforms](#asset_platforms)
        * [categories](#categories)
        * [exchanges](#exchanges)
        * [indexes](#indexes)
        * [derivatives](#derivatives)
        * [exchange_rates](#exchange_rates)
        * [search](#search)
        * [trending](#trending)
        * [global](#global)
        * [companies](#companies)
    * [Full Example](#full-example)
    * [Tests](#tests)
    * [Roadmap](#roadmap)
    * [Contributing](#contributing)
    * [License](#license)
    * [Contact](#contact)

Installation
============

Add the dependency to your Dart / Flutter project:
```yaml
dependencies:
  coingecko_api: ^1.1.0
```

Usage
=====

1. Create an instance of the API wrapper:
    ```dart
    CoinGeckoApi api = CoinGeckoApi();
    ```
1. Use any methods provided by wrapper. The methods are divided into sections, just as the CoinGecko does.
    ```dart
    final marketChart = await api.coins.getCoinMarketChart(
      id: 'bitcoin',
      vsCurrency: 'usd',
      days: 7,
    );
    ```
1. Work with the result as you see fit:
    ```dart
    if (!marketChart.isError) {
      marketChart.data.forEach((item) {
        print('Price: ${item.price}, Market Cap: ${item.marketCap}');
      });
    }
    ```

# Documentation

All methods are asynchronous and use ```Future```, so you need to use ```await``` to get the result.

# Query results

The result of each method is a special object of type ```CoinGeckoResult```. This is a kind of wrapper that allows you to first find out how successful the request was using its ```isError``` property. If ```isError``` is ```false```, then we can use the ```data``` property of this object to get the processed data itself. Otherwise, we can view the error code and error message using properties ```errorCode``` and ```errorMessage```.

# Sections

All methods are divided into sections for easier understanding of the purpose of each method. To call any method, we first need to specify a section.

General scheme:
```dart
final result = await api./*section name*/./*method name*/(/*parameters*/);
```

All sections fully correspond to those in the CoinGecko API documentation itself:
[https://www.coingecko.com/api/documentation](https://www.coingecko.com/api/documentation)

Let's take a closer look at each of the sections and a set of methods in them.
Each section will contain a table indicating the method, a short description of the method and the corresponding query string from the official CoinGecko website. 

## ping

| Method name | Description | Query string |
| - | - | - |
| ping | Check API server status. | /ping |

## simple

| Method name | Description | Query string |
| - | - | - |
| listPrices | Get the current price of any cryptocurrencies in any other supported currencies that you need. | /simple/price |
| listTokenPrices | Get current price of tokens (using contract addresses) for a given platform in any other currency that you need. | /simple/token_price/{id} |
| listSupportedVsCurrencies | Get list of supported vs currencies. | /simple/supported_vs_currencies |

## coins

| Method name | Description | Query string |
| - | - | - |
| listCoins | List all supported coins id, name and symbol. | /coins/list |
| listCoinMarkets | List all supported coins price, market cap, volume, and market related data. | /coins/markets |
| getCoinData | Get current data (name, price, market, ... including exchange tickers) for a coin. | /coins/{id} |
| listCoinTickers | Get coin tickers (paginated to 100 items). | /coins/{id}/tickers |
| getCoinHistory | Get historical data (name, price, market, stats) at a given date for a coin. | /coins/{id}/history |
| getCoinMarketChart | Get historical market data include price, market cap, and 24h volume (granularity auto). | /coins/{id}/market_chart |
| getCoinMarketChartRanged | Get historical market data include price, market cap, and 24h volume within a range of timestamp (granularity auto). | /coins/{id}/market_chart/range |
| listCoinStatusUpdates | Get status updates for a given coin. | /coins/{id}/status_updates |
| getCoinOHLC | Get coin's OHLC. | /coins/{id}/ohlc |

## contract

| Method name | Description | Query string |
| - | - | - |
| getContractTokenData | Get coin info from contract address. | /coins/{id}/contract/{contract_address} |
| getContractMarketChart | Get historical market data include price, market cap, and 24h volume (granularity auto) from a contract address. | /coins/{id}/contract/{contract_address}/market_chart |
| getContractMarketChartRanged | Get historical market data include price, market cap, and 24h volume within a range of timestamp (granularity auto) from a contract address. | /coins/{id}/contract/{contract_address}/market_chart/range |

## asset_platforms

| Method name | Description | Query string |
| - | - | - |
| listAssetPlatforms | List all asset platforms (Blockchain networks). | /asset_platforms |

## categories

| Method name | Description | Query string |
| - | - | - |
| listCategoriesShort | List all categories. | /coins/categories/list |
| listCategories | List all categories with market data. | /coins/categories |

## exchanges

| Method name | Description | Query string |
| - | - | - |
| listExchanges | List all exchanges. | /exchanges |
| listExchangesShort | List all supported exchanges: id and name. | /exchanges/list |
| getExchangeData | Get exchange volume in BTC and top 100 tickers only. | /exchanges/{id} |
| getExchangeTickers | Get exchange tickers (paginated, 100 tickers per page). | /exchanges/{id}/tickers |
| getExchangeVolumeChartData | Get volume_chart data for a given exchange. | /exchanges/{id}/volume_chart |

## indexes

| Method name | Description | Query string |
| - | - | - |
| listMarketIndexes | List all market indexes. | /indexes |
| getMarketIndex | Get market index by market id and index id. | /indexes/{market_id}/{id} |
| listMarketIndexesShort | List market indexes id and name. | /indexes/list |

## derivatives

| Method name | Description | Query string |
| - | - | - |
| listDerivatives | List all derivative tickers. | /derivatives |
| listDerivativeExchanges | List all derivative exchanges. | /derivatives/exchanges |
| getDerivativeExchange | Show derivative exchange data. | /derivatives/exchanges/{id} |
| listDerivativeExchangesShort | List all derivative exchanges name and identifier. | /derivatives/exchanges/list |

## exchange_rates

| Method name | Description | Query string |
| - | - | - |
| getBtcExchangeRates | Get BTC-to-Currency exchange rates. | /exchange_rates |

## search

| Method name | Description | Query string |
| - | - | - |
| searchFor | Search for coins, categories and markets listed on CoinGecko ordered by largest Market Cap first. | /search |

## trending

| Method name | Description | Query string |
| - | - | - |
| getSearchTrending | Get trending search coins (Top-7) on CoinGecko in the last 24 hours. | /search/trending |

## global

| Method name | Description | Query string |
| - | - | - |
| getGlobalData | Get cryptocurrency global data. | /global |
| getGlobalDefiData | Get cryptocurrency global decentralized finance(defi) data. | /global/decentralized_finance_defi |

## companies

| Method name | Description | Query string |
| - | - | - |
| getCompaniesData | Get public companies data. | /companies/public_treasury/{coin_id} |

# Full Example

```dart
final result = await api.coins.getCoinOHLC(
    id: 'bitcoin',
    vsCurrency: 'usd',
    days: 7,
);
if (!result.isError) {
    print('getCoinOHLC method returned result');
    result.data.forEach(
        (item) => print(
            '${item.timestamp}: open = ${item.open}, high = ${item.high}, low = ${item.low}, close = ${item.close}',
        ),
    );
} else {
    print('getCoinOHLC method returned error ${result.errorCode}: ${result.errorMessage}');
}
```

# Tests

Each method is covered by a separate test using native dart testing platform ```dart test```.

# Roadmap

See the [open issues](https://github.com/yegor-pelykh/coingecko_api/issues) for a list of proposed features and known issues.

# Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are greatly appreciated.

1. Fork the project
1. Create your feature branch (git checkout -b feature/AmazingFeature)
1. Commit your changes (git commit -m 'Add some AmazingFeature')
1. Push to the branch (git push origin feature/AmazingFeature)
1. Open a Pull Request

# License

Distributed under the MIT License. See LICENSE for more information.

# Contact

Yegor Pelykh

E-mail:  [yegor.dev@gmail.com](mailto:yegor.dev@gmail.com) 

Project Link: [github.com/yegor-pelykh/coingecko_api](https://github.com/yegor-pelykh/coingecko_api)
