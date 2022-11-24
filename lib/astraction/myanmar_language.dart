import 'package:ago/astraction/language.dart';

class MyanmarLanguage extends Language{

  MyanmarLanguage._internal();

  static final _singleton=MyanmarLanguage._internal();

  factory MyanmarLanguage()=>_singleton;
  @override
  String dayText(int second) =>'ရက်';

  @override
  String hourText(int second) =>'နာရီ';

  @override
  String minuteText(int second)=>'မီနစ်';

  @override
  String monthText(int second) =>'လ';

  @override
  String secondText(int second,{bool isMoment=false}) =>'စက္ကန့်';

  @override
  String yearText(int second) =>'နှစ်';

  @override
  String agoText() =>'အလို';

}