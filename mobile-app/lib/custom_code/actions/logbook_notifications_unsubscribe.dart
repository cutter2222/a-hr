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

// Define the channel name explicitly
const String logbookChannelName = 'logbook_notifications_channel';

Future logbookNotificationsUnsubscribe() async {
  final channel = Supabase.instance.client.channel(logbookChannelName);
  await channel.unsubscribe();
}
