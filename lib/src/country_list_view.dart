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
  List<Country> _countryList;
  List<Country> _filteredList;
  TextEditingController _searchController;
  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _countryList =
        countryCodes.map((country) => Country.from(json: country)).toList();

    if (widget.exclude != null) {
      _countryList.removeWhere(
          (element) => widget.exclude.contains(element.countryCode));
    }

    _filteredList = <Country>[];
    _filteredList.addAll(_countryList);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: "Search",
              hintText: "Search",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: const Color(0xFF8C98A8).withOpacity(0.2),
                ),
              ),
            ),
            onChanged: _filterSearchResults,
          ),
        ),
        Expanded(
          child: ListView(
            children: _filteredList
                .map<Widget>((country) => _listRow(country))
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _listRow(Country country) {
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

  void _filterSearchResults(String query) {
    List<Country> _searchResult = <Country>[];

    if (query.isEmpty) {
      _searchResult.addAll(_countryList);
    } else {
      _searchResult =
          _countryList.where((country) => country.contains(query)).toList();
//      // ignore: avoid_function_literals_in_foreach_calls
//
//      _countryList.forEach((Country country) {
//        if () {
//          _searchResult.add(country);
//        }
//      });
    }

    setState(() => _filteredList = _searchResult);
  }
}
