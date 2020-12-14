import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'api/api_service.dart';
import 'covid_data.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'COVID TRACKER',
          style: TextStyle(color: Color(0xFF656565)),
        ),
        centerTitle: true,
      ),
      //  drawer: HomePageDrawer(height: height, width: width),
      body: HomeBody(),
    );
  }
}

class HomeBody extends StatelessWidget {
  final ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiService.fetchCovidData(),
      builder: (context, snapshot) {
        if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done) {
          return CovidData(snapshot);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
