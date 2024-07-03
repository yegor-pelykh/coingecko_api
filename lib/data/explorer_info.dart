import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// Data wrapper for the explorer information.
class ExplorerInfo {
  /// The name of the explorer.
  final String name;

  /// The link to the explorer.
  final String link;

  /// Constructs an [ExplorerInfo] instance from a JSON map.
  ///
  /// The [json] parameter is a map containing the explorer information.
  ExplorerInfo.fromJson(Map<String, dynamic> json)
      : this.name = Convert.toStr(json['name'], ''),
        this.link = Convert.toStr(json['link'], '') {}

  /// Returns a string representation of the [ExplorerInfo] instance.
  ///
  /// The string contains the type name and the values of the [name] and [link] fields.
  @override
  String toString() {
    return '${Helpers.getTypeName(ExplorerInfo)}: Name = $name, Link = $link';
  }
}
