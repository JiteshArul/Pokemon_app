part of 'pokemon_bloc.dart';

abstract class PokemonState extends Equatable {
  const PokemonState();

  @override
  List<Object> get props => [];
}

class PokemonInitial extends PokemonState {}

class ShowPokemonImage extends PokemonState {
  @override
  List<Object> get props => [pokemonImage, baseExperience];
  final String pokemonImage;
  final int baseExperience;
  final String pokemonName;
  final String pokemonIcon;
  ShowPokemonImage(
      {required this.pokemonImage,
      required this.baseExperience,
      required this.pokemonName,
      required this.pokemonIcon});
}

class PokemonData extends PokemonState {
  @override
  List<Object> get props => [name, url];
  final List<String> name;
  final List<String> url;
  PokemonData({required this.name, required this.url});
}
