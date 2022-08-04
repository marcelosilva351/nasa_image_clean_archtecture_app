import 'package:idade_cachorro/domain/entities/image_day_entity.dart';

class ImageDayDto extends ImageDayEntity {
  ImageDayDto(
      {required String urlImg,
      required String description,
      required String title})
      : super(urlImg: urlImg, description: description, title: title);

  static ImageDayDto fromjson(Map json) {
    return ImageDayDto(
        urlImg: json["url"],
        description: json["explanation"],
        title: json["copyright"]);
  }

  Map toJson() {
    return {"url": urlImg, "explanation": description, "copyright": title};
  }
}
