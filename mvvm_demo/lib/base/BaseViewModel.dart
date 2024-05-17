

import 'package:flutter/foundation.dart';
import 'package:mvvm_demo/base/BaseModel.dart';

import 'BaseRepository.dart';

abstract class BaseViewModel<T extends BaseRepository> extends ChangeNotifier {
  final T repository;

  BaseViewModel(this.repository);


}