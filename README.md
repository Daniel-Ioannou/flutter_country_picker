# Country picker

A flutter package to select a country from a list of countries. 

<img height="600" alt="n1" src="https://raw.githubusercontent.com/Daniel-Ioannou/flutter_country_picker/master/assets/ReadMe%20Screenshot.png">

## Getting Started

 Add the package to your pubspec.yaml:

 ```yaml
 country_picker: ^1.0.0
 ```
 
 In your dart file, import the library:

 ```Dart
import 'package:country_picker/country_picker.dart';
 ``` 
  Show country picker using `showCountryPicker`:
  ```Dart
showCountryPicker(
   context: context,
   onSelect: (Country country) {
      print('Select country: ${country.displayName}');
   },
);
```

### Parameters:
* `onSelect`: Called when a country is select. The country picker passes the new value to the callback (required)

## Contributions
Contributions of any kind are more than welcome! Feel free to fork and improve country_code_picker in any way you want, make a pull request, or open an issue.
