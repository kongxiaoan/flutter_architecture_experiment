

import 'package:mvvm_demo/base/BaseRepository.dart';

class UserListRepository extends BaseRepository {

  Future<List<String>> requestUsers() async{
    await Future.delayed(Duration(seconds: 3));
    return Future(() => ["Jack","Tome", "Rose", "PingAn"]);
  }
}