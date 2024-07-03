import 'package:coingecko_api/data/image_info.dart';
import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// A class representing the status update project data.
class StatusUpdateProject {
  /// The type of the project.
  final String type;

  /// The identifier of the project.
  final String id;

  /// The name of the project.
  final String name;

  /// The symbol of the project, if available.
  final String? symbol;

  /// The image associated with the project, if available.
  final ImageInfo? image;

  /// Constructs a [StatusUpdateProject] instance from a JSON map.
  ///
  /// The [json] parameter is a map containing the project data.
  StatusUpdateProject.fromJson(Map<String, dynamic> json)
      : this.type = Convert.toStr(json['type'], ''),
        this.id = Convert.toStr(json['id'], ''),
        this.name = Convert.toStr(json['name'], ''),
        this.symbol = Convert.toStrN(json['symbol']),
        this.image = json.containsKey('image')
            ? ImageInfo.fromJson(json['image'])
            : null;

  /// Returns a string representation of the [StatusUpdateProject] instance.
  @override
  String toString() {
    return '${Helpers.getTypeName(StatusUpdateProject)}: type = $type, id = $id, name = $name';
  }
}
