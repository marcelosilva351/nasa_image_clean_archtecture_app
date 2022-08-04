import 'package:flutter_test/flutter_test.dart';
import 'package:idade_cachorro/data/datasources/image_day_data_source.dart';
import 'package:idade_cachorro/data/repositories/image_day_repository.dart';
import 'package:idade_cachorro/domain/entities/image_day_entity.dart';
import 'package:idade_cachorro/domain/interface_repositories/IImage_day_repository.dart';
import 'package:idade_cachorro/domain/use_cases/get_image_of_the_day_use_case.dart';
import 'package:idade_cachorro/domain/use_cases/interfaces/Iget_image_of_the_day_use_case.dart';

void main() {
  IGetImageOfTheDayUseCase getImageOfTheDayUseCase =
      GetImageOfTheDayUseCase(repositoryMock());
  IGetImageOfTheDayUseCase getImageOfTheDayUseCaseException =
      GetImageOfTheDayUseCase(repositoryMockException());
  IGetImageOfTheDayUseCase getImageOfTheDayUseCaseImple =
      GetImageOfTheDayUseCase(ImageDayRepository(ImageDayDataSource()));

  test("return a string formated", () {
    var result = getImageOfTheDayUseCase.getDateFormated(DateTime.now());
    expect("2022-08-03", result);
  });

  test("get image from repository", () async {
    ImageDayEntity imageDayEntity =
        await getImageOfTheDayUseCase.getImageOfTheDay(DateTime.now());
    expect("title", imageDayEntity.title);
  });

  test("get exception", () async {
    var result;
    try {
      await getImageOfTheDayUseCaseException.getImageOfTheDay(DateTime.now());
      result = "sem erro";
    } catch (e) {
      result = "exception";
    }
    expect("exception", result);
  });

  test("testing implementation", () async {
    var result = await getImageOfTheDayUseCaseImple
        .getImageOfTheDay(DateTime.now().subtract(Duration(days: 1)));
    expect(result.title, "Bray Falls");
  });
}

class repositoryMock implements IImageOfTheDayRepository {
  @override
  Future<ImageDayEntity> getImageOfTheDay(String date) async {
    return ImageDayEntity(
        urlImg: "image", description: "descripton", title: "title");
  }
}

class repositoryMockException implements IImageOfTheDayRepository {
  @override
  Future<ImageDayEntity> getImageOfTheDay(String date) async {
    throw Exception();
  }
}
