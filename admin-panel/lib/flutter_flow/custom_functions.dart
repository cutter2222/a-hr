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

List<int>? chartAxisYpx(List<double>? values) {
  if (values == null || values.isEmpty) {
    return null;
  }

  List<int> result = [];

  // Find the maximum value in the list
  double maxValue =
      values.reduce((value, element) => value > element ? value : element);

  // Find the minimum value in the list
  double minValue =
      values.reduce((value, element) => value < element ? value : element);

  // If all values are equal, set increment to 1
  double increment = maxValue == minValue ? 1 : (maxValue - minValue) / 4;

  // Add the rounded values to the result list
  for (int i = 0; i < 5; i++) {
    int value = (minValue + i * increment).round();
    if (!result.contains(value)) {
      result.add(value);
    }
  }

  return result.reversed.toList();
}

List<int>? chartAxisXitems(int? items) {
  List<int> list = [];
  if (items! == null) return list;
  for (var i = 0; i < items!; i++) {
    list.add(i);
  }
  return list;
}

double? chartWidthPx(
  double? amountX,
  double? stepPx,
) {
  final a = amountX! * stepPx!;
  return a;
}

DateTime? dateTimeToDate(DateTime? dateTime) {
  return DateTime(dateTime!.year, dateTime!.month, dateTime!.day);
}

DateTime? dateTimePlusDay(
  DateTime? dateTime,
  int? daysToAdd,
) {
  dateTime = DateTime(dateTime!.year, dateTime.month, dateTime.day);
  return dateTime.add(Duration(days: daysToAdd!));
}

DateTime? dateTimeMinusDay(
  DateTime? dateTime,
  int? daysToSubtract,
) {
  dateTime = DateTime(dateTime!.year, dateTime.month, dateTime.day);
  return dateTime.subtract(Duration(days: daysToSubtract!));
}

DateTime? dateTimeToEndDay(DateTime? dateTime) {
  return DateTime(dateTime!.year, dateTime!.month, dateTime!.day, 23, 59);
}

List<double>? intListToDouble(List<int>? intList) {
  return intList!.map((number) => number.toDouble()).toList();
}

List<int> getIdsToDelete(
  List<int>? initialList,
  List<int>? currentList,
) {
  if (initialList == null || currentList == null) {
    return [];
  }
  return initialList.where((id) => !currentList.contains(id)).toList();
}

List<int> getIdsToAdd(
  List<int>? initialList,
  List<int>? currentList,
) {
  if (initialList == null || currentList == null) {
    return [];
  }
  return currentList.where((id) => !initialList.contains(id)).toList();
}

dynamic dynamicToJson(String? json) {
  if (json == null) {
    return null;
  }
  return json;
}

String? colorToString(Color color) {
  return '#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}';
}

String? stringToimage(String? image) {
  if (image == null) {
    return null;
  }
  return image;
}

String? stringToVideo(String? video) {
  if (video == null) {
    return null;
  }
  return video;
}
