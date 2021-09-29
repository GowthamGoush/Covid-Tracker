import 'package:covid_tracker_app/models/covid_data_model.dart';
import 'package:covid_tracker_app/utils/constants.dart';
import 'package:covid_tracker_app/widgets/delegate_persistent_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:covid_tracker_app/widgets/list_region_data.dart';

class TrackerScreen extends StatefulWidget {
  TrackerScreen({required this.covidData, required this.stateData});

  final List<CovidDataModel> covidData;
  final List<CovidDataModel> stateData;

  @override
  TrackerScreenState createState() => new TrackerScreenState();
}

class TrackerScreenState extends State<TrackerScreen> {
  bool isState = false;

  String convertToString(int value) {
    String convertedString;

    value > 1000000
        ? convertedString = (value / 1000000).round().toString() + 'M'
        : value > 1000
            ? convertedString = (value / 1000).round().toString() + 'K'
            : convertedString = value.toString();

    return convertedString;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isState = !isState;
          });
        },
        child: Icon(Icons.sync),
      ),
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          slivers: [
            SliverAppBar(
              expandedHeight: 250,
              floating: false,
              pinned: false,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: appBarTitle,
                background: Image.asset(
                  'assets/images/appbar_background.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverPersistentHeader(
              delegate: Delegate(isState: isState),
              pinned: true,
              floating: true,
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (index == 0) {
                  return Container();
                }

                String regionName;
                int confirmed;
                int active;
                int recovered;
                int deceased;

                if (isState) {
                  regionName = widget.stateData[index].districtName;
                  confirmed = widget.stateData[index].confirmed;
                  active = widget.stateData[index].active;
                  recovered = widget.stateData[index].recovered;
                  deceased = widget.stateData[index].deceased;
                } else {
                  regionName = widget.covidData[index].districtName;
                  confirmed = widget.covidData[index].confirmed;
                  active = widget.covidData[index].active;
                  recovered = widget.covidData[index].recovered;
                  deceased = widget.covidData[index].deceased;
                }

                return RegionData(
                  districtName: regionName,
                  confirmed: confirmed == 0 ? '-' : convertToString(confirmed),
                  active: active == 0 ? '-' : convertToString(active),
                  recovered: recovered == 0 ? '-' : convertToString(recovered),
                  deceased: deceased == 0 ? '-' : convertToString(deceased),
                );
              },
              childCount:
                  isState ? widget.stateData.length : widget.covidData.length,
            )),
          ],
        ),
      ),
    );
  }
}
