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

import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart'; // Импорт для HapticFeedback
import 'dart:collection';
import 'package:supabase_flutter/supabase_flutter.dart';

// Define the channel name explicitly
const String logbookChannelName = 'logbook_notifications_channel';

Future logbookNotifications(BuildContext context) async {
  // Check if user is authenticated
  final user = Supabase.instance.client.auth.currentUser;
  if (user == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Ошибка: пользователь не авторизован 😞')),
    );
    return;
  }

  // Queue for sequential dialog display
  final dialogQueue = ListQueue<Map<String, dynamic>>();
  bool isShowingDialog = false;

  // Function to get title based on entity_type
  String getEntityTypeTitle(String? entityType) {
    switch (entityType) {
      case 'purchase':
        return 'Покупка в КосмоЛавке 🛒';
      case 'mission':
        return 'Миссия пройдена 🚀';
      case 'reward':
        return 'Получение награды 🎁';
      case 'skill':
        return 'Улучшение навыка 🎯';
      case 'rank':
        return 'Повышение ранга 🏆';
      case 'level':
        return 'Уровень повышен 🌟';
      case 'event':
        return 'Событие пройдено 🎉';
      default:
        return 'Уведомление 📝';
    }
  }

  // Function to show the next dialog
  Future<void> showNextDialog() async {
    if (dialogQueue.isEmpty || isShowingDialog) return;

    isShowingDialog = true;
    final notification = dialogQueue.removeFirst();

    // Запускаем тактильную обратную связь
    HapticFeedback.lightImpact(); // Лёгкий импульс для уведомления

    await showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor:
              Colors.black.withOpacity(0.9), // Space-themed dark background
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: FlutterFlowTheme.of(context).primary.withOpacity(0.3),
                width: 2,
              ),
              gradient: LinearGradient(
                colors: [
                  Colors.black,
                  FlutterFlowTheme.of(context).primary.withOpacity(0.1),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title without star icons
                Text(
                  notification['title'],
                  style: TextStyle(
                    fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    letterSpacing: 0.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12),
                // Message content
                Text(
                  notification['message'],
                  style: TextStyle(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    fontSize: 16,
                    color: Colors.white70,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                // OK button with gradient, full-width, 56px height, and 50px border radius
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    isShowingDialog = false;
                    showNextDialog();
                  },
                  child: Container(
                    width: double.infinity,
                    height: 56,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF34A2DC),
                          Color(0xFF347EF4),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: FlutterFlowTheme.of(context)
                              .primary
                              .withOpacity(0.3),
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'ОК',
                        style: TextStyle(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Set up Realtime subscription channel with explicit name
  final channel = Supabase.instance.client.channel(logbookChannelName);

  // Subscribe to INSERT events in logbook table for the current user_id
  channel
      .onPostgresChanges(
        event: PostgresChangeEvent.insert,
        schema: 'public',
        table: 'logbook',
        filter: PostgresChangeFilter(
          type: PostgresChangeFilterType.eq,
          column: 'user_id',
          value: user.id,
        ),
        callback: (payload) {
          // Get data from the new record
          final newRecord = payload.newRecord;
          final entityType = newRecord['entity_type'] as String?;
          final title = getEntityTypeTitle(entityType);

          // Build rewards list
          final rewards = <String>[];
          if (newRecord['skill_points_change'] != null &&
              newRecord['skill_points_change'] != 0) {
            rewards.add('🎯 ${newRecord['skill_points_change']} очков навыков');
          }
          if (newRecord['xp_points_change'] != null &&
              newRecord['xp_points_change'] != 0) {
            rewards.add('🚀 ${newRecord['xp_points_change']} XP');
          }
          if (newRecord['level_change'] != null &&
              newRecord['level_change'] != 0) {
            rewards.add('🌟 Уровень ${newRecord['level_change']}');
          }
          if (newRecord['coins_change'] != null &&
              newRecord['coins_change'] != 0) {
            rewards.add('🪙 ${newRecord['coins_change']} монет');
          }

          // Form the message
          final message = rewards.isEmpty
              ? 'Поздравляем с выполнением! 🎈'
              : rewards.join('\n');

          // Add notification to queue
          dialogQueue.add({
            'title': title,
            'message': message,
          });

          // Show the dialog
          showNextDialog();
        },
      )
      .subscribe();
}
