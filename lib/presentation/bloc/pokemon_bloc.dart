import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokemon_app/data/repositories/pokemon_repository.dart';
part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(PokemonInitial());

  void fetchPokemon(String a) {
    PokemonRepo.getPokemon(a).then((pokemon) {
      var pokemonStatsName = pokemon.otherStatNames;
      pokemonStatsName.insert(0, "weight");
      pokemonStatsName.insert(0, "height");
      pokemonStatsName.insert(0, "base-experience");
      var pokemonStatsValue = pokemon.otherStatValues;
      pokemonStatsValue.insert(0, pokemon.weight);
      pokemonStatsValue.insert(0, pokemon.height);
      pokemonStatsValue.insert(0, pokemon.baseExperience);
      print(pokemonStatsValue);
      emit(ShowPokemonImage(
          pokemonName: pokemon.pokemonName,
          pokemonImage: pokemon.pokemonImage,
          pokemonIcon: pokemon.pokemonIcon,
          pokemonStatsName: pokemonStatsName,
          pokemonStatsValue: pokemonStatsValue));
    });
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
