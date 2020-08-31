# Country picker

[![pub package](https://img.shields.io/pub/v/country_picker.svg)](https://pub.dev/packages/country_picker)

A flutter package to select a country from a list of countries. 

<img height="600" alt="n1" src="https://raw.githubusercontent.com/Daniel-Ioannou/flutter_country_picker/master/assets/ReadMe%20Screenshot.png">

## Getting Started

 Add the package to your pubspec.yaml:

 ```yaml
 country_picker: ^1.0.5
 ```
 
 In your dart file, import the library:

 ```Dart
 import 'package:country_picker/country_picker.dart';
 ``` 
  Show country picker using `showCountryPicker`:
```Dart
showCountryPicker(
   context: context,
   showPhoneCode: true, // optional. Shows phone code before the country name.
   onSelect: (Country country) {
      print('Select country: ${country.displayName}');
   },
);
```

### Parameters:
* `onSelect`: Called when a country is select. The country picker passes the new value to the callback (required)
* `showPhoneCode`: Can be used to to show phone code before the country name.
* `exclude`: Can be used to exclude(remove) one ore more country from the countries list (optional). 
```Dart
showCountryPicker(
   context: context,
   exclude: <String>['KN', 'MF'], //It takes a list of country code(iso2).
   onSelect: (Country country) => print('Select country: ${country.displayName}'),
);
```

## Contributions
Contributions of any kind are more than welcome! Feel free to fork and improve country_code_picker in any way you want, make a pull request, or open an issue.
