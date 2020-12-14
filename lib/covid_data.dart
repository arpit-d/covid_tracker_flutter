import 'package:covid_tracker/screens/widgets/location_selector.dart';
import 'package:covid_tracker/screens/widgets/today_data_container.dart';
import 'package:flutter/material.dart';

import 'screens/widgets/state_data_container.dart';

class CovidData extends StatelessWidget {
  final AsyncSnapshot snapshot;
  const CovidData(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: [
            TodayDataContainer(snapshot),
            Divider(
              color: Color(0xFF505050),
              thickness: 1.5,
            ),
            StateDataContainer(snapshot),
            LocationSelector(snapshot),
          ],
        ),
      ),
    );
  }
}
