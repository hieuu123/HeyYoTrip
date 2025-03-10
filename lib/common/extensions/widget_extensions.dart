import 'package:flutter/material.dart';

extension WidgetExtensions on Widget {
  Widget makePadding({double left=0, double top=0, double right=0,  double bottom=0}) {
    return Padding(padding: EdgeInsets.only(left: left, top: top, right: right, bottom: bottom),  child: this,);
  }  
}