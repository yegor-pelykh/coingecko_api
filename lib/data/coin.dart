import 'package:coingecko_api/data/coin_community_data.dart';
import 'package:coingecko_api/data/coin_developer_data.dart';
import 'package:coingecko_api/data/coin_market_data.dart';
import 'package:coingecko_api/data/coin_links.dart';
import 'package:coingecko_api/data/coin_public_interests_stats.dart';
import 'package:coingecko_api/data/ticker.dart';
import 'package:coingecko_api/data/image_info.dart';
import 'package:coingecko_api/data/status_update.dart';
import 'package:coingecko_api/data/localized_string.dart';
import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

class Coin {
  final String id;
  final String symbol;
  final String name;
  final String? assetPlatformId;
  final Map<String, String>? platforms;
  final double blockTimeInMinutes;
  final String hashingAlgorithm;
  final List<String> categories;
  final String publicNotice;
  final List<String>? additionalNotices;
  final LocalizedString? localization;
  final LocalizedString? description;
  final CoinLinks? links;
  final ImageInfo? image;
  final String? countryOrigin;
  final DateTime? genesisDate;
  final String? contractAddress;
  final double? sentimentVotesUpPercentage;
  final double? sentimentVotesDownPercentage;
  final int? marketCapRank;
  final int? coingeckoRank;
  final double? coingeckoScore;
  final double? developerScore;
  final double? communityScore;
  final double? liquidityScore;
  final double? publicInterestScore;
  final CoinMarketData? marketData;
  final CoinCommunityData? communityData;
  final CoinDeveloperData? developerData;
  final CoinPublicInterestsStats? publicInterestStats;
  final List<StatusUpdate>? statusUpdates;
  final DateTime? lastUpdated;
  final List<Ticker>? tickers;

  static List<StatusUpdate>? _parseStatusUpdates(dynamic json) {
    final jsonList = Convert.toList(json);
    return jsonList != null
        ? jsonList.map((e) => StatusUpdate.fromJson(e)).toList()
        : null;
  }

  static List<Ticker>? _parseTickers(dynamic json) {
    final jsonList = Convert.toList(json);
    return jsonList != null
        ? jsonList.map((e) => Ticker.fromJson(e)).toList()
        : null;
  }

  Coin.fromJson(Map<String, dynamic> json)
      : this.id = Convert.toNotNullableString(json['id'], ''),
        this.symbol = Convert.toNotNullableString(json['symbol'], ''),
        this.name = Convert.toNotNullableString(json['name'], ''),
        this.assetPlatformId =
            Convert.toNullableString(json['asset_platform_id']),
        this.platforms = Helpers.parseMapStringString(json['platforms']),
        this.blockTimeInMinutes =
            Convert.toDouble(json['block_time_in_minutes']) ?? 0,
        this.hashingAlgorithm =
            Convert.toNotNullableString(json['hashing_algorithm'], ''),
        this.categories = Helpers.parseListString(json['categories']),
        this.publicNotice =
            Convert.toNotNullableString(json['public_notice'], ''),
        this.additionalNotices =
            Helpers.parseListString(json['additional_notices']),
        this.localization = json.containsKey('localization')
            ? LocalizedString.fromJson(json['localization'])
            : null,
        this.description = json.containsKey('description')
            ? LocalizedString.fromJson(json['description'])
            : null,
        this.links = json.containsKey('links')
            ? CoinLinks.fromJson(json['links'])
            : null,
        this.image = json.containsKey('image')
            ? ImageInfo.fromJson(json['image'])
            : null,
        this.countryOrigin = Convert.toNullableString(json['country_origin']),
        this.genesisDate = Convert.toDateTime(json['genesis_date']),
        this.contractAddress =
            Convert.toNullableString(json['contract_address']),
        this.sentimentVotesUpPercentage =
            Convert.toDouble(json['sentiment_votes_up_percentage']),
        this.sentimentVotesDownPercentage =
            Convert.toDouble(json['sentiment_votes_down_percentage']),
        this.marketCapRank = Convert.toInt(json['market_cap_rank']),
        this.coingeckoRank = Convert.toInt(json['coingecko_rank']),
        this.coingeckoScore = Convert.toDouble(json['coingecko_score']),
        this.developerScore = Convert.toDouble(json['developer_score']),
        this.communityScore = Convert.toDouble(json['community_score']),
        this.liquidityScore = Convert.toDouble(json['liquidity_score']),
        this.publicInterestScore =
            Convert.toDouble(json['public_interest_score']),
        this.marketData = json.containsKey('market_data')
            ? CoinMarketData.fromJson(json['market_data'])
            : null,
        this.communityData = json.containsKey('community_data')
            ? CoinCommunityData.fromJson(json['community_data'])
            : null,
        this.developerData = json.containsKey('developer_data')
            ? CoinDeveloperData.fromJson(json['developer_data'])
            : null,
        this.publicInterestStats = json.containsKey('public_interest_stats')
            ? CoinPublicInterestsStats.fromJson(json['public_interest_stats'])
            : null,
        this.statusUpdates = _parseStatusUpdates(json['status_updates']),
        this.lastUpdated = Convert.toDateTime(json['last_updated']),
        this.tickers = _parseTickers(json['tickers']) {}

  @override
  String toString() {
    return '${Helpers.getTypeName(Coin)}: id = $id, symbol = $symbol, name = $name';
  }
}
