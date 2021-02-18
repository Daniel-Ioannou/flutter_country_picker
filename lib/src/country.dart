import 'country_localizations.dart';

///The country Model that has all the country
///information needed from the [country_picker]
class Country {
  ///The country phone code
  final String phoneCode;

  ///The country code, ISO (alpha-2)
  final String countryCode;
  final int e164Sc;
  final bool geographic;
  final int level;

  ///The country name in English
  final String name;

  ///An example of a telephone number without the phone code
  final String example;

  ///Country name (country code) [phone code]
  final String displayName;

  ///An example of a telephone number with the phone code and plus sign
  final String fullExampleWithPlusSign;

  ///Country name (country code)

  final String displayNameNoCountryCode;
  final String e164Key;

  @Deprecated('The modern term is displayNameNoCountryCode. '
      'This feature was deprecated after v1.0.6.')
  String get displayNameNoE164Cc => displayNameNoCountryCode;

  Country({
    this.phoneCode,
    this.countryCode,
    this.e164Sc,
    this.geographic,
    this.level,
    this.name,
    this.example,
    this.displayName,
    this.fullExampleWithPlusSign,
    this.displayNameNoCountryCode,
    this.e164Key,
  });

  Country.from({Map<String, dynamic> json})
      : phoneCode = json['e164_cc'] as String,
        countryCode = json['iso2_cc'] as String,
        e164Sc = json['e164_sc'] as int,
        geographic = json['geographic'] as bool,
        level = json['level'] as int,
        name = json['name'] as String,
        example = json['example'] as String,
        displayName = json['display_name'] as String,
        fullExampleWithPlusSign = json['full_example_with_plus_sign'] as String,
        displayNameNoCountryCode = json['display_name_no_e164_cc'] as String,
        e164Key = json['e164_key'] as String;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['e164_cc'] = phoneCode;
    data['iso2_cc'] = countryCode;
    data['e164_sc'] = e164Sc;
    data['geographic'] = geographic;
    data['level'] = level;
    data['name'] = name;
    data['example'] = example;
    data['display_name'] = displayName;
    data['full_example_with_plus_sign'] = fullExampleWithPlusSign;
    data['display_name_no_e164_cc'] = displayNameNoCountryCode;
    data['e164_key'] = e164Key;
    return data;
  }

  bool startsWith(String query, CountryLocalizations localizations) =>
      name.toLowerCase().startsWith(query.toLowerCase()) ||
      countryCode.toLowerCase().startsWith(query.toLowerCase()) ||
      (localizations
              ?.countryName(countryCode: countryCode)
              ?.toLowerCase()
              ?.startsWith(query.toLowerCase()) ??
          false);

  @override
  String toString() => 'Country(countryCode: $countryCode, name: $name)';

  @override
  bool operator ==(Object other) {
    if (other is Country) {
      return other.countryCode == countryCode;
    }

    return super == other;
  }

  @override
  int get hashCode => super.hashCode;
}
