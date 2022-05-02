## [2.0.15] - 02 May 2022
  * Add support for German localization
  * Add `favorite` option.
    - Can be used to to show the favorite countries at the top of the list.
    - It takes a list of country code(iso2).
      ```Dart
      showCountryPicker(
        context: context,
        favorite: <String>['SE', 'MC'],
        onSelect: (Country country) {
          print('Select country: ${country.displayName}');
        },
      );
      ```
  * Implemented Country Service
  * Fix package assets

## [2.0.14] - 11 Apr 2022
  * Add support for country search by phone code
    
## [2.0.13] - 05 Apr 2022
  * Add getter for flag emoji in `Country` model
  * Add option for bottom sheet height.
    ```Dart
    showCountryPicker(
      context: context,
      countryListTheme: CountryListThemeData(
       bottomSheetHeight: 500, // Optional. Country list modal height
      ),
      onSelect: (Country country) => print('Select country: ${country.displayName}'),
    );
    ```
## [2.0.12] - 28 Feb 2022
  * Update example android gradle
  * Fix Kurdish translation for Curaçao name
## [2.0.11] - 01 Feb 2022
  * Fix Eswatini name
  * Fix Italy code at Turkish localization
  * Add optional argument for showing "World Wide" option at the beginning of the list
    ```Dart
    showCountryPicker(
      context: context,
      showWorldWide: true,
      onSelect: (Country country) => print('Select country: ${country.displayName}'),
    );
    ```

## [2.0.10] - 19 Jan 2022
  * Add support for French localization
  * Add support for Kurdish localization

## [2.0.9] - 22 Nov 2021 
  * Add support for Estonian localization 
    
## [2.0.8] - 13 Sep 2021 
  * Add support for Arabic localization 
  * Add support for Croatian localization
  * Add options to autofocus at search TextField.
    ```Dart
    showCountryPicker(
      context: context,
      searchAutofocus: true,
      onSelect: (Country country) => print('Select country: ${country.displayName}'),
    );
    ```

## [2.0.7] - 28 Jul 2021 
  * Add support for Turkish localization 

## [2.0.6] - 02 Jul 2021 
  * Add support for Nepali and Hindi localization 

## [2.0.5] - 31 May 2021 
  * Add styling options for the border-radius and the search field.
    ```Dart
    showCountryPicker(
      context: context,
      countryListTheme: CountryListThemeData(
        // Optional. Sets the border radius for the bottomsheet.
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
        // Optional. Styles the search field.
        inputDecoration: InputDecoration(
          labelText: 'Search',
          hintText: 'Start typing to search',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: const Color(0xFF8C98A8).withOpacity(0.2),
            ),
          ),
        ),
      ),
      onSelect: (Country country) => print('Select country: ${country.displayName}'),
    );
    ```

## [2.0.4] - 12 Apr 2021 
  * Add `CountryParser`

## [2.0.3] - 30 Mar 2021 
  * Add Ukrainian, Russian, and Polish translations
  * Add `onClosed` callback

## [2.0.2] - 23 Mar 2021 
  * Add support for Norwegian localization 

## [2.0.1] - 15 Mar 2021 
  * Implemented country list theme
    ```Dart
    showCountryPicker(
      context: context,
      countryListTheme: CountryListThemeData(
        flagSize: 25,
        backgroundColor: Colors.white,
        textStyle: TextStyle(fontSize: 16, color: Colors.blueGrey),
      ),
      onSelect: (Country country) => print('Select country: ${country.displayName}'),
    );
    ```
## [2.0.0] - 09 Mar 2021 
  * Migrated to null safety

## [1.1.4] - 18 Feb 2021
  * Add support for Spanish and Portuguese localization.
  * If `showPhoneCode` is false remove duplicates country 

## [1.1.3] - 10 Dec 2020

  * Localize label and hint of search text field

## [1.1.2] - 11 Oct 2020
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
