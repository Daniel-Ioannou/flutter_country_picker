## [1.1.1] - 11 Oct 2020

* Add support for Greek localization.
* At search change contains to startsWith.
* Add country filter option.  
  - Can be used to uses filter the countries list (optional). 
  - It takes a list of country code(iso2).
  - Can't provide both exclude and countryFilter
```Dart
showCountryPicker(
   context: context,
   countryFilter: <String>['AT', 'GB', 'DK', 'DE', 'FR', 'GR'], //It takes a list of country code(iso2).
   onSelect: (Country country) => print('Select country: ${country.displayName}'),
);
```

## [1.1.1] - 24 Sep 2020

* Search on localizations.

## [1.1.0] - 19 Sep 2020

### Implement localization. 
Add the `CountryLocalizations.delegate` in the list of your app delegates.
```Dart
MaterialApp(
      supportedLocales: [
        const Locale('en'),
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
### Supported languages:
* English
* Simplified Chinese
* Traditional Chinese

## [1.0.5] - 31 Aug 2020

* Update documentation.

## [1.0.4] - 27 Aug 2020

* Implement search.

## [1.0.3] - 22 Aug 2020

* Add show phone code option.

## [1.0.2] - 18 Aug 2020

* Add exclude countries option.  
Can be used to exclude(remove) one ore more country from the countries list
```Dart
showCountryPicker(
   context: context,
   exclude: <String>['KN', 'MF'], //It takes a list of country code(iso2).
   onSelect: (Country country) => print('Select country: ${country.displayName}'),
);
```

## [1.0.1] - 12 Aug 2020

* Add documentation.

## [1.0.0] - 11 Aug 2020

* Initial developers preview release.
