import 'package:country_picker/res/country_codes.dart';
import 'package:country_picker/src/utils.dart';
import 'package:flutter/material.dart';

import 'country.dart';

class CountriesListView extends StatefulWidget {
  const CountriesListView({Key key}) : super(key: key);

  @override
  _CountriesListViewState createState() => _CountriesListViewState();
}

class _CountriesListViewState extends State<CountriesListView> {
  List<Country> countryList;
  @override
  void initState() {
    super.initState();
    countryList =
        countryCodes.map((country) => Country.from(json: country)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: countryList.map<Widget>((country) => listRow(country)).toList(),
    );
  }

  Widget listRow(Country country) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          children: <Widget>[
            const SizedBox(width: 20),
            Text(
              Utils.countryCodeToEmoji(country.countryCode),
              style: const TextStyle(fontSize: 25),
            ),
            const SizedBox(width: 15),
            Text(
              country.name,
              style: const TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
