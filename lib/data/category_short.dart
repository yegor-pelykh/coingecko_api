import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// A class representing a short form of category data.
class CategoryShort {
  /// The unique identifier of the category.
  final String id;

  /// The name of the category.
  final String name;

  /// Constructs a [CategoryShort] instance from a JSON map.
  ///
  /// The [json] parameter is a map containing the category data.
  CategoryShort.fromJson(Map<String, dynamic> json)
      : this.id = Convert.toStr(json['category_id'], ''),
        this.name = Convert.toStr(json['name'], '');

  /// Returns a string representation of the [CategoryShort] instance.
  ///
  /// The string contains the type name and the values of the [id] and [name] fields.
  @override
  String toString() {
    return '${Helpers.getTypeName(CategoryShort)}: id = $id, name = $name';
  }
}
