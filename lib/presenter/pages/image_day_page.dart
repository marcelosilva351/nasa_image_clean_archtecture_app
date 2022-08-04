import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:idade_cachorro/data/datasources/image_day_data_source.dart';
import 'package:idade_cachorro/data/repositories/image_day_repository.dart';
import 'package:idade_cachorro/domain/use_cases/get_image_of_the_day_use_case.dart';
import 'package:idade_cachorro/presenter/controllers/image_day_controller.dart';
import 'package:mobx/mobx.dart';

class ImageDayPage extends StatelessWidget {
  var controller = ImageDayController(
      GetImageOfTheDayUseCase(ImageDayRepository(ImageDayDataSource())));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Image"),
        ),
        backgroundColor: Color.fromARGB(255, 255, 199, 110),
        body: Observer(builder: (context) {
          if (controller.imageDay == null) {
            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: Text(
                    "Get Image",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate:
                                DateTime.now().subtract(Duration(days: 1000)),
                            lastDate: DateTime.now())
                        .then((value) {
                      if (value == null) {
                        return;
                      }
                      controller.getImage(value);
                    });
                  },
                  child: Icon(
                    Icons.image,
                    size: 120,
                    color: Colors.white,
                  ),
                )
              ],
            );
          }
          if (controller.imageDay!.status == FutureStatus.pending) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (controller.imageDay!.status == FutureStatus.rejected) {
            return Center(
              child: Text("Ocorreu um erro ao buscar a imagem"),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(30.0),
            child: ListView(
              children: [
                GestureDetector(
                  onTap: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate:
                                DateTime.now().subtract(Duration(days: 1000)),
                            lastDate: DateTime.now())
                        .then((value) {
                      if (value == null) {
                        return;
                      }
                      controller.getImage(value);
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    height: 450,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 5,
                              color: Colors.black54,
                              offset: Offset(1, 2)),
                        ],
                        image: DecorationImage(
                            image: NetworkImage(
                                controller.imageDay!.value!.urlImg),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    controller.imageDay!.value!.title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    controller.imageDay!.value!.description,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
          );
        }));
  }
}
