import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokemon_app/presentation/bloc/pokemon_bloc.dart';
import 'empty_card.dart';

class ImageCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).primaryColor,
        padding: const EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height * 0.50,
        width: double.infinity,
        child:
            BlocBuilder<PokemonBloc, PokemonState>(builder: (context, state) {
          PokemonBloc pokemonBloc = context.watch<PokemonBloc>();
          if (!(state is ShowPokemonImage)) return EmptyCard();
          var pokemon = (state as ShowPokemonImage);
          print(state);
          return SizedBox(
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                elevation: 2,
                child: Container(
                  padding: EdgeInsets.all(
                      MediaQuery.of(context).size.height * 0.075),
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: pokemon.pokemonImage.lastIndexOf(r'.svg') != -1
                      ? SvgPicture.network(
                          pokemon.pokemonImage,
                          allowDrawingOutsideViewBox: true,
                        )
                      : Image.network(
                          pokemon.pokemonImage,
                        ),
                )),
          );
        }));
  }
}
