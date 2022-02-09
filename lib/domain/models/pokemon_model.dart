class PokemonModel {
  String pokemonName;
  String pokemonImage;
  String pokemonIcon;
  int baseExperience;
  int height;
  int weight;
  List<String> otherStatNames;
  List<int> otherStatValues;
  PokemonModel(
      {required this.pokemonImage,
      required this.pokemonName,
      required this.pokemonIcon,
      required this.baseExperience,
      required this.height,
      required this.weight,
      required this.otherStatNames,
      required this.otherStatValues});

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
        pokemonName: json['name'],
        pokemonImage: json["sprites"]["other"]["dream_world"]
                    ["front_default"] !=
                null
            ? json["sprites"]["other"]["dream_world"]["front_default"]
            : json["sprites"]["other"]["official-artwork"]["front_default"] !=
                    null
                ? json["sprites"]["other"]["official-artwork"]["front_default"]
                : json["sprites"]["other"]["home"]["front_default"],
        pokemonIcon: json['sprites']['front_default'],
        baseExperience: json['base_experience'],
        height: json['height'],
        weight: json['weight'],
        otherStatNames: List<String>.from(json['stats'].map((e) {
          return e['stat']['name'];
        })),
        otherStatValues: List<int>.from(json['stats'].map((e) {
          return e['base_stat'];
        })));
  }
}

class PokemonNameModel {
  List<String> name;
  List<String> url;
  PokemonNameModel({required this.name, required this.url});
  factory PokemonNameModel.fromJson(Map<String, dynamic> json) {
    return PokemonNameModel(
        name: List<String>.from(json['results'].map((e) {
          return e['name'];
        })),
        url: List<String>.from(json['results'].map((e) {
          return e['url'];
        })));
  }
}
