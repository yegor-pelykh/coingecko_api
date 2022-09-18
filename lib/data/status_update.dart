import 'package:coingecko_api/data/status_update_project.dart';
import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// Status update data wrapper
class StatusUpdate {
  /// Status update description
  final String description;

  /// Status update category
  final String category;

  /// The moment at which the status update was created
  final DateTime createdAt;

  /// Status update user
  final String user;

  /// Status update user title
  final String userTitle;

  /// Indicates if the status update pinned
  final bool? pin;

  /// Status update project
  final StatusUpdateProject? project;

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

  @override
  String toString() {
    return '${Helpers.getTypeName(StatusUpdate)}: createdAt = $createdAt, category = $category, description = $description';
  }
}
