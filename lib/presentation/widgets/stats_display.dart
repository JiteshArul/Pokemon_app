import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pokemon_app/data/repositories/pokemon_repository.dart';
import 'package:pokemon_app/presentation/bloc/pokemon_bloc.dart';

class StatsDisplay extends StatelessWidget {
  const StatsDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05,
            top: MediaQuery.of(context).size.width * 0.025,
            bottom: MediaQuery.of(context).size.width * 0.025),
        color: Theme.of(context).backgroundColor,
        child: LoadingAnimationWidget.beat(
            color: Theme.of(context).primaryColor, size: 50));
  }
}
