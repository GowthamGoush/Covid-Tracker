import 'package:flutter/cupertino.dart';

const minSizedBoxWidth = 2.0;

const listDataPadding = EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0);

const listDataBoxDecoration = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(4.0)),
    color: Color(0x80e8ecec));

const listHeaderDataBoxDecoration = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(4.0)),
    color: Color(0xCCFFFFFF));

const appBarTitle = Text(
  'Covid-19 Tracker',
  style: TextStyle(
    color: Color(0x0000ff),
    fontFamily: 'Spartan',
    fontWeight: FontWeight.bold,
    fontSize: 16.0,
  ),
  textAlign: TextAlign.end,
);
