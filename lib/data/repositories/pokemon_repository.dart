import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:pokemon_app/domain/models/pokemon_model.dart';

class PokemonRepo {
  static Future<PokemonModel> getPokemon(String _pokemonName) async {
    final result = await http
        .get(Uri.parse("https://pokeapi.co/api/v2/pokemon/$_pokemonName"));
    if (result.statusCode != 200) {
      throw Exception();
    }
    return parsedJson(result.body);
  }

  static Future<PokemonNameModel> getPokemonList() async {
    final result = await http.get(
        Uri.parse("https://pokeapi.co/api/v2/pokemon/?limit=500&offset=500"));
    if (result.statusCode != 200) {
      throw Exception();
    }
    return parseJson(result.body);
  }

  static PokemonModel parsedJson(final response) {
    final _jsonDecoded = json.decode(response);
    final _jsonPokemon = _jsonDecoded;
    return PokemonModel.fromJson(_jsonPokemon);
  }
}

PokemonNameModel parseJson(final response) {
  final _jsonDecoded = json.decode(response);
  final _jsonPokemon = _jsonDecoded;
  return PokemonNameModel.fromJson(_jsonPokemon);
}
