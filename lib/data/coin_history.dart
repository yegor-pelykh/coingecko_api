import 'package:coingecko_api/data/coin_community_data.dart';
import 'package:coingecko_api/data/coin_developer_data.dart';
import 'package:coingecko_api/data/coin_public_interests_stats.dart';
import 'package:coingecko_api/data/image_info.dart';
import 'package:coingecko_api/data/market_data.dart';
import 'package:coingecko_api/data/localized_string.dart';
import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// A class that represents the historical data of a cryptocurrency.
class CoinHistory {
  /// The unique identifier of the coin.
  final String id;

  /// The symbol of the coin.
  final String symbol;

  /// The name of the coin.
  final String name;

  /// The name of the coin in different localizations.
  final LocalizedString? localization;

  /// The image information of the coin.
  final ImageInfo? image;

  /// The market data of the coin.
  final List<MarketData>? marketData;

  /// The community data of the coin.
  final CoinCommunityData? communityData;

  /// The developer data of the coin.
  final CoinDeveloperData? developerData;

  /// The public interest statistics of the coin.
  final CoinPublicInterestsStats? publicInterestStats;

  /// Constructs a [CoinHistory] instance from a JSON object.
  ///
  /// [json] is a map containing the key-value pairs of the coin's data.
  CoinHistory.fromJson(Map<String, dynamic> json)
      : this.id = Convert.toStr(json['id'], ''),
        this.symbol = Convert.toStr(json['symbol'], ''),
        this.name = Convert.toStr(json['name'], ''),
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

  /// Returns a string representation of the [CoinHistory] instance.
  @override
  String toString() {
    return '${Helpers.getTypeName(CoinHistory)}: id = $id, symbol = $symbol, name = $name';
  }
}
