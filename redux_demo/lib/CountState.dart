import 'package:redux/redux.dart';

class CountState {
  int count;

  CountState({required this.count});
}

final countReducer = combineReducers<int>([
  TypedReducer<int, AddCountAction>(_addHandler).call,
  TypedReducer<int, DecCountAction>(_decHandler).call
]);

CountState appReducer(CountState state, action) {
  return CountState(count: countReducer(state.count, action));
}

class AddCountAction {}

class DecCountAction {}

int _addHandler(int count, AddCountAction action) {
  count++;
  return count;
}

int _decHandler(int count, DecCountAction action) {
  count--;
  return count;
}


final List<Middleware<CountState>> middleware = [
  CountMiddleware().call,
];

class CountMiddleware implements MiddlewareClass<CountState> {
  @override
  call(Store<CountState> store, action, NextDispatcher next) {
    if(action is AddCountAction) {
      print(" addCountAction");
    } else if(action is DecCountAction) {
      print(" DecCountAction");
    }
    next(action);
  }
}