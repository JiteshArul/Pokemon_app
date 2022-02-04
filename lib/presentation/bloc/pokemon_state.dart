part of 'pokemon_bloc.dart';

abstract class PokemonState extends Equatable {
  const PokemonState();

  @override
  List<Object> get props => [];
}

class PokemonInitial extends PokemonState {}

class ShowPokemonImage extends PokemonState {
  @override
  List<Object> get props => [pokemon_image];
  final String pokemon_image;
  ShowPokemonImage({required this.pokemon_image});
}
