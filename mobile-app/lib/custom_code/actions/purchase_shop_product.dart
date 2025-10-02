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

Future<String> purchaseShopProduct(int shopProductId) async {
  try {
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
    final response = await supabase.rpc('purchase_shop_product', params: {
      'in_shop_product_id': shopProductId,
    });

    // Логируем результат
    print(
        'Purchase attempt for product $shopProductId by user $userId: $response');

    // Проверяем ответ
    if (response['status'] == 'success') {
      return 'success';
    } else {
      return response['message'] ?? 'Неизвестная ошибка';
    }
  } catch (e) {
    // Обработка ошибок
    print('Error purchasing shop product: $e');
    return 'Ошибка покупки: $e';
  }
}
