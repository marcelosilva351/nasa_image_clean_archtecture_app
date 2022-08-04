import 'package:flutter_test/flutter_test.dart';
import 'package:idade_cachorro/data/datasources/image_day_data_source.dart';
import 'package:idade_cachorro/data/repositories/image_day_repository.dart';
import 'package:idade_cachorro/domain/entities/image_day_entity.dart';
import 'package:idade_cachorro/domain/interface_repositories/IImage_day_repository.dart';

void main() {
  IImageOfTheDayRepository imageOfTheDayRepository =
      ImageDayRepository(ImageDayDataSource());

  test("get from dataSource a imageDto", () async {
    ImageDayEntity imageDay =
        await imageOfTheDayRepository.getImageOfTheDay("2022-07-10");

    expect(imageDay.title, "Raul Villaverde");
  });
}
