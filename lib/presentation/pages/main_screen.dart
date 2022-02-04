import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../bloc/pokemon_bloc.dart';
import 'package:pokemon_app/data/repositories/pokemon_repository.dart';
import 'package:pokemon_app/domain/models/pokemon_model.dart';
import 'package:bloc/bloc.dart';

List<String> iterator(int a) {
  List<String> x = [];
  for (int i = 0; i < a; i++) {
    x.add((Random().nextInt(1000) + 1).toString());
  }
  return x;
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PokemonBloc>(context).fetchPokemon('4');
    return Scaffold(body: Center(child:
        BlocBuilder<PokemonBloc, PokemonState>(builder: (context, state) {
      print(state);
      if (!(state is ShowPokemonImage)) return CircularProgressIndicator();
      final work = (state as ShowPokemonImage).pokemon_image;
      print(work);
      return GridView.count(
          crossAxisCount: 5, children: [SvgPicture.network(work)]);
    })));
  }
}
