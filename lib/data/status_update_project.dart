import 'package:coingecko_api/data/image_info.dart';
import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

class StatusUpdateProject {
  final String type;
  final String id;
  final String name;
  final String? symbol;
  final ImageInfo? image;

  StatusUpdateProject.fromJson(Map<String, dynamic> json)
      : this.type = Convert.toNotNullableString(json['type'], ''),
        this.id = Convert.toNotNullableString(json['id'], ''),
        this.name = Convert.toNotNullableString(json['name'], ''),
        this.symbol = Convert.toNullableString(json['symbol']),
        this.image = json.containsKey('image') ? ImageInfo.fromJson(json['image']) : null {}

  @override
  String toString() {
    return '${Helpers.getTypeName(StatusUpdateProject)}: type = $type, id = $id, name = $name';
  }
}
