import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokemon_app/data/repositories/pokemon_repository.dart';
import 'package:pokemon_app/domain/models/pokemon_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<String> iterator(int a) {
  List<String> x = [];
  for (int i = 0; i < a; i++) {
    x.add((Random().nextInt(1000) + 1).toString());
  }
  return x;
}

class MainScreen extends StatelessWidget {
  List<String> pokipoki = iterator(100);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: GridView.count(
      crossAxisCount: 5,
      children: pokipoki
          .map((e) => Container(
                width: 200,
                height: 200,
                child: FutureBuilder<PokemonModel>(
                    future: PokemonRepo.getPokemon(e),
                    builder: (BuildContext context,
                        AsyncSnapshot<PokemonModel> snapshot) {
                      if (!snapshot.hasData) {
                        // while data is loading:
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        // data loaded:
                        final pokemonImage = snapshot.data!.pokemon_image;
                        return Center(
                          child: SvgPicture.network(
                            pokemonImage,
                            fit: BoxFit.fill,
                          ),
                        );
                      }
                    }),
              ))
          .toList(),
    )));
  }
}
