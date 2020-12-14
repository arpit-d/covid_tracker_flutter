import 'package:covid_tracker/models/state_changer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocationSelector extends StatefulWidget {
  final AsyncSnapshot snapshot;
  const LocationSelector(this.snapshot);
  @override
  _LocationSelectorState createState() => _LocationSelectorState();
}

class _LocationSelectorState extends State<LocationSelector> {
  List<String> state = List();
  var v = 'Total';

  @override
  void initState() {
    for (int i = 0; i < widget.snapshot.data.statewise.length; i++) {
      state.add(widget.snapshot.data.statewise[i].state);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final stateProvider = Provider.of<StateChanger>(context);

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          border: Border.all(color: Colors.grey, width: 2)),
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width * 0.92,
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.arrow_downward),
          ),
          isExpanded: true,
          value: v,
          items: state.map<DropdownMenuItem<String>>((var value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '$value',
                  style: Theme.of(context).textTheme.headline1,
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }).toList(),
          onChanged: (val) async {
            setState(() => v = val);
            stateProvider.changeState(state.indexOf(val));
          },
        ),
      ),
    );
  }
}
