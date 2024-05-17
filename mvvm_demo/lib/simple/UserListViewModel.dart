import 'dart:async';

import 'package:mvvm_demo/base/BaseRepository.dart';
import 'package:mvvm_demo/base/BaseViewModel.dart';

import 'UserListRepository.dart';

class UserListViewModel extends BaseViewModel<UserListRepository> {
  UserListViewModel(super.repository);

  StreamController controller = StreamController<List<String>>.broadcast();

  getUserLists() {
    return repository.requestUsers().then((value) => controller.add(value));
  }
}
