import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// Search trending coin data wrapper
class SearchTrendingCoin {
  /// Identifier
  final String id;

  /// Coin identifier
  final int coinId;

  /// Coin name
  final String name;

  /// Coin symbol
  final String symbol;

  /// Market capitalization rank
  final int marketCapRank;

  /// Thumbnail image url
  final String thumb;

  /// Small image url
  final String small;

  /// Large image url
  final String large;

  /// Slug
  final String slug;

  /// Price in BTC
  final double priceBtc;

  /// Score
  final int score;

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

  @override
  String toString() {
    return 'SearchTrendingCoin: id = $id, name = $name';
  }
}

class SearchTrending {
  final List<SearchTrendingCoin> coins;

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

  SearchTrending.fromJson(Map<String, dynamic> json)
      : this.coins = _parseCoins(json);

  @override
  String toString() {
    return '${Helpers.getTypeName(SearchTrendingCoin)}';
  }
}
