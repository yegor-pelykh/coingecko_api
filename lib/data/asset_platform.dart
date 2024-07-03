import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// A class representing an asset platform with its details.
class AssetPlatform {
  /// The unique identifier of the asset platform.
  final String id;

  /// The name of the asset platform.
  final String name;

  /// The short name of the asset platform.
  final String shortName;

  /// The chain identifier of the asset platform, if available.
  final int? chainIdentifier;

  /// Constructs an [AssetPlatform] instance from a JSON map.
  ///
  /// [json] is a map containing the asset platform data.
  AssetPlatform.fromJson(Map<String, dynamic> json)
      : this.id = Convert.toStr(json['id'], ''),
        this.chainIdentifier = Convert.toIntN(json['chain_identifier']),
        this.name = Convert.toStr(json['name'], ''),
        this.shortName = Convert.toStr(json['shortName'], '');

  /// Returns a string representation of the [AssetPlatform] instance.
  ///
  /// The string contains the type name and the id and name of the asset platform.
  @override
  String toString() {
    return '${Helpers.getTypeName(AssetPlatform)}: id = $id, name = $name';
  }
}
