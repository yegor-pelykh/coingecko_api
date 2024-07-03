import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// A class representing a trending coin search result.
class SearchTrendingCoin {
  /// The unique identifier of the coin.
  final String id;

  /// The numerical identifier of the coin.
  final int coinId;

  /// The name of the coin.
  final String name;

  /// The symbol of the coin.
  final String symbol;

  /// The market capitalization rank of the coin.
  final int marketCapRank;

  /// The URL of the thumbnail image of the coin.
  final String thumb;

  /// The URL of the small image of the coin.
  final String small;

  /// The URL of the large image of the coin.
  final String large;

  /// The slug of the coin.
  final String slug;

  /// The price of the coin in BTC.
  final double priceBtc;

  /// The score of the coin.
  final int score;

  /// Constructs a [SearchTrendingCoin] instance from a JSON object.
  ///
  /// [json] is a map containing the coin data.
  SearchTrendingCoin.fromJson(Map<String, dynamic> json)
      : this.id = Convert.toStr(json['id'], ''),
        this.coinId = Convert.toInt(json['coin_id'], 0),
        this.name = Convert.toStr(json['name'], ''),
        this.symbol = Convert.toStr(json['symbol'], ''),
        this.marketCapRank = Convert.toInt(json['market_cap_rank'], 0),
        this.thumb = Convert.toStr(json['thumb'], ''),
        this.small = Convert.toStr(json['small'], ''),
        this.large = Convert.toStr(json['large'], ''),
        this.slug = Convert.toStr(json['slug'], ''),
        this.priceBtc = Convert.toDouble(json['price_btc'], 0),
        this.score = Convert.toInt(json['score'], 0);

  /// Returns a string representation of the [SearchTrendingCoin] instance.
  @override
  String toString() {
    return 'SearchTrendingCoin: id = $id, name = $name';
  }
}

/// A class representing a collection of trending coins.
class SearchTrending {
  /// A list of trending coins.
  final List<SearchTrendingCoin> coins;

  /// Parses a list of [SearchTrendingCoin] from a JSON object.
  ///
  /// [json] is a map containing the list of coins.
  /// Returns a list of [SearchTrendingCoin] instances.
  static List<SearchTrendingCoin> _parseCoins(Map<String, dynamic> json) {
    final list = Convert.toListN(json['coins']);
    final List<SearchTrendingCoin> coins = [];
    if (list != null) {
      list.forEach((element) {
        if (element['item'] != null) {
          coins.add(SearchTrendingCoin.fromJson(element['item']));
        }
      });
    }
    return coins;
  }

  /// Constructs a [SearchTrending] instance from a JSON object.
  ///
  /// [json] is a map containing the trending coins data.
  SearchTrending.fromJson(Map<String, dynamic> json)
      : this.coins = _parseCoins(json);

  /// Returns a string representation of the [SearchTrending] instance.
  @override
  String toString() {
    return '${Helpers.getTypeName(SearchTrendingCoin)}';
  }
}
