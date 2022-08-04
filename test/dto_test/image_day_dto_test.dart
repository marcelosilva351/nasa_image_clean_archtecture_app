import 'package:flutter_test/flutter_test.dart';
import 'package:idade_cachorro/data/dto/image_day_dto.dart';
import 'package:idade_cachorro/domain/entities/image_day_entity.dart';

void main() {
  test("dto to entity", () {
    ImageDayEntity image =
        ImageDayDto(urlImg: "url", description: "", title: "");

    expect(image.urlImg, "url");
  });

  test("from json", () {
    var map = {"url": "url", "explanation": "", "copyright": ""};
    var image = ImageDayDto.fromjson(map);
    expect(image.urlImg, "url");
  });
}
