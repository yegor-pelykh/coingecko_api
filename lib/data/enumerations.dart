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

abstract class PriceChangeInterval {
  static const String h1 = '1h';
  static const String h24 = '24h';
  static const String d7 = '7d';
  static const String d14 = '14d';
  static const String d30 = '30d';
  static const String d200 = '200d';
  static const String y1 = '1y';
}

abstract class TickersOrder {
  static const String trustScoreDescending = 'trust_score_desc';
  static const String trustScoreAscending = 'trust_score_asc';
  static const String volumeDescending = 'volume_desc';
}

abstract class CoinMarketChartInterval {
  static const String minutely = 'minutely';
  static const String hourly = 'hourly';
  static const String daily = 'daily';
}

abstract class DerivativeTickersFilter {
  static const String all = 'all';
  static const String unexpired = 'unexpired';
}

abstract class DerivativeExchangesOrder {
  static const String nameAscending = 'name_asc';
  static const String nameDescending = 'name_desc';
  static const String openInterestBtcAscending = 'open_interest_btc_asc';
  static const String openInterestBtcDescending = 'open_interest_btc_desc';
  static const String tradeVolume24hBtcAscending = 'trade_volume_24h_btc_asc';
  static const String tradeVolume24hBtcDescending = 'trade_volume_24h_btc_desc';
}

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

abstract class StatusUpdateProjectType {
  static const String coin = 'coin';
  static const String market = 'market';
}

abstract class CompanyHoldingsCoin {
  static const String bitcoin = 'bitcoin';
  static const String ethereum = 'ethereum';
}
