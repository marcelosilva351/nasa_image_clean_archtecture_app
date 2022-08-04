import 'package:flutter/cupertino.dart';
import 'package:idade_cachorro/domain/entities/image_day_entity.dart';
import 'package:idade_cachorro/domain/interface_repositories/IImage_day_repository.dart';
import 'package:idade_cachorro/domain/use_cases/interfaces/Iget_image_of_the_day_use_case.dart';
import 'package:intl/intl.dart';

class GetImageOfTheDayUseCase implements IGetImageOfTheDayUseCase {
  late IImageOfTheDayRepository _imageRepository;

  GetImageOfTheDayUseCase(IImageOfTheDayRepository imageRepository) {
    _imageRepository = imageRepository;
  }

  Future<ImageDayEntity> getImageOfTheDay(DateTime date) async {
    String dateParamRepository = getDateFormated(date);
    try {
      return _imageRepository.getImageOfTheDay(dateParamRepository);
    } catch (e) {
      throw Exception();
    }
  }

  String getDateFormated(DateTime date) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(date);
    return formatted;
  }
}
