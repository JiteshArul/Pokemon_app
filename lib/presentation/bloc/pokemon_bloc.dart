import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokemon_app/data/repositories/pokemon_repository.dart';
import 'package:pokemon_app/domain/models/pokemon_model.dart';
part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(PokemonInitial()) {
    on<PokemonEvent>((event, emit) async {
      // TODO: implement event handler
    });
  }
}
