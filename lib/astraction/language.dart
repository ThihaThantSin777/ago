import 'package:ago/astraction/english_language.dart';
import 'package:ago/astraction/myanmar_language.dart';
import 'package:ago/constant/enums.dart';

abstract class Language {

  String secondText(int second,{bool isMoment=false});

  String minuteText(int second);

  String hourText(int second);

  String dayText(int second);

  String monthText(int second);

  String yearText(int second);

  String agoText();
}


Language getLanguageObject(Languages languages,bool isShortForm){
  switch (languages){
    case Languages.english:
      return EnglishLanguage(isShortForm: isShortForm);
    default:
      return MyanmarLanguage();
  }
}
