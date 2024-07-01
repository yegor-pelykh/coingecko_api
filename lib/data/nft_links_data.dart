import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// Data wrapper for the links of NFT collection
class NftLinksData {
  /// Homepage
  final String homepage;

  /// Twitter
  final String? twitter;

  /// Discord
  final String? discord;

  NftLinksData.fromJson(Map<String, dynamic> json)
      : this.homepage = Convert.toStr(json['homepage'], ''),
        this.twitter = Convert.toStrN(json['twitter']),
        this.discord = Convert.toStrN(json['discord']) {}

  @override
  String toString() {
    return '${Helpers.getTypeName(NftLinksData)}: Homepage = $homepage';
  }
}
