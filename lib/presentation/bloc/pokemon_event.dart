part of 'pokemon_bloc.dart';

abstract class PokemonEvent extends Equatable {
  const PokemonEvent();

  @override
  List<Object> get props => [];
}

class FetchPokemon extends PokemonEvent {
  final String pokemon;
  FetchPokemon(this.pokemon);
  List<Object> get props => [pokemon];
}

abstract class PokemonSearchEvent extends Equatable {
  const PokemonSearchEvent();

  @override
  List<Object> get props => [];
}

class SearchPokemon extends PokemonEvent {
  final String pokemon;
  SearchPokemon(this.pokemon);
  List<Object> get props => [pokemon];
}
