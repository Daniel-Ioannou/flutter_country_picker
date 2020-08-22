import 'package:country_picker/src/utils.dart';
import 'package:flutter/material.dart';

import 'country.dart';
import 'res/country_codes.dart';

class CountryListView extends StatefulWidget {
  /// Called when a country is select.
  ///
  /// The country picker passes the new value to the callback.
  final ValueChanged<Country> onSelect;

  /// An optional [showPhoneCode] argument can be used to show phone code.
  final bool showPhoneCode;

  /// An optional [exclude] argument can be used to exclude(remove) one ore more
  /// country from the countries list. It takes a list of country code(iso2).
  final List<String> exclude;

  const CountryListView({
    Key key,
    @required this.onSelect,
    this.exclude,
    this.showPhoneCode = false,
  })  : assert(onSelect != null),
        super(key: key);

  @override
  _CountryListViewState createState() => _CountryListViewState();
}

class _CountryListViewState extends State<CountryListView> {
  List<Country> countryList;
  @override
  void initState() {
    super.initState();

    countryList =
        countryCodes.map((country) => Country.from(json: country)).toList();

    if (widget.exclude != null) {
      countryList.removeWhere(
          (element) => widget.exclude.contains(element.countryCode));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: countryList.map<Widget>((country) => listRow(country)).toList(),
    );
  }

  Widget listRow(Country country) {
    return Material(
      // Add Material Widget with transparent color
      // so the ripple effect of InkWell will show on tap
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          widget.onSelect(country);
          Navigator.pop(context);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            children: <Widget>[
              const SizedBox(width: 20),
              Text(
                Utils.countryCodeToEmoji(country.countryCode),
                style: const TextStyle(fontSize: 25),
              ),
              if (widget.showPhoneCode) ...[
                const SizedBox(width: 15),
                Container(
                  width: 45,
                  child: Text(
                    '+${country.phoneCode}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(width: 5),
              ] else
                const SizedBox(width: 15),
              Expanded(
                child: Text(
                  country.name,
                  style: const TextStyle(fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
