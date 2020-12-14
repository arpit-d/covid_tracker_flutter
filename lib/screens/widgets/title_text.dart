import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String title;
  const TitleText({this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '$title',
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }
}
