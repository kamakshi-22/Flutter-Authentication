import 'package:flutter/material.dart';
import 'package:aicte_app/utils/constants.dart' as globals;

//heading
const TextStyle headingStyle = TextStyle(
  fontSize: 24.0,
  letterSpacing: 2.0,
  fontWeight: FontWeight.bold,
  color: globals.kSecondaryColorsSubtitle,
);

//subheading
const TextStyle subheadingStyle = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.w500,
  color: globals.kSecondaryColorsNeutral,
);

//heading
const TextStyle uniHeadingStyle = TextStyle(
  fontSize: 22.0,
  letterSpacing: 2.0,
  fontWeight: FontWeight.bold,
  color: globals.kSecondaryColorsSubtitle,
);

//subheading
const TextStyle uniSubheadingStyle = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.bold,
  color: globals.kSecondaryColorsNeutral,
  letterSpacing: 1,
);

//list tile heading
const TextStyle tileHeadingStyle = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.bold,
  color: globals.kSecondaryColorsSubtitle,
);

//list tile paragraph
const TextStyle tileParagraphStyle = TextStyle(
  fontSize: 12.0,
  fontWeight: FontWeight.normal,
  color: globals.kSecondaryColorsNeutral,
);

//list tile paragraph
const TextStyle errorParagraphStyle = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.normal,
  color: globals.kSemanticColorError,
);

//drop down menu
const TextStyle dropdownmenuStyle = TextStyle(
  fontSize: 14.0,
  fontWeight: FontWeight.normal,
  color: globals.kSecondaryColorsNeutral,
  letterSpacing: 1,
);

//drop down style
const TextStyle dropdownStyle = TextStyle(
  fontSize: 14.0,
  fontWeight: FontWeight.normal,
  color: globals.kSecondaryColorsNeutral,
);

//paragraph
const TextStyle paragraphStyle = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.w400,
  color: globals.kSecondaryColorsNeutral,
  letterSpacing: 1.0,
);

//hint text
const TextStyle hintTextStyle = TextStyle(
  fontSize: 12.0,
  fontWeight: FontWeight.normal,
  color: globals.kSecondaryColorsNeutral,
);

//button text
// const TextStyle buttonTextStyle = TextStyle(
//   fontSize: 16.0,
//   fontWeight: FontWeight.bold,
//   color: globals.kPrimaryColor,
// );

//buttons
final ButtonStyle appButtonStyle = ElevatedButton.styleFrom(
    shape: const StadiumBorder(),
    minimumSize: const Size(320, 32),
    primary: globals.kSecondaryColorsSubtitle,
    onPrimary: globals.kPrimaryColor,
    textStyle: const TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
    ));

//textformfieldstyle
const TextStyle appTextFormFieldStyle = TextStyle(
  fontWeight: FontWeight.bold,
  color: globals.kSecondaryColorsNeutral,
);

//textformfieldstyle
const TextStyle piechartTextStyle = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.bold,
  color: globals.kSecondaryColorIcons,
);

//input field box style
class AppInputStyle {
  static InputDecoration textFieldStyle({String hintTextString = ""}) {
    return InputDecoration(
      contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      filled: true,
      fillColor: globals.kPrimaryLightColor,
      hintText: hintTextString,
      hintStyle: hintTextStyle,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide.none,
      ),
    );
  }
}

//search bar style
class SearchBarStyle {
  static InputDecoration textFieldStyle() {
    return InputDecoration(
      fillColor: globals.kPrimaryLightColor,
      contentPadding:
          const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
      hintText: "Search",
      hintStyle: paragraphStyle,
      suffixIcon: const Icon(
        Icons.search,
        color: globals.kPrimaryVeryLightColor,
        size: 22,
      ),
      // prefix: Icon(Icons.search),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: const BorderSide(color: globals.kPrimaryLightColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: const BorderSide(color: globals.kPrimaryVeryLightColor),
      ),
    );
  }
}

BoxDecoration baseBackgroundDecoration = const BoxDecoration(
  color: globals.kPrimaryColor,
  borderRadius: BorderRadius.all(Radius.circular(16)),
);
