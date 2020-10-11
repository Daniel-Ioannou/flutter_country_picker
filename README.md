# Country picker

[![pub package](https://img.shields.io/pub/v/country_picker.svg)](https://pub.dev/packages/country_picker)

A flutter package to select a country from a list of countries. 

<img height="600" alt="n1" src="https://raw.githubusercontent.com/Daniel-Ioannou/flutter_country_picker/master/assets/ReadMe%20Screenshot.png">

## Getting Started

 Add the package to your pubspec.yaml:

 ```yaml
 country_picker: ^1.1.2
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

### For localization: 
Add the `CountryLocalizations.delegate` in the list of your app delegates.
```Dart
MaterialApp(
      supportedLocales: [
        const Locale('en'),
        const Locale('el'),
        const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'), // Generic Simplified Chinese 'zh_Hans'
        const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'), // Generic traditional Chinese 'zh_Hant'
      ],
      localizationsDelegates: [
        CountryLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: HomePage(),
 );
```

### Parameters:
* `onSelect`: Called when a country is select. The country picker passes the new value to the callback (required)
* `showPhoneCode`: Can be used to to show phone code before the country name.
* `exclude`: Can be used to exclude(remove) one or more country from the countries list (optional). 
```Dart
showCountryPicker(
   context: context,
   exclude: <String>['KN', 'MF'], //It takes a list of country code(iso2).
   onSelect: (Country country) => print('Select country: ${country.displayName}'),
);
```
* `countryFilter`: Can be used to 	uses filter the countries list (optional). 
  - It takes a list of country code(iso2). 
  - Can't provide both exclude and countryFilter

## Contributions
Contributions of any kind are more than welcome! Feel free to fork and improve country_code_picker in any way you want, make a pull request, or open an issue.
