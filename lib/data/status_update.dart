import 'package:coingecko_api/data/status_update_project.dart';
import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

class StatusUpdate {
  final String description;
  final String category;
  final DateTime createdAt;
  final String user;
  final String userTitle;
  final bool? pin;
  final StatusUpdateProject? project;

  StatusUpdate.fromJson(Map<String, dynamic> json)
      : this.description = Convert.toNotNullableString(json['description'], ''),
        this.category = Convert.toNotNullableString(json['category'], ''),
        this.createdAt = Convert.toDateTime(json['created_at']) ?? Helpers.defaultDateTime(),
        this.user = Convert.toNotNullableString(json['user'], ''),
        this.userTitle = Convert.toNotNullableString(json['user_title'], ''),
        this.pin = Convert.toNullableBoolean(json['pin']),
        this.project =
            json.containsKey('project') ? StatusUpdateProject.fromJson(json['project']) : null {}

  @override
  String toString() {
    return '${Helpers.getTypeName(StatusUpdate)}: createdAt = $createdAt, category = $category, description = $description';
  }
}
