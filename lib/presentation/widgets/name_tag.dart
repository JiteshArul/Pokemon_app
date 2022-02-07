import 'package:flutter/material.dart';
import '../bloc/pokemon_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../core/word_converter.dart';

class NameTag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.1,
        padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        color: Colors.black,
        child: Center(child: BlocBuilder<PokemonBloc, PokemonState>(
          builder: (context, state) {
            PokemonBloc pokemonBloc = context.watch<PokemonBloc>();
            if (!(state is ShowPokemonImage)) {
              return LoadingAnimationWidget.halfTriangleDot(
                  color: Colors.white,
                  size: MediaQuery.of(context).size.height * 0.075);
            }
            var pokemon = (state as ShowPokemonImage);
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  pokemon.pokemonIcon,
                  fit: BoxFit.fitHeight,
                ),
                Text(
                  pokemon.pokemonName.toTitleCase(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height * 0.05),
                ),
              ],
            );
          },
        )));
  }
}
