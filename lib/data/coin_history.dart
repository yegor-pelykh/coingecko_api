import 'package:coingecko_api/data/coin_community_data.dart';
import 'package:coingecko_api/data/coin_developer_data.dart';
import 'package:coingecko_api/data/coin_public_interests_stats.dart';
import 'package:coingecko_api/data/image_info.dart';
import 'package:coingecko_api/data/market_data.dart';
import 'package:coingecko_api/data/localized_string.dart';
import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// Coin history data wrapper
class CoinHistory {
  /// Coin identifier
  final String id;

  /// Coin symbol
  final String symbol;

  /// Coin name
  final String name;

  /// Coin name in different localizations
  final LocalizedString? localization;

  /// Coin image
  final ImageInfo? image;

  /// Market data
  final List<MarketData>? marketData;

  /// Community data
  final CoinCommunityData? communityData;

  /// Developer data
  final CoinDeveloperData? developerData;

  /// Public interest stats
  final CoinPublicInterestsStats? publicInterestStats;

  CoinHistory.fromJson(Map<String, dynamic> json)
      : this.id = Convert.toNotNullableString(json['id'], ''),
        this.symbol = Convert.toNotNullableString(json['symbol'], ''),
        this.name = Convert.toNotNullableString(json['name'], ''),
        this.localization = json.containsKey('localization')
            ? LocalizedString.fromJson(json['localization'])
            : null,
        this.image = json.containsKey('image')
            ? ImageInfo.fromJson(json['image'])
            : null,
        this.marketData = Helpers.parseMarketData(json['market_data']),
        this.communityData = json.containsKey('community_data')
            ? CoinCommunityData.fromJson(json['community_data'])
            : null,
        this.developerData = json.containsKey('developer_data')
            ? CoinDeveloperData.fromJson(json['developer_data'])
            : null,
        this.publicInterestStats = json.containsKey('public_interest_stats')
            ? CoinPublicInterestsStats.fromJson(json['public_interest_stats'])
            : null;

  @override
  String toString() {
    return '${Helpers.getTypeName(CoinHistory)}: id = $id, symbol = $symbol, name = $name';
  }
}
