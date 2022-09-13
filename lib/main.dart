import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task2/cacheHelper/sharedpref.dart';
import 'package:task2/cubit/cubit.dart';
import 'package:task2/layout/CounterScreen.dart';
import 'bloc_observer.dart';
import 'cubit/states.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  bool? isdark = CacheHelper.getboolean(key: 'isDark');
  int? count = CacheHelper.getData(key: 'counter');
  runApp(HomeLayout(count, isdark));
}

class HomeLayout extends StatelessWidget {
  int? count;
  bool? dark;
  HomeLayout(this.count, this.dark);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Counter()
        ..savedata(fromshared: count)
        ..changeMood(fromshared: dark),
      child: BlocConsumer<Counter, CounterStates>(
          listener: (context, state) {},
          builder: (context, state) => MaterialApp(
              theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                colorScheme: ColorScheme.light(),
              ),
              darkTheme: ThemeData(
                colorScheme: ColorScheme.dark(),
                scaffoldBackgroundColor: Colors.black,
              ),
              debugShowCheckedModeBanner: false,
              themeMode: Counter.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home: CounterScreen())),
    );
  }
}
