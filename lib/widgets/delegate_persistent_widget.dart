import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'list_region_data.dart';

class Delegate extends SliverPersistentHeaderDelegate {
  final bool isState;

  Delegate({required this.isState});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Center(
      child: RegionData(
        districtName: isState ? 'State/UT' : 'City',
        confirmed: 'C',
        active: 'A',
        recovered: 'R',
        deceased: 'D',
        addHeaderDefaults: true,
      ),
    );
  }

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
