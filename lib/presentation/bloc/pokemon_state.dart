part of 'pokemon_bloc.dart';

abstract class PokemonState extends Equatable {
  const PokemonState();

  @override
  List<Object> get props => [];
}

class PokemonInitial extends PokemonState {}

class ShowPokemonImage extends PokemonState {
  @override
  List<Object> get props => [pokemonImage];
  final String pokemonImage;
  final String pokemonName;
  final String pokemonIcon;
  final List<String> pokemonStatsName;
  final List<int> pokemonStatsValue;
  ShowPokemonImage(
      {required this.pokemonImage,
      required this.pokemonName,
      required this.pokemonIcon,
      required this.pokemonStatsName,
      required this.pokemonStatsValue});
}

abstract class PokemonSearchState extends Equatable {
  const PokemonSearchState();

  @override
  List<Object> get props => [];
}

class PokemonSearchInitial extends PokemonSearchState {}

class PokemonSearchData extends PokemonSearchState {
  @override
  List<Object> get props => [name, url];
  final List<String> name;
  final List<String> url;
  PokemonSearchData({
    required this.name,
    required this.url,
  });
}
