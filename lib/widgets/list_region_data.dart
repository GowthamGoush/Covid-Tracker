import 'package:covid_tracker_app/utils/constants.dart';
import 'package:flutter/material.dart';

class RegionData extends StatelessWidget {
  RegionData({
    required this.districtName,
    required this.active,
    required this.recovered,
    required this.confirmed,
    required this.deceased,
    this.addHeaderDefaults = false,
  });

  final String districtName;
  final String confirmed;
  final String active;
  final String recovered;
  final String deceased;
  final bool addHeaderDefaults;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration: addHeaderDefaults
                  ? listHeaderDataBoxDecoration
                  : listDataBoxDecoration,
              child: Padding(
                padding: listDataPadding,
                child: Text(
                  districtName,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight:
                        addHeaderDefaults ? FontWeight.bold : FontWeight.normal,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          SizedBox(
            width: minSizedBoxWidth,
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: addHeaderDefaults
                  ? listHeaderDataBoxDecoration
                  : listDataBoxDecoration,
              child: Padding(
                padding: listDataPadding,
                child: Text(
                  confirmed,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: addHeaderDefaults ? Colors.red : Colors.black,
                    fontWeight:
                        addHeaderDefaults ? FontWeight.bold : FontWeight.normal,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          SizedBox(
            width: minSizedBoxWidth,
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: addHeaderDefaults
                  ? listHeaderDataBoxDecoration
                  : listDataBoxDecoration,
              child: Padding(
                padding: listDataPadding,
                child: Text(
                  active,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: addHeaderDefaults ? Colors.blue : Colors.black,
                    fontWeight:
                        addHeaderDefaults ? FontWeight.bold : FontWeight.normal,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          SizedBox(
            width: minSizedBoxWidth,
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: addHeaderDefaults
                  ? listHeaderDataBoxDecoration
                  : listDataBoxDecoration,
              child: Padding(
                padding: listDataPadding,
                child: Text(
                  recovered,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: addHeaderDefaults ? Colors.green : Colors.black,
                    fontWeight:
                        addHeaderDefaults ? FontWeight.bold : FontWeight.normal,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          SizedBox(
            width: minSizedBoxWidth,
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: addHeaderDefaults
                  ? listHeaderDataBoxDecoration
                  : listDataBoxDecoration,
              child: Padding(
                padding: listDataPadding,
                child: Text(
                  deceased,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: addHeaderDefaults ? Colors.purple : Colors.black,
                    fontWeight:
                        addHeaderDefaults ? FontWeight.bold : FontWeight.normal,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
