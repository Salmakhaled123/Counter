import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task2/cacheHelper/sharedpref.dart';
import 'package:task2/cubit/cubit.dart';
import 'package:task2/cubit/states.dart';

class CounterScreen extends StatelessWidget {
  CounterScreen();
  @override
  Widget build(BuildContext context) {
    var cubit = Counter.get(context);
    return BlocConsumer<Counter, CounterStates>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
                actions: [
                  IconButton(
                      onPressed: () {
                        Counter.get(context).changeMood();
                        print(CacheHelper.getboolean(key: 'isDark'));
                      },
                      icon: Icon(
                        Icons.nightlight_round,
                        color: cubit.isDark ? Colors.black : Colors.white,
                      ))
                ],
                backgroundColor: Colors.red,
                title: Text(
                  'Counter',
                  style: cubit.isDark
                      ? TextStyle(color: Colors.black)
                      : TextStyle(color: Colors.white),
                )),
            body: Center(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                MaterialButton(
                    color: Colors.red,
                    onPressed: () {
                      cubit.Increment();
                      CacheHelper.putdata(key: 'counter', value: cubit.counter);
                    },
                    child: Text(
                      'plus',
                      style: cubit.isDark
                          ? TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0)
                          : TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0),
                    )),
                SizedBox(
                  width: 25,
                ),
                Text(
                  '${cubit.counter}',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 25.0,
                ),
                MaterialButton(
                  onPressed: () {
                    cubit.Decrement();
                    CacheHelper.putdata(key: 'counter', value: cubit.counter);
                  },
                  child: Text(
                    'minus',
                    style: cubit.isDark
                        ? TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)
                        : TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                  ),
                  color: Colors.red,
                )
              ]),
            ));
      },
      listener: (context, state) {},
    );
  }
}
