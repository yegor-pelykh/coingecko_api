import 'package:coingecko_api/data/status_update_project.dart';
import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// A class representing a status update.
class StatusUpdate {
  /// A brief description of the status update.
  final String description;

  /// The category of the status update.
  final String category;

  /// The date and time when the status update was created.
  final DateTime createdAt;

  /// The user who made the status update.
  final String user;

  /// The title of the user who made the status update.
  final String userTitle;

  /// Indicates whether the status update is pinned.
  final bool? pin;

  /// The project associated with the status update.
  final StatusUpdateProject? project;

  /// Constructs a [StatusUpdate] instance from a JSON map.
  ///
  /// [json] is a map containing the key-value pairs for the status update properties.
  StatusUpdate.fromJson(Map<String, dynamic> json)
      : this.description = Convert.toStr(json['description'], ''),
        this.category = Convert.toStr(json['category'], ''),
        this.createdAt =
            Convert.toDateTime(json['created_at'], Helpers.defaultDateTime()),
        this.user = Convert.toStr(json['user'], ''),
        this.userTitle = Convert.toStr(json['user_title'], ''),
        this.pin = Convert.toBooleanN(json['pin']),
        this.project = json.containsKey('project')
            ? StatusUpdateProject.fromJson(json['project'])
            : null;

  /// Returns a string representation of the status update.
  @override
  String toString() {
    return '${Helpers.getTypeName(StatusUpdate)}: createdAt = $createdAt, category = $category, description = $description';
  }
}
