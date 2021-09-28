import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

class ImageInfo {
  final String? thumb;
  final String? small;
  final String? large;

  ImageInfo.fromJson(Map<String, dynamic> json)
      : this.thumb = Convert.toNullableString(json['thumb']),
        this.small = Convert.toNullableString(json['small']),
        this.large = Convert.toNullableString(json['large']) {}

  @override
  String toString() {
    return '${Helpers.getTypeName(ImageInfo)}: thumb = $thumb, small = $small, large = $large';
  }
}
