import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// Asset platform data wrapper
class AssetPlatform {
  /// Asset platform identifier
  final String id;

  /// Asset platform name
  final String name;

  /// Short name of the asset platform
  final String shortName;

  /// Chain identifier of the asset platform
  final int? chainIdentifier;

  AssetPlatform.fromJson(Map<String, dynamic> json)
      : this.id = Convert.toNotNullableString(json['id'], ''),
        this.chainIdentifier = Convert.toInt(json['chain_identifier']),
        this.name = Convert.toNotNullableString(json['name'], ''),
        this.shortName = Convert.toNotNullableString(json['shortName'], '');

  @override
  String toString() {
    return '${Helpers.getTypeName(AssetPlatform)}: id = $id, name = $name';
  }
}
