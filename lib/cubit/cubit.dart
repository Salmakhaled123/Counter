import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task2/cubit/states.dart';
import '../cacheHelper/sharedpref.dart';

class Counter extends Cubit<CounterStates> {
  Counter() : super(CounterInitialState());
  int counter = 0;
  bool isDark = true;
  static Counter get(context) => BlocProvider.of(context);
  void Increment() {
    counter++;

    emit(CounterIncremented(counter));
  }

  void Decrement() {
    counter--;

    emit(CounterDecremented(counter));
  }

  Future savedata({int? fromshared}) async {
    if (fromshared != null) {
      counter = fromshared;
      emit(SavaDataSuccessfully());
    }
  }

  void changeMood({bool? fromshared}) {
    if (fromshared != null) {
      isDark = fromshared;
      emit(Changemood());
    } else {
      isDark = !isDark;
      CacheHelper.setboolean(key: 'isDark', value: isDark).then((value) {
        emit(Changemood());
      });
    }
  }
}
