part of 'pokemon_bloc.dart';

abstract class PokemonEvent extends Equatable {
  const PokemonEvent();

  @override
  List<Object> get props => [];
}

class FetchPokemon extends PokemonEvent {
  final pokemon;
  FetchPokemon(this.pokemon);
  List<Object> get props => [pokemon];
}
