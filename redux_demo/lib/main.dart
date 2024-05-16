import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_demo/CountState.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in a Flutter IDE). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const ReduxPage(),
    );
  }
}

class ReduxPage extends StatefulWidget {
  const ReduxPage({super.key});

  @override
  State<ReduxPage> createState() => _ReduxPageState();
}

class _ReduxPageState extends State<ReduxPage> {
  final store = Store<CountState>(
    appReducer,
    middleware: middleware,
    initialState: CountState(count: 0)
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resux'),
      ),
      body: Container(
        child: StoreProvider(
          store: store,
          child: const CountWidget(),
        ),
      ),
    );
  }
}

class CountWidget extends StatelessWidget {
  const CountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<CountState>(builder: (context, countState) {
      return Column(
        children: [
          Expanded(child: Center(
            child: Text(countState.state.count.toString()),
          )),
          Center(
            child: FloatingActionButton(
              onPressed: () {
                countState.dispatch(AddCountAction());
              },
              child: const Text("+"),
            ),
          ),
          Center(
            child: FloatingActionButton(
              onPressed: () {
                countState.dispatch(DecCountAction());
              },
              child: const Text('-'),
            ),
          ),
          const SizedBox(
            height: 100,
          )
        ],
      );
    });
  }
}
