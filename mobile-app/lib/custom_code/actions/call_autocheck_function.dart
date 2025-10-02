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

Future<String> callAutocheckFunction(
    String? functionName, int? missionId) async {
  try {
    // Проверка на null для functionName
    if (functionName == null) {
      print('Function name is null');
      return 'Название функции не указано';
    }

    // Проверка на null для missionId
    if (missionId == null) {
      print('Mission ID is null');
      return 'ID миссии не указан';
    }

    // Инициализация Supabase клиента
    final supabase = SupaFlow.client;
    if (supabase == null) {
      print('Supabase client not initialized');
      return 'Supabase клиент не инициализирован';
    }

    // Получаем ID текущего пользователя
    final userId = supabase.auth.currentUser?.id;
    if (userId == null) {
      print('User not authenticated');
      return 'Пользователь не авторизован';
    }

    // Вызов RPC функции
    final response = await supabase.rpc(functionName, params: {
      'user_id': userId,
      'mission_id': missionId,
    });

    // Логируем результат
    print(
        'Autocheck function $functionName called by user $userId for mission $missionId: $response');

    // Проверяем ответ
    if (response['status'] == 'success') {
      return 'success';
    } else {
      return response['message'] ?? 'Неизвестная ошибка';
    }
  } catch (e) {
    // Обработка ошибок
    print(
        'Error calling autocheck function $functionName for mission $missionId: $e');
    return 'Ошибка выполнения: $e';
  }
}
