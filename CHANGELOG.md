## 2.0.24
  * Add option for bottom sheet Width.
    ```Dart
    showCountryPicker(
      context: context,
      countryListTheme: CountryListThemeData(
       bottomSheetWidth: 500, // Optional. Country list modal Width
      ),
      onSelect: (Country country) => print('Select country: ${country.displayName}'),
    );
    ```
  * Add `emojiFontFamilyFallback`
    
## 2.0.23
  * Export `CustomFlagBuilder`
  * Add parameter `useRootNavigator`

## 2.0.22
  * Add support for Czech localization
  * Fix typos Korean

## 2.0.21
  * Add support for Korean localization
  * Add support for Japanese localization
  * Add support for Indonesian localization
  * Fix Windows and web flag

## 2.0.20
  * Add support for Italian localization
  * Fix French Translations
  * UI filling fix

## 2.0.19
  * Add support for Dutch localization
  * Add `parsePhoneCode` and `tryParsePhoneCode`

## 2.0.18
  * Fix Hindi Translations
  * Removed old country codes for Kosovo (+381 & +386)

## 2.0.17
  * Add option to hide search bar
    ```Dart
      showCountryPicker(
        context: context,
        showSearch: false,
        onSelect: (Country country) => print('Select country: ${country.displayName}'),
      );
    ```
  * Add `searchTextStyle`
    ```Dart
      showCountryPicker(
        context: context,
        countryListTheme: CountryListThemeData(
          searchTextStyle: TextStyle( // Optional. Styles the text in the search field
            color: Colors.blue,
            fontSize: 18,
          ),
        ),
        onSelect: (Country country) => print('Select country: ${country.displayName}'),
      );
    ```
  * Removed the need of `worldwide.png` and changed to '🌍' emoji 

## 2.0.16
  * Add support for Latvian localization
  * Add support for Lithuanian localization

## 2.0.15
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

## 2.0.14
  * Add support for country search by phone code
    
## 2.0.13
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
## 2.0.12
  * Update example android gradle
  * Fix Kurdish translation for Curaçao name
## 2.0.11
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

## 2.0.10
  * Add support for French localization
  * Add support for Kurdish localization

## 2.0.9
  * Add support for Estonian localization 
    
## 2.0.8
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

## 2.0.7
  * Add support for Turkish localization 

## 2.0.6
  * Add support for Nepali and Hindi localization 

## 2.0.5
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

## 2.0.4
  * Add `CountryParser`

## 2.0.3
  * Add Ukrainian, Russian, and Polish translations
  * Add `onClosed` callback

## 2.0.2
  * Add support for Norwegian localization 

## 2.0.1
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
## 2.0.0
  * Migrated to null safety

## 1.1.4
  * Add support for Spanish and Portuguese localization.
  * If `showPhoneCode` is false remove duplicates country 

## 1.1.3
  * Localize label and hint of search text field

## 1.1.2
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

## 1.1.1
  * Search on localizations.

## 1.1.0

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

## 1.0.5
  * Update documentation.

## 1.0.4
  * Implement search.

## 1.0.3
  * Add show phone code option.

## 1.0.2
  * Add exclude countries option.  
    Can be used to exclude(remove) one ore more country from the countries list
    ```Dart
    showCountryPicker(
       context: context,
       exclude: <String>['KN', 'MF'], //It takes a list of country code(iso2).
       onSelect: (Country country) => print('Select country: ${country.displayName}'),
    );
    ```

## 1.0.1
  * Add documentation.

## 1.0.0
  * Initial developers preview release.
