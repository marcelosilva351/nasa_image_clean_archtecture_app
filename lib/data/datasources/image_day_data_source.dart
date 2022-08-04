import 'dart:convert';

import 'package:idade_cachorro/data/data_sources_interfaces/IImageDayDataSource.dart';
import 'package:http/http.dart' as http;

class ImageDayDataSource implements IImageDayDataSource {
  var apiKey = "RvksJaTnKOfd9l2ub0Ngmd6Z9yhqSrOiinFqRi1F";

  @override
  Future<Map> GetImageDay(String date) async {
    var response = await http.get(Uri.parse(
        "https://api.nasa.gov/planetary/apod?api_key=$apiKey&date=$date"));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw Exception();
  }
}
