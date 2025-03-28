import 'package:feastly/src/features/home/presentation/bloc/HomeEvent.dart';
import 'package:feastly/src/features/home/presentation/bloc/HomeState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class PickImageBloc extends Bloc<PickImageEvent, ImageState> {
  PickImageBloc() : super(ImageInitial()) {
    on<PickImageEvent>((event, emit) async {
      emit(ImageLoading());
      try {
        final picker = ImagePicker();
        final pickedFile = await picker.pickImage(source: ImageSource.camera);

        if (pickedFile != null) {
          emit(ImagePicked(imagePath: pickedFile.path));
        } else {
          emit(ImageInitial());
        }
      } catch (e) {
        emit(ImageError(message: 'Failed to pick image: $e'));
      }
    });
  }
}
