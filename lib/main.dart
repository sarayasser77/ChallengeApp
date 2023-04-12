import 'package:bloc/bloc.dart';
import 'package:challengeapp/Screens/HomeScreen/HomeScreen.dart';
import 'package:challengeapp/Screens/detailsScreen/detailsScreen.dart';
import 'package:challengeapp/Screens/layoutscreen/layoutscreen.dart';
import 'package:challengeapp/cubit/newscubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants/observer.dart';

void main() {
  runApp(const MyApp());
  Bloc.observer=MyBlocObserver();

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>NewsCubit()..getNews())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
      home:LayoutScreen()
      // home: LayoutScreen()
      ),
    );
  }
}

