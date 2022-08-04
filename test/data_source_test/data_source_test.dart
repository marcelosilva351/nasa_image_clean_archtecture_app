import 'package:flutter_test/flutter_test.dart';
import 'package:idade_cachorro/data/data_sources_interfaces/IImageDayDataSource.dart';
import 'package:idade_cachorro/data/datasources/image_day_data_source.dart';

void main() {
  IImageDayDataSource imageDayDataSource = ImageDayDataSource();

  test("get Image", () async {
    var resultApi = await imageDayDataSource.GetImageDay("2022-07-10");
    expect(resultApi.isNotEmpty, true);
  });
}
