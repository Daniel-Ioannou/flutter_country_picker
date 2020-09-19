import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
      supportedLocales: [
        Locale('en'),
      ],
      localizationsDelegates: [
        CountryLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
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
              //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
              exclude: <String>['KN', 'MF'],
              //Optional. Shows phone code before the country name.
              showPhoneCode: true,
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
