

import 'package:mvvm_demo/base/BaseRepository.dart';

class UserListRepository extends BaseRepository {

  Future<List<String>> requestUsers() async{
    return Future(() => ["Jack","Tome", "Rose", "PingAn"]);
  }
}