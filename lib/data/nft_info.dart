import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// NFT info data wrapper
///
/// This class represents the information of an NFT collection.
class NftInfo {
  /// NFT collection identifier
  final String id;

  /// NFT collection name
  final String name;

  /// NFT collection contract address
  final String? contractAddress;

  /// NFT collection asset platform id
  final String assetPlatformId;

  /// NFT collection symbol
  final String symbol;

  /// Constructs an instance of [NftInfo] from a JSON map.
  ///
  /// The [json] parameter is a map containing the NFT collection data.
  NftInfo.fromJson(Map<String, dynamic> json)
      : this.id = Convert.toStr(json['id'], ''),
        this.name = Convert.toStr(json['name'], ''),
        this.contractAddress = Convert.toStrN(json['contract_address']),
        this.assetPlatformId = Convert.toStr(json['asset_platform_id'], ''),
        this.symbol = Convert.toStr(json['symbol'], '') {}

  /// Returns a string representation of the [NftInfo] instance.
  ///
  /// The string contains the type name and the id and name of the NFT collection.
  @override
  String toString() {
    return '${Helpers.getTypeName(NftInfo)}: id = $id, name = $name';
  }
}
