/// Coin markets order
abstract class CoinMarketsOrder {
  static const String geckoAscending = 'gecko_asc';
  static const String geckoDescending = 'gecko_desc';
  static const String marketCapAscending = 'market_cap_asc';
  static const String marketCapDescending = 'market_cap_desc';
  static const String volumeAscending = 'volume_asc';
  static const String volumeDescending = 'volume_desc';
  static const String idAscending = 'id_asc';
  static const String idDescending = 'id_desc';
}

/// Price change interval
abstract class PriceChangeInterval {
  static const String h1 = '1h';
  static const String h24 = '24h';
  static const String d7 = '7d';
  static const String d14 = '14d';
  static const String d30 = '30d';
  static const String d200 = '200d';
  static const String y1 = '1y';
}

/// Tickers order
abstract class TickersOrder {
  static const String trustScoreDescending = 'trust_score_desc';
  static const String trustScoreAscending = 'trust_score_asc';
  static const String volumeDescending = 'volume_desc';
}

/// Coin market chart interval
abstract class CoinMarketChartInterval {
  static const String minutely = 'minutely';
  static const String hourly = 'hourly';
  static const String daily = 'daily';
}

/// Derivative tickers filter
abstract class DerivativeTickersFilter {
  static const String all = 'all';
  static const String unexpired = 'unexpired';
}

/// Derivative exchanges order
abstract class DerivativeExchangesOrder {
  static const String nameAscending = 'name_asc';
  static const String nameDescending = 'name_desc';
  static const String openInterestBtcAscending = 'open_interest_btc_asc';
  static const String openInterestBtcDescending = 'open_interest_btc_desc';
  static const String tradeVolume24hBtcAscending = 'trade_volume_24h_btc_asc';
  static const String tradeVolume24hBtcDescending = 'trade_volume_24h_btc_desc';
}

/// Status update category
abstract class StatusUpdateCategory {
  static const String general = 'general';
  static const String milestone = 'milestone';
  static const String partnership = 'partnership';
  static const String exchangeListing = 'exchange_listing';
  static const String softwareRelease = 'software_release';
  static const String fundMovement = 'fund_movement';
  static const String newListings = 'new_listings';
  static const String event = 'event';
}

/// Status update project type
abstract class StatusUpdateProjectType {
  static const String coin = 'coin';
  static const String market = 'market';
}

/// Coin of holdings of the company
abstract class CompanyHoldingsCoin {
  static const String bitcoin = 'bitcoin';
  static const String ethereum = 'ethereum';
}

/// NFTs list order
abstract class NftsListOrder {
  static const String h24VolumeUsdAscending = 'h24_volume_usd_asc';
  static const String h24VolumeUsdDescending = 'h24_volume_usd_desc';
  static const String h24VolumeNativeAscending = 'h24_volume_native_asc';
  static const String h24VolumeNativeDescending = 'h24_volume_native_desc';
  static const String floorPriceNativeAscending = 'floor_price_native_asc';
  static const String floorPriceNativeDescending = 'floor_price_native_desc';
  static const String marketCapNativeAscending = 'market_cap_native_asc';
  static const String marketCapNativeDescending = 'market_cap_native_desc';
  static const String marketCapUsdAscending = 'market_cap_usd_asc';
  static const String marketCapUsdDescending = 'market_cap_usd_desc';
}
