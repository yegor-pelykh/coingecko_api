import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

class Event {
  final String type;
  final String title;
  final String description;
  final String organizer;
  final DateTime startDate;
  final DateTime endDate;
  final String website;
  final String email;
  final String venue;
  final String address;
  final String city;
  final String country;
  final String screenshot;

  Event.fromJson(Map<String, dynamic> json)
      : this.type = Convert.toNotNullableString(json['type'], ''),
        this.title = Convert.toNotNullableString(json['title'], ''),
        this.description = Convert.toNotNullableString(json['description'], ''),
        this.organizer = Convert.toNotNullableString(json['organizer'], ''),
        this.startDate = Convert.toDateTime(json['start_date']) ?? Helpers.defaultDateTime(),
        this.endDate = Convert.toDateTime(json['end_date']) ?? Helpers.defaultDateTime(),
        this.website = Convert.toNotNullableString(json['website'], ''),
        this.email = Convert.toNotNullableString(json['email'], ''),
        this.venue = Convert.toNotNullableString(json['venue'], ''),
        this.address = Convert.toNotNullableString(json['address'], ''),
        this.city = Convert.toNotNullableString(json['city'], ''),
        this.country = Convert.toNotNullableString(json['country'], ''),
        this.screenshot = Convert.toNotNullableString(json['screenshot'], '') {}

  @override
  String toString() {
    return '${Helpers.getTypeName(Event)}: title = $title';
  }
}
