class PokemonModel {
  String pokemonName;
  String pokemonImage;
  int baseExperience;
  String pokemonIcon;
  PokemonModel(
      {required this.pokemonImage,
      required this.baseExperience,
      required this.pokemonName,
      required this.pokemonIcon});

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
        pokemonName: json['name'],
        pokemonImage:
            json["sprites"]["other"]["dream_world"]["front_default"] != null
                ? json["sprites"]["other"]["dream_world"]["front_default"]
                : json["sprites"]["other"]["official-artwork"]["front_default"],
        baseExperience: json["base_experience"],
        pokemonIcon: json['sprites']['front_default']);
  }
}

class PokemonNameModel {
  List<String> name;
  List<String> url;
  PokemonNameModel({required this.name, required this.url});
  factory PokemonNameModel.fromJson(Map<String, dynamic> json) {
    print(PokemonNameModel(
        name: List<String>.from(json['results'].map((e) {
          List<String> a = [];
          a.add(e['name']);
        })),
        url: List<String>.from(json['results'].map((e) {
          List<String> a = [];
          a.add(e['url']);
        }))));
    return PokemonNameModel(
        name: List<String>.from(json['results'].map((e) {
          List<String> a = [];
          a.add(e['name']);
        })),
        url: List<String>.from(json['results'].map((e) {
          List<String> a = [];
          a.add(e['url']);
        })));
  }
}
