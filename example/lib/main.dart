import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo for country picker package',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo for country picker'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            showCountryPicker(
              context: context,
              exclude: <String>['KN', 'MF'],
              onSelect: (Country country) {
                print('Select country: ${country.displayName}');
              },
            );
          },
          child: const Text('Show country picker'),
        ),
      ),
    );
  }
}
