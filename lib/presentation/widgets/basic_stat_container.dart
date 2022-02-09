import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:pokemon_app/presentation/bloc/pokemon_bloc.dart';
import '../../core/word_converter.dart';

var progressCeiling = [608, 200, 9999, 255, 608, 526, 230, 180, 230, 200];

class BasicStatContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Base Stats:",
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: 20),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: Colors.amber, width: 5)),
          child:
              BlocBuilder<PokemonBloc, PokemonState>(builder: (context, state) {
            PokemonBloc pokemonBloc = context.watch<PokemonBloc>();
            if (!(state is ShowPokemonImage))
              return Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: 100),
                child: LoadingAnimationWidget.beat(
                    color: Theme.of(context).primaryColor, size: 50),
              );
            var pokemon = (state as ShowPokemonImage);
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: pokemon.pokemonStatsName.map((e) {
                  int index = pokemon.pokemonStatsName.indexOf(e);
                  return Container(
                    child: Row(
                      children: [
                        Text(
                          "${e.toTitleCase()} : ${pokemon.pokemonStatsValue[index].toString()}",
                          style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.028),
                        ),
                        Container(
                            alignment: Alignment.centerLeft,
                            height: MediaQuery.of(context).size.height * 0.025,
                            width: MediaQuery.of(context).size.width * 0.24,
                            child: LinearPercentIndicator(
                              percent: (pokemon.pokemonStatsValue[index] /
                                          progressCeiling[index] >
                                      1)
                                  ? 1
                                  : pokemon.pokemonStatsValue[index] /
                                      progressCeiling[index],
                              backgroundColor:
                                  Theme.of(context).backgroundColor,
                              lineHeight: 8,
                              barRadius: Radius.circular(8),
                              progressColor: Colors.green,
                            ))
                      ],
                    ),
                  );
                }).toList());
          }),
        ),
      ],
    );
  }
}
