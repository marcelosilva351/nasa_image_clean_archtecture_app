import 'package:idade_cachorro/domain/entities/image_day_entity.dart';
import 'package:idade_cachorro/domain/use_cases/interfaces/Iget_image_of_the_day_use_case.dart';
import 'package:mobx/mobx.dart';
part 'image_day_controller.g.dart';

class ImageDayController = _ImageDayControllerBase with _$ImageDayController;

abstract class _ImageDayControllerBase with Store {
  late IGetImageOfTheDayUseCase _iGetImageOfTheDayUseCase;
  _ImageDayControllerBase(IGetImageOfTheDayUseCase imageOfTheDayUseCase) {
    _iGetImageOfTheDayUseCase = imageOfTheDayUseCase;
  }

  @observable
  ObservableFuture<ImageDayEntity>? imageDay;

  getImage(DateTime date) {
    try {
      imageDay =
          ObservableFuture(_iGetImageOfTheDayUseCase.getImageOfTheDay(date));
    } catch (e) {
      throw Exception();
    }
  }
}
