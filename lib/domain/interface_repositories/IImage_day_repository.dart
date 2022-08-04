import 'package:idade_cachorro/domain/entities/image_day_entity.dart';

abstract class IImageOfTheDayRepository {
  Future<ImageDayEntity> getImageOfTheDay(String date);
}
