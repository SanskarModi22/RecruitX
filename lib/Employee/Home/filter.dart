import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Filter extends StatefulWidget {
  const Filter({key}) : super(key: key);

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon: FaIcon(FontAwesomeIcons.filter),
        onPressed: () {},
      ),
    );
  }
}
