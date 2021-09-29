import 'package:covid_tracker_app/models/covid_data_model.dart';
import 'package:covid_tracker_app/screens/tracker_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

//Http package
import 'package:http/http.dart' as http;

// JSON converter
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  LoadingScreenState createState() => new LoadingScreenState();
}

class LoadingScreenState extends State<LoadingScreen> {
  String _url = 'https://api.covid19india.org/state_district_wise.json';
  Map<String, dynamic> covidData = {};
  List<CovidDataModel> cityData = [];
  List<CovidDataModel> stateData = [];

  void _getCovidData() async {
    final response = await http.get(
      Uri.parse(_url),
      headers: {"Accept": "application/json"},
    );

    if (response.statusCode != 200) {
      return;
    }

    covidData = jsonDecode(response.body);

    covidData.forEach((key, value) {
      int totalActive = 0;
      int totalRecovered = 0;
      int totalConfirmed = 0;
      int totalDeceased = 0;

      value['districtData'].forEach((key, value) {
        cityData.add(new CovidDataModel(key, value['active'],
            value['recovered'], value['confirmed'], value['deceased']));

        totalActive += int.parse(value['active'].toString()) > 0
            ? int.parse(value['active'].toString())
            : 0;
        totalRecovered += int.parse(value['recovered'].toString()) > 0
            ? int.parse(value['recovered'].toString())
            : 0;
        totalConfirmed += int.parse(value['confirmed'].toString()) > 0
            ? int.parse(value['confirmed'].toString())
            : 0;
        totalDeceased += int.parse(value['deceased'].toString()) > 0
            ? int.parse(value['deceased'].toString())
            : 0;
      });

      stateData.add(new CovidDataModel(
          key, totalActive, totalRecovered, totalConfirmed, totalDeceased));
    });

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return TrackerScreen(
        covidData: this.cityData,
        stateData: this.stateData,
      );
    }));
  }

  @override
  void initState() {
    super.initState();

    _getCovidData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SpinKitChasingDots(
          color: Colors.black12,
          size: 50,
        ),
      ),
    );
  }
}
