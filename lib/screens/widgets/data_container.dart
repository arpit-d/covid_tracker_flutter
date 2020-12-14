import 'package:flutter/material.dart';

class DataContainer extends StatelessWidget {
  final String title;
  final String numbers;
  final Color bgColor;

  const DataContainer({Key key, this.title, this.numbers, this.bgColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      height: h * 0.14,
      width: w * 0.42,
      decoration: BoxDecoration(
          color: const Color(0xFF101010),
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            title,
            style: TextStyle(
                color: bgColor, fontSize: 17, fontWeight: FontWeight.w600),
          ),
          Text(
            numbers,
            style: TextStyle(
                color: bgColor, fontSize: 17, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
