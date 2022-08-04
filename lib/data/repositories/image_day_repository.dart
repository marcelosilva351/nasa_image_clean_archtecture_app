import 'package:idade_cachorro/data/data_sources_interfaces/IImageDayDataSource.dart';
import 'package:idade_cachorro/data/dto/image_day_dto.dart';
import 'package:idade_cachorro/domain/entities/image_day_entity.dart';
import 'package:idade_cachorro/domain/interface_repositories/IImage_day_repository.dart';

class ImageDayRepository extends IImageOfTheDayRepository {
  late IImageDayDataSource _imageDayDataSouce;

  ImageDayRepository(IImageDayDataSource imageDayDataSource) {
    _imageDayDataSouce = imageDayDataSource;
  }

  @override
  Future<ImageDayEntity> getImageOfTheDay(String date) async {
    try {
      return ImageDayDto.fromjson(await _imageDayDataSouce.GetImageDay(date));
    } catch (e) {
      throw Exception();
    }
  }
}
