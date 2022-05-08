import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomHomeMenu extends StatelessWidget {
  const BottomHomeMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, '/calendar'),
              icon: Icon(CupertinoIcons.calendar)),
          IconButton(
              onPressed: () => Navigator.pushNamed(context, '/statistics'),
              icon: Icon(CupertinoIcons.chart_pie_fill)),
          IconButton(
              onPressed: () => Navigator.pushNamed(context, '/quotes'),
              icon: Icon(CupertinoIcons.quote_bubble)),
          IconButton(
              onPressed: () => Navigator.pushNamed(context, '/objectives'),
              icon: Icon(FontAwesomeIcons.listCheck)),
          IconButton(
              onPressed: () => Navigator.pushNamed(context, '/settings'),
              icon: Icon(FontAwesomeIcons.gear)),
        ],
      ),
    );
  }
}
