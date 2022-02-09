import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:pokemon_app/presentation/bloc/pokemon_bloc.dart';
import '../../core/word_converter.dart';

class SearchBar extends StatelessWidget {
  List<String> name = [];
  List<String> url = [];
  final _newTextFieldController = new FloatingSearchBarController();
  @override
  Widget build(BuildContext context) {
    return FloatingSearchBar(
      hint: 'Search Pokemon',
      controller: _newTextFieldController,
      elevation: 0,
      onSubmitted: (query) {
        BlocProvider.of<PokemonBloc>(context, listen: false)
            .fetchPokemon(query.toAPIformat());
      },
      borderRadius: BorderRadius.all(Radius.circular(15)),
      onQueryChanged: (query) {
        BlocProvider.of<PokemonSearchBloc>(context, listen: false)
            .fetchPokemonNames(query.toAPIformat());
      },
      actions: [],
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BlocBuilder<PokemonSearchBloc, PokemonSearchState>(
                    builder: (context, state) {
                  PokemonSearchBloc pokemonSearchBloc =
                      context.watch<PokemonSearchBloc>();
                  if (state is! PokemonSearchData) {
                    return Card(
                      child: Text("No Results"),
                    );
                  }
                  name = (state).name;
                  return name.length > 20
                      ? Column(
                          children: name
                              .map((e) => TextButton(
                                  onPressed: () {
                                    BlocProvider.of<PokemonBloc>(context,
                                            listen: false)
                                        .fetchPokemon(e.toAPIformat());
                                    FocusScope.of(context).unfocus();
                                    _newTextFieldController.clear();
                                    _newTextFieldController.close();
                                  },
                                  child: Container(
                                      height: 35,
                                      child: Text(
                                        e.toTitleCase(),
                                        style: TextStyle(color: Colors.black),
                                      ))))
                              .toList())
                      : Column(
                          children: name
                              .map((e) => TextButton(
                                  onPressed: () {
                                    BlocProvider.of<PokemonBloc>(context,
                                            listen: false)
                                        .fetchPokemon(e.toAPIformat());
                                    FocusScope.of(context).unfocus();
                                    _newTextFieldController.clear();
                                    _newTextFieldController.close();
                                  },
                                  child: Container(
                                      alignment: Alignment.center,
                                      height: 35,
                                      child: Text(e.toTitleCase(),
                                          style:
                                              TextStyle(color: Colors.black)))))
                              .toList());
                })
              ],
            ),
          ),
        );
      },
      transition: CircularFloatingSearchBarTransition(),
    );
  }
}
