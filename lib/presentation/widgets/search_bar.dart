import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:pokemon_app/presentation/bloc/pokemon_bloc.dart';
import '../../core/word_converter.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingSearchBar(
      hint: 'Search Pokemon',
      elevation: 0,
      onSubmitted: (query) {
        BlocProvider.of<PokemonBloc>(context).fetchPokemon(query.toAPIformat());
      },
      borderRadius: BorderRadius.all(Radius.circular(15)),
      onQueryChanged: (query) => {},
      transition: CircularFloatingSearchBarTransition(),
      actions: [],
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: Colors.blue,
          ),
        );
      },
    );
  }
}
