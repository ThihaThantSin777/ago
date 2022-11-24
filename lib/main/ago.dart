library ago;

import 'package:ago/astraction/language.dart';
import 'package:ago/constant/constant.dart';
import 'package:ago/date/date_convert.dart';

import '../constant/enums.dart';

class Ago {
  final DateTime dateTime;
  final Languages languages;
  final bool isMoment;
  final bool isShortForm;
  final bool isSpecific;
  final EndAt endType;

  Ago(
      {required this.dateTime,
      this.languages = Languages.english,
      this.isMoment = false,
      this.isShortForm = false,
      this.endType = EndAt.noStrict,
      this.isSpecific = true});

  String getAgo() {
    Language language = getLanguageObject(languages, isShortForm);
    int seconds = dateTime.difference(kTodayDateTime).inSeconds;
    if (seconds >= kOneYearInSecond) {
      return _getYear(seconds, language);
    } else if (seconds >= kOneMonthInSecond) {
      return _getMonth(seconds, language);
    } else if (seconds >= kOneDayInSecond) {
      return _getDay(seconds, language);
    } else if (seconds >= kOneHourInSecond) {
      return _getHour(seconds, language);
    } else if (seconds >= kOneMinuteInSecond) {
      return _getMinutes(seconds, language);
    }
    return _getSeconds(seconds, language);
  }

  String _getSeconds(int second, Language language) {
    String secondText = (isMoment)
        ? '${language.secondText(second, isMoment: isMoment)} ${language.agoText()}'
        : '$second ${language.secondText(second)} ${language.agoText()}';
    if (endType == EndAt.second) {
      return DateConvert(dateTime: dateTime).getDateTime();
    }
    return secondText;
  }

  String _getMinutes(int second, Language language) {
    int temp = second ~/ kOneMinuteInSecond;
    int reminder = (second % kOneMinuteInSecond);
    String minuteText = '${temp.toString()} ${language.minuteText(temp)}';

    if (isSpecific) {
      if (endType == EndAt.minute) {
        return DateConvert(dateTime: dateTime).getDateTime();
      } else if (endType == EndAt.noStrict) {
        return (reminder == 0)
            ? '$minuteText ${language.agoText()}'
            : '$minuteText ${_getSeconds(reminder, language)}';
      }
      return _getSeconds(reminder, language);
    }
    return '$minuteText ${language.agoText()}';
  }

  String _getHour(int second, Language language) {
    int temp = second ~/ kOneHourInSecond;
    int reminder = (second % kOneHourInSecond);
    String hourText = '${temp.toString()} ${language.hourText(temp)}';

    if (isSpecific) {
      if (endType == EndAt.hour) {
        return DateConvert(dateTime: dateTime).getDateTime();
      } else if (endType == EndAt.noStrict) {
        return (reminder == 0)
            ? '$hourText ${language.agoText()}'
            : '$hourText ${_getMinutes(reminder, language)}';
      }
      return _getMinutes(reminder, language);
    }
    return '$hourText ${language.agoText()}';
  }

  String _getDay(int second, Language language) {
    int temp = second ~/ kOneDayInSecond;
    int reminder = (second % kOneDayInSecond);
    String dayText = '${temp.toString()} ${language.dayText(temp)}';
    if (isSpecific) {
      if (endType == EndAt.day) {
        return DateConvert(dateTime: dateTime).getDateTime();
      } else if (endType == EndAt.noStrict) {
        return (reminder == 0)
            ? '$dayText ${language.agoText()}'
            : '$dayText ${_getHour(reminder, language)}';
      }
      return _getHour(reminder, language);
    }
    return '$dayText ${language.agoText()}';
  }

  String _getMonth(int second, Language language) {
    int temp = second ~/ kOneMonthInSecond;
    int reminder = (second % kOneMonthInSecond);
    String monthText = '${temp.toString()} ${language.monthText(temp)}';

    if (isSpecific) {
      if (endType == EndAt.month) {
        return DateConvert(dateTime: dateTime).getDateTime();
      } else if (endType == EndAt.noStrict) {
        return (reminder == 0)
            ? '$monthText ${language.agoText()}'
            : '$monthText ${_getDay(reminder, language)}';
      }
      return _getDay(reminder, language);
    }
    return '$monthText ${language.agoText()}';
  }

  String _getYear(int second, Language language) {
    int temp = second ~/ kOneYearInSecond;
    int reminder = (second % kOneYearInSecond);
    String yearText = '${temp.toString()} ${language.yearText(temp)}';
    if (isSpecific) {
      if (endType == EndAt.year) {
        return DateConvert(dateTime: dateTime).getDateTime();
      } else if (endType == EndAt.noStrict) {
        return (reminder == 0)
            ? '$yearText ${language.agoText()}'
            : '$yearText ${_getMonth(reminder, language)}';
      }
      return _getMonth(reminder, language);
    }
    return '$yearText ${language.agoText()}';
  }
}
