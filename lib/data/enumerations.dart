/// Represents the order options for coin markets.
abstract class CoinMarketsOrder {
  /// Order by Gecko rank in ascending order.
  static const String geckoAscending = 'gecko_asc';

  /// Order by Gecko rank in descending order.
  static const String geckoDescending = 'gecko_desc';

  /// Order by market capitalization in ascending order.
  static const String marketCapAscending = 'market_cap_asc';

  /// Order by market capitalization in descending order.
  static const String marketCapDescending = 'market_cap_desc';

  /// Order by volume in ascending order.
  static const String volumeAscending = 'volume_asc';

  /// Order by volume in descending order.
  static const String volumeDescending = 'volume_desc';

  /// Order by ID in ascending order.
  static const String idAscending = 'id_asc';

  /// Order by ID in descending order.
  static const String idDescending = 'id_desc';
}

/// Represents the intervals for price changes.
abstract class PriceChangeInterval {
  /// Price change in the last 1 hour.
  static const String h1 = '1h';

  /// Price change in the last 24 hours.
  static const String h24 = '24h';

  /// Price change in the last 7 days.
  static const String d7 = '7d';

  /// Price change in the last 14 days.
  static const String d14 = '14d';

  /// Price change in the last 30 days.
  static const String d30 = '30d';

  /// Price change in the last 200 days.
  static const String d200 = '200d';

  /// Price change in the last 1 year.
  static const String y1 = '1y';
}

/// Represents the order options for tickers.
abstract class TickersOrder {
  /// Order by trust score in descending order.
  static const String trustScoreDescending = 'trust_score_desc';

  /// Order by trust score in ascending order.
  static const String trustScoreAscending = 'trust_score_asc';

  /// Order by volume in descending order.
  static const String volumeDescending = 'volume_desc';
}

/// Represents the intervals for coin market charts.
abstract class CoinMarketChartInterval {
  /// Chart interval set to minutely.
  static const String minutely = 'minutely';

  /// Chart interval set to hourly.
  static const String hourly = 'hourly';

  /// Chart interval set to daily.
  static const String daily = 'daily';
}

/// Represents the filter options for derivative tickers.
abstract class DerivativeTickersFilter {
  /// Include all derivative tickers.
  static const String all = 'all';

  /// Include only unexpired derivative tickers.
  static const String unexpired = 'unexpired';
}

/// Represents the order options for derivative exchanges.
abstract class DerivativeExchangesOrder {
  /// Order by name in ascending order.
  static const String nameAscending = 'name_asc';

  /// Order by name in descending order.
  static const String nameDescending = 'name_desc';

  /// Order by open interest in BTC in ascending order.
  static const String openInterestBtcAscending = 'open_interest_btc_asc';

  /// Order by open interest in BTC in descending order.
  static const String openInterestBtcDescending = 'open_interest_btc_desc';

  /// Order by 24-hour trade volume in BTC in ascending order.
  static const String tradeVolume24hBtcAscending = 'trade_volume_24h_btc_asc';

  /// Order by 24-hour trade volume in BTC in descending order.
  static const String tradeVolume24hBtcDescending = 'trade_volume_24h_btc_desc';
}

/// Represents the categories for status updates.
abstract class StatusUpdateCategory {
  /// General status updates.
  static const String general = 'general';

  /// Milestone status updates.
  static const String milestone = 'milestone';

  /// Partnership status updates.
  static const String partnership = 'partnership';

  /// Exchange listing status updates.
  static const String exchangeListing = 'exchange_listing';

  /// Software release status updates.
  static const String softwareRelease = 'software_release';

  /// Fund movement status updates.
  static const String fundMovement = 'fund_movement';

  /// New listings status updates.
  static const String newListings = 'new_listings';

  /// Event status updates.
  static const String event = 'event';
}

/// Represents the project types for status updates.
abstract class StatusUpdateProjectType {
  /// Status updates related to coins.
  static const String coin = 'coin';

  /// Status updates related to markets.
  static const String market = 'market';
}

/// Represents the coins held by a company.
abstract class CompanyHoldingsCoin {
  /// Bitcoin holdings.
  static const String bitcoin = 'bitcoin';

  /// Ethereum holdings.
  static const String ethereum = 'ethereum';
}

/// Represents the order options for NFTs list.
abstract class NftsListOrder {
  /// Order by 24-hour volume in USD in ascending order.
  static const String h24VolumeUsdAscending = 'h24_volume_usd_asc';

  /// Order by 24-hour volume in USD in descending order.
  static const String h24VolumeUsdDescending = 'h24_volume_usd_desc';

  /// Order by 24-hour volume in native currency in ascending order.
  static const String h24VolumeNativeAscending = 'h24_volume_native_asc';

  /// Order by 24-hour volume in native currency in descending order.
  static const String h24VolumeNativeDescending = 'h24_volume_native_desc';

  /// Order by floor price in native currency in ascending order.
  static const String floorPriceNativeAscending = 'floor_price_native_asc';

  /// Order by floor price in native currency in descending order.
  static const String floorPriceNativeDescending = 'floor_price_native_desc';

  /// Order by market capitalization in native currency in ascending order.
  static const String marketCapNativeAscending = 'market_cap_native_asc';

  /// Order by market capitalization in native currency in descending order.
  static const String marketCapNativeDescending = 'market_cap_native_desc';

  /// Order by market capitalization in USD in ascending order.
  static const String marketCapUsdAscending = 'market_cap_usd_asc';

  /// Order by market capitalization in USD in descending order.
  static const String marketCapUsdDescending = 'market_cap_usd_desc';
}
