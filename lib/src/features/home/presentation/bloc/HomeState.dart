abstract class ImageState {}

class ImageInitial extends ImageState {}

class ImageLoading extends ImageState {}

class ImagePicked extends ImageState {
  final String imagePath;
  ImagePicked({required this.imagePath});
}

class ImageError extends ImageState {
  final String message;
  ImageError({required this.message});
}
