import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class EmptyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      elevation: 2,
      child: Container(
          padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.075),
          width: MediaQuery.of(context).size.width * 0.95,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Container(
              child: LoadingAnimationWidget.inkDrop(
                  color: Theme.of(context).primaryColor, size: 50))),
    );
  }
}
