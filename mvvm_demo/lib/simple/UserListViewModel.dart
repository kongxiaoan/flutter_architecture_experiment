import 'dart:async';

import 'package:mvvm_demo/base/BaseRepository.dart';
import 'package:mvvm_demo/base/BaseViewModel.dart';

import 'UserListRepository.dart';

class UserListViewModel extends BaseViewModel<UserListRepository> {
  UserListViewModel(super.repository);

  getUserLists() {
    return repository.requestUsers();
  }
}
