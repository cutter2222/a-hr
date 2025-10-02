// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<DateTime?> showDatePicker(
  BuildContext context,
  bool showTime,
  bool showDate,
  DateTime? initialDateTime,
  bool? allowPast,
  bool? allowFuture,
) async {
  FocusScope.of(context).unfocus();

  // Initialize selectedDate with a valid initial value
  DateTime now = DateTime.now();
  DateTime? selectedDate;

  // Set date restrictions
  DateTime? minimumDate;
  DateTime? maximumDate;

  if (allowPast == false) {
    minimumDate = now;
  }
  if (allowFuture == false) {
    maximumDate = now;
  }

  // Validate initialDateTime
  if (initialDateTime != null) {
    if ((allowPast == false && initialDateTime.isBefore(now)) ||
        (allowFuture == false && initialDateTime.isAfter(now))) {
      // If initialDateTime is outside allowed range, clamp it
      if (minimumDate != null && maximumDate != null) {
        selectedDate =
            now; // Default to now if both past and future are restricted
      } else if (minimumDate != null) {
        selectedDate = minimumDate;
      } else if (maximumDate != null) {
        selectedDate = maximumDate;
      }
    } else {
      selectedDate = initialDateTime;
    }
  } else {
    // Default to now if no initialDateTime is provided
    selectedDate = now;
  }

  // Handle edge case: both allowPast and allowFuture are false
  if (allowPast == false && allowFuture == false) {
    // If both are false, restrict to current date/time only
    minimumDate = DateTime(now.year, now.month, now.day, now.hour, now.minute);
    maximumDate = minimumDate;
  }

  // Determine picker mode
  final pickerMode = showTime && showDate
      ? CupertinoDatePickerMode.dateAndTime
      : showTime
          ? CupertinoDatePickerMode.time
          : CupertinoDatePickerMode.date;

  // Show modal bottom sheet
  final result = await showModalBottomSheet<DateTime>(
    context: context,
    isScrollControlled: true, // Allow dynamic height
    builder: (BuildContext context) {
      return Localizations.override(
        context: context,
        locale: Localizations.localeOf(context), // Use app's current locale
        child: Container(
          height: MediaQuery.of(context).size.height * 0.4, // Responsive height
          color: const Color(0xFF242B47), // Background color #242b47
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context, null); // Return null on cancel
                      },
                      child: const Text(
                        'Отмена', // Cancel button
                        style: TextStyle(
                          color: Color(0xFF34A2DC),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(
                            context, selectedDate); // Return selected date
                      },
                      child: const Text(
                        'Готово', // Done button
                        style: TextStyle(
                          color: Color(0xFF34A2DC),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: CupertinoTheme(
                  data: const CupertinoThemeData(
                    textTheme: CupertinoTextThemeData(
                      dateTimePickerTextStyle: TextStyle(
                        color: Colors.white, // Picker text color
                        fontSize: 20,
                      ),
                    ),
                  ),
                  child: CupertinoDatePicker(
                    mode: pickerMode,
                    initialDateTime: selectedDate,
                    minimumDate: minimumDate,
                    maximumDate: maximumDate,
                    onDateTimeChanged: (DateTime newDate) {
                      selectedDate = newDate;
                    },
                    use24hFormat: true, // Can be made configurable if needed
                  ),
                ),
              ),
              SizedBox(
                  height: MediaQuery.of(context).padding.bottom +
                      10), // Safe area padding
            ],
          ),
        ),
      );
    },
  );

  return result;
}
