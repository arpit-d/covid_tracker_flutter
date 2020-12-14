import 'package:covid_tracker/models/state_changer.dart';
import 'package:covid_tracker/screens/widgets/today_data_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data_container.dart';

class StateDataContainer extends StatelessWidget {
  final AsyncSnapshot snapshot;

  const StateDataContainer(this.snapshot);
  @override
  Widget build(BuildContext context) {
    final stateChange = Provider.of<StateChanger>(context);
    double h = MediaQuery.of(context).size.height;
    return Container(
      height: h * 0.375,
      child: Column(children: [
        Text(
          'Last updated at ' +
              snapshot.data.statewise[stateChange.state].lastupdatedtime,
          style: Theme.of(context).textTheme.headline2,
        ),
        SizedBox(
          height: h * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            DataContainer(
              title: 'Total',
              numbers: snapshot.data.statewise[stateChange.state].confirmed,
              bgColor: Color(0xFF1F85DE),
            ),
            DataContainer(
              title: 'Recovered',
              numbers: snapshot.data.statewise[stateChange.state].recovered,
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
              numbers: snapshot.data.statewise[stateChange.state].deaths,
              bgColor: Color(0xFFDE311F),
            ),
            DataContainer(
              title: 'Active',
              numbers: snapshot.data.statewise[stateChange.state].active,
              bgColor: Color(0xFFDE781F),
            ),
          ],
        ),
        SizedBox(
          height: h * 0.018,
        ),
      ]),
    );
  }
}
