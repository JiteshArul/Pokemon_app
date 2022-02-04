import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';
import 'package:pokemon_app/data/repositories/pokemon_repository.dart';
import 'package:pokemon_app/domain/models/pokemon_model.dart';
part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(PokemonInitial());
  void fetchPokemon(String a) {
    PokemonRepo.getPokemon(a).then((pokemon) =>
        emit(ShowPokemonImage(pokemon_image: pokemon.pokemon_image)));
  }
}
