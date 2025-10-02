import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

int? subtractOne(int? value) {
  return (value! - 1 < 0) ? 0 : value! - 1;
}

DateTime? dateTimeToDate(DateTime? dateTime) {
  return DateTime(dateTime!.year, dateTime!.month, dateTime!.day);
}

List<DateTime>? calendar(DateTime? pickedMonth) {
  if (pickedMonth == null) {
    pickedMonth = DateTime.now();
  }

  int year = pickedMonth!.year;
  int month = pickedMonth!.month;

  // Первый день текущего месяца
  DateTime firstDayOfMonth = DateTime(year, month, 1);
  // Последний день месяца (день перед первым днем следующего месяца)
  DateTime lastDayOfMonth = DateTime(year, month + 1, 0);
  int numberDays = lastDayOfMonth.day; // Берем день последнего дня месяца

  // Генерируем список дней месяца
  final items =
      List<DateTime>.generate(numberDays, (i) => DateTime(year, month, i + 1));

  // Добавляем отступы для смещения по дням недели
  int weekday = items[0].weekday;
  for (int a = 0; a < (weekday - 1); a++) {
    items.insert(a, DateTime(0, 0, 0));
  }

  return items;
}

double? customProgressbarWidget(
  double? plan,
  double? fact,
  double? maxScreenWidth,
  int? padding,
) {
// Проверка на null
  if (fact == null ||
      plan == null ||
      maxScreenWidth == null ||
      padding == null) {
    return 0.0;
  }

  // Проверка на некорректные значения
  if (fact <= 0 || plan <= 0 || maxScreenWidth <= 0 || padding < 0) {
    return 0.0;
  }

  // Вычисление прогресса
  double progress = (fact / plan) * (maxScreenWidth - (padding * 2));

  // Ограничение прогресса
  if (progress < 0) {
    return 0.0;
  } else if (progress > maxScreenWidth - (padding * 2)) {
    return maxScreenWidth - (padding * 2);
  }

  return progress;
}

double? customProgressbarWidgetWidth(
  double? plan,
  double? fact,
  double? width,
) {
// Проверка на null
  if (fact == null || plan == null || width == null) {
    return 0.0;
  }

  // Проверка на некорректные значения
  if (fact <= 0 || plan <= 0 || width <= 0) {
    return 0.0;
  }

  // Вычисление прогресса
  double progress = (fact / plan) * width;

  // Ограничение прогресса
  if (progress < 0) {
    return 0.0;
  } else if (progress > width) {
    return width;
  }

  return progress;
}

double? progressbar(
  double? plan,
  double? fact,
) {
  if (plan == null || plan.isNaN || fact == null || fact.isNaN) {
    return 0;
  }

  double result = fact / plan;

  // Проверяем, является ли результат NaN
  if (result.isNaN) {
    return 0;
  }

  if (result > 1) {
    return 1;
  }

  return result;
}

String userMissionStatus(String? status) {
  if (status == null || status.isEmpty) {
    return 'готова к выполнению';
  }

  switch (status.toLowerCase()) {
    case 'pending':
      return 'на проверке';
    case 'completed':
      return 'завершена';
    case 'failed':
      return 'провалена';
    default:
      return 'готова к выполнению';
  }
}

String? formatCoins(double? number) {
  if (number == null) return '0';

  if (number < 1000000) {
    // Format with spaces for numbers up to 999,999
    String numStr = number.abs().toInt().toString();
    String result = '';
    int count = 0;

    for (int i = numStr.length - 1; i >= 0; i--) {
      count++;
      result = numStr[i] + result;
      if (count % 3 == 0 && i != 0) {
        result = ' $result';
      }
    }

    return number < 0 ? '-$result' : result;
  } else if (number < 1000000000) {
    // Format for millions (M)
    double value = number / 1000000;
    // Round to 1 decimal place only if not a whole number
    return '${value.toStringAsFixed(value.truncateToDouble() == value ? 0 : 1)}M';
  } else {
    // Format for billions (B)
    double value = number / 1000000000;
    // Round to 1 decimal place only if not a whole number
    return '${value.toStringAsFixed(value.truncateToDouble() == value ? 0 : 1)}B';
  }
}

String translateEntityType(String? entityType) {
  switch (entityType) {
    case 'purchase':
      return 'Покупка в КосмоЛавке';
    case 'mission':
      return 'Миссия пройдена';
    case 'reward':
      return 'Получение награды';
    case 'skill':
      return 'Улучшение навыка';
    case 'rank':
      return 'Повышение ранга';
    case 'level':
      return 'Уровень повышен';
    case 'event':
      return 'Событие пройдено';
    default:
      return 'Уведомление';
  }
}

String? translateGender(String? gender) {
  switch (gender) {
    case 'male':
      return 'Я парень';
    case 'female':
      return 'Я девушка';
    default:
      return null;
  }
}

int? calendarCurrentDateIndex(
  List<DateTime>? dateList,
  DateTime? target,
) {
  if (dateList == null || target == null || dateList.isEmpty) {
    return 0;
  }

  for (int i = 0; i < dateList.length; i++) {
    if (dateList[i].isAtSameMomentAs(target)) {
      return i;
    }
  }
  return 0;
}

List<DateTime>? calendarMergeDates(
  List<DateTime>? list1,
  List<DateTime>? list2,
) {
  List<DateTime> result = [];

  if (list1 != null) {
    result.addAll(list1);
  }

  if (list2 != null) {
    result.addAll(list2);
  }

  return result;
}

DateTime? dateTimePlusDay(
  DateTime? dateTime,
  int days,
) {
  if (dateTime == null) return null;
  return DateTime(dateTime.year, dateTime.month, dateTime.day + days);
}

bool eventUserCountCheck(
  String? minUsers,
  String? maxUsers,
) {
  // Проверяем, что оба параметра не null и не пустые
  if (minUsers == null ||
      maxUsers == null ||
      minUsers.isEmpty ||
      maxUsers.isEmpty) {
    return false;
  }

  // Пробуем преобразовать строки в int
  try {
    final int min = int.parse(minUsers);
    final int max = int.parse(maxUsers);

    // Проверяем, что оба значения больше 0 и maxUsers > minUsers
    return min > 0 && max > 0 && max > min;
  } catch (e) {
    // Если преобразование не удалось, возвращаем false
    return false;
  }
}

dynamic dynamicToJson(dynamic json) {
  if (json == null) {
    return null;
  }
  return json;
}

DateTime? dateTimeToUtc(DateTime? dateTime) {
  if (dateTime == null) {
    return null;
  }

  return dateTime.toUtc();
}
