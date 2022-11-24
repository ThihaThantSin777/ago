
import 'package:ago/extension/string_extension.dart';

class DateConvert{
  final DateTime dateTime;
  DateConvert({required this.dateTime});

  String getDateTime()=>'${_getYear(dateTime.year)}-${_getMonth(dateTime.month)}-${_getDay(dateTime.day)} ${_getHour(dateTime.hour)}:${_getMinute(dateTime.minute)} ${_getAmOrPm(dateTime.hour)}';

  String _getAmOrPm(int hour)=>(hour>=13 && hour<=23)?'PM':'AM';

  String  _getYear(int year)=>year.toString().prefixAddDigit(4,'0');
  
  String _getMonth(int month)=>month.toString().prefixAddDigit(2,'0');

  String _getDay(int day)=>day.toString().prefixAddDigit(2,'0');

  String _getHour(int hour)=>hour.toString().prefixAddDigit(2,'0');

  String _getMinute(int minute)=>minute.toString().prefixAddDigit(2,'0');

}