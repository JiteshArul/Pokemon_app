import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/presentation/widgets/image_card.dart';
import 'package:pokemon_app/presentation/widgets/name_tag.dart';
import 'package:pokemon_app/presentation/widgets/search_bar.dart';
import 'package:pokemon_app/presentation/widgets/stats_display.dart';
import '../bloc/pokemon_bloc.dart';

class MainScreen extends StatelessWidget {
  ScrollController control = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: control,
              child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                    Container(
                      color: Theme.of(context).primaryColor,
                      padding: const EdgeInsets.all(20),
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: double.infinity,
                    ),
                    ImageCard(),
                    NameTag(),
                    StatsDisplay(),
                  ])),
            ),
            BlocProvider(
              create: (context) => PokemonSearchBloc(),
              child: SearchBar(),
            )
          ],
        ));
  }
}
