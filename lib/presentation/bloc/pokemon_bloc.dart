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
}

class PokemonSearchBloc extends Bloc<PokemonSearchEvent, PokemonSearchState> {
  PokemonSearchBloc() : super(PokemonSearchInitial());
  void fetchPokemonNames(String a) {
    PokemonRepo.getPokemonList().then((pokemon) {
      var regex = new RegExp(a, caseSensitive: false);
      var contactsAll = pokemon.name;
      var searchlist = contactsAll.where((i) => regex.hasMatch(i)).toList();
      emit(PokemonSearchData(name: searchlist, url: pokemon.url));
    });
  }
}
