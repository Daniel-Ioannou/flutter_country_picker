import 'package:country_picker/res/country_codes.dart';
import 'package:country_picker/src/utils.dart';
import 'package:flutter/material.dart';

class CountriesListView extends StatefulWidget {
  const CountriesListView({Key key}) : super(key: key);

  @override
  _CountriesListViewState createState() => _CountriesListViewState();
}

class _CountriesListViewState extends State<CountriesListView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children:
          countryCodes.map<Widget>((Map country) => listRow(country)).toList(),
    );
  }

  Widget listRow(Map country) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          children: <Widget>[
            const SizedBox(width: 20),
            Text(
              Utils.countryCodeToEmoji(country['iso2_cc'] as String),
              style: const TextStyle(fontSize: 25),
            ),
            const SizedBox(width: 15),
            Text(
              country['name'] as String,
              style: const TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
