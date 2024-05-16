class VideoStateModel {
  bool isVisible;

  VideoStateModel({required this.isVisible});

  factory VideoStateModel.initial() => VideoStateModel(isVisible: true);
}
