import 'package:flutter/material.dart';
import 'package:mvvm_demo/base/BaseState.dart';

import 'UserListViewModel.dart';

class UserListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserListState();
}

class _UserListState extends BaseState<UserListPage, UserListViewModel> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: viewModel.getUserLists(),
      builder: (BuildContext context,
        AsyncSnapshot<List<String>> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (snapshot.hasError) {
        return Center(
          child: Text('Error： ${snapshot.error}'),
        );
      } else {
        if (snapshot.data == null || snapshot.data!.isEmpty) {
          return const Center(
            child: Text('当前没有数据～'),
          );
        }
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                return Text(snapshot.data![index]);
              }),
        );
      }
    });
  }
}
