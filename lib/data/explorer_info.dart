import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// Data wrapper for the explorer info
class ExplorerInfo {
  /// Explorer name
  final String name;

  /// Explorer link
  final String link;

  ExplorerInfo.fromJson(Map<String, dynamic> json)
      : this.name = Convert.toStr(json['name'], ''),
        this.link = Convert.toStr(json['link'], '') {}

  @override
  String toString() {
    return '${Helpers.getTypeName(ExplorerInfo)}: Name = $name, Link = $link';
  }
}
