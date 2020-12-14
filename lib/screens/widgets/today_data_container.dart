import 'package:covid_tracker/screens/widgets/title_text.dart';
import 'package:flutter/material.dart';

import 'data_container.dart';

class TodayDataContainer extends StatelessWidget {
  final AsyncSnapshot snapshot;
  const TodayDataContainer(this.snapshot);
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Container(
      height: h * 0.37,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleText(
            title: 'Today\'s Stats',
          ),
          SizedBox(
            height: h * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DataContainer(
                title: 'Total',
                numbers: snapshot.data.casesTimeSeries.last.dailyconfirmed,
                bgColor: Color(0xFF1F85DE),
              ),
              DataContainer(
                title: 'Recovered',
                numbers: snapshot.data.casesTimeSeries.last.dailyrecovered,
                bgColor: Color(0xFF25DE1F),
              ),
            ],
          ),
          SizedBox(
            height: h * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DataContainer(
                title: 'Deceased',
                numbers: snapshot.data.casesTimeSeries.last.dailydeceased,
                bgColor: Color(0xFFDE311F),
              ),
              DataContainer(
                title: 'Date',
                numbers: snapshot.data.casesTimeSeries.last.date,
                bgColor: Color(0xFFDE781F),
              ),
            ],
          ),
          SizedBox(
            height: h * 0.018,
          ),
        ],
      ),
    );
  }
}
