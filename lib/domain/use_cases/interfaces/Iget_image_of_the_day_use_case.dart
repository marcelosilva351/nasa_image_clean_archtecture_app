import 'package:idade_cachorro/domain/entities/image_day_entity.dart';
import 'package:intl/intl.dart';

abstract class IGetImageOfTheDayUseCase {
  Future<ImageDayEntity> getImageOfTheDay(DateTime date);

  String getDateFormated(DateTime date);
}
