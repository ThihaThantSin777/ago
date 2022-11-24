import 'package:ago/astraction/language.dart';
import 'package:ago/extension/string_extension.dart';

class EnglishLanguage extends Language{
  final bool isShortForm;
  EnglishLanguage({this.isShortForm=false});

  @override
  String dayText(int second) => (isShortForm)?'d'.addS(second):'day'.addS(second);

  @override
  String hourText(int second)=>(isShortForm)?'hr'.addS(second):'hour'.addS(second);

  @override
  String minuteText(int second) =>(isShortForm)?'min'.addS(second):'minute'.addS(second);

  @override
  String monthText(int second) =>(isShortForm)?'mth'.addS(second):'month'.addS(second);

  @override
  String secondText(int second,{bool isMoment=false}) =>(isMoment)?'a moment':(isShortForm)?'sec'.addS(second):'second'.addS(second);

  @override
  String yearText(int second)=>(isShortForm)?'yr'.addS(second):'year'.addS(second);

  @override
  String agoText() =>'ago';



}