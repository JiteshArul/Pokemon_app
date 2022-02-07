import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokemon_app/data/repositories/pokemon_repository.dart';
part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(PokemonInitial());
  void fetchPokemon(String a) {
    PokemonRepo.getPokemon(a).then((pokemon) => emit(ShowPokemonImage(
        pokemonName: pokemon.pokemonName,
        pokemonImage: pokemon.pokemonImage,
        baseExperience: pokemon.baseExperience,
        pokemonIcon: pokemon.pokemonIcon)));
  }

  void fetchPokemonNames() {
    PokemonRepo.getPokemonList().then(
        (pokemon) => emit(PokemonData(name: pokemon.name, url: pokemon.url)));
  }
}
