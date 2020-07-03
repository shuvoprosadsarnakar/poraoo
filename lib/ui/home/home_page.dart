import 'package:flutter/material.dart';
import '../preference/preference_page.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key key,
  }) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
    icon: Icon(Icons.settings),
    onPressed: () {
      // Navigate to the PreferencePage
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PreferencePage(),
      ));
    },
    );
  }
}
