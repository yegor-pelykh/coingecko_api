import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// Data wrapper for the links of an NFT collection.
class NftLinksData {
  /// The homepage URL of the NFT collection.
  final String homepage;

  /// The Twitter handle or URL of the NFT collection.
  final String? twitter;

  /// The Discord invite link or URL of the NFT collection.
  final String? discord;

  /// Constructs an instance of [NftLinksData] from a JSON map.
  ///
  /// [json] is a map containing key-value pairs corresponding to the fields
  /// of this class.
  NftLinksData.fromJson(Map<String, dynamic> json)
      : this.homepage = Convert.toStr(json['homepage'], ''),
        this.twitter = Convert.toStrN(json['twitter']),
        this.discord = Convert.toStrN(json['discord']) {}

  /// Returns a string representation of the [NftLinksData] instance.
  @override
  String toString() {
    return '${Helpers.getTypeName(NftLinksData)}: Homepage = $homepage';
  }
}
