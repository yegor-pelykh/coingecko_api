import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// Event data wrapper
class Event {
  /// Event type
  final String type;

  /// Event title
  final String title;

  /// Event description
  final String description;

  /// Event organizer
  final String organizer;

  /// Start date
  final DateTime startDate;

  /// End date
  final DateTime endDate;

  /// Website
  final String website;

  /// E-mail
  final String email;

  /// Venue of the event
  final String venue;

  /// Address of the event
  final String address;

  /// City of the event
  final String city;

  /// Country of the event
  final String country;

  /// Screenshot of the event
  final String screenshot;

  Event.fromJson(Map<String, dynamic> json)
      : this.type = Convert.toNotNullableString(json['type'], ''),
        this.title = Convert.toNotNullableString(json['title'], ''),
        this.description = Convert.toNotNullableString(json['description'], ''),
        this.organizer = Convert.toNotNullableString(json['organizer'], ''),
        this.startDate =
            Convert.toDateTime(json['start_date']) ?? Helpers.defaultDateTime(),
        this.endDate =
            Convert.toDateTime(json['end_date']) ?? Helpers.defaultDateTime(),
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
