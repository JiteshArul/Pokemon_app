class PokemonModel {
  String pokemon_image;
  PokemonModel({required this.pokemon_image});

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    print(PokemonModel(
        pokemon_image: json["other"]["dream_world"]["front_default"]));
    return PokemonModel(
        pokemon_image: json["other"]["dream_world"]["front_default"]);
  }
}
