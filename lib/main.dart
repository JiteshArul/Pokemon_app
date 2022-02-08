import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/presentation/bloc/pokemon_bloc.dart';
import 'package:pokemon_app/presentation/pages/main_screen.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Bungee',
          primaryColor: Color(0xffc0392b),
          backgroundColor: Colors.grey[300],
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider(
          create: (context) => PokemonBloc(),
          child: MainScreen(),
        ));
  }
}
