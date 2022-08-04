import 'package:idade_cachorro/data/dto/image_day_dto.dart';

abstract class IImageDayDataSource {
  Future<Map> GetImageDay(String date);
}
