// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:async';

// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Fallback UsersRow class (use only if FlutterFlow hasn't generated UsersRow)
class UsersRow {
  final String id;
  final DateTime createdAt;
  final String? email;
  final int xpPoints;
  final String? firstName;
  final String? lastName;
  final int level;
  final String? role;
  final String? photoUrl;
  final DateTime? birthDate;
  final String? companyName;
  final String? companyPosition;
  final DateTime? companyStartDate;
  final int skillPoints;
  final int coins;
  final int? rankId;
  final int? branchId;

  UsersRow({
    required this.id,
    required this.createdAt,
    this.email,
    this.xpPoints = 0,
    this.firstName,
    this.lastName,
    this.level = 0,
    this.role,
    this.photoUrl,
    this.birthDate,
    this.companyName,
    this.companyPosition,
    this.companyStartDate,
    this.skillPoints = 0,
    this.coins = 0,
    this.rankId,
    this.branchId,
  });

  factory UsersRow.fromJson(Map<String, dynamic> json) {
    return UsersRow(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      email: json['email'] as String?,
      xpPoints: (json['xp_points'] as num?)?.toInt() ?? 0,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      level: (json['level'] as num?)?.toInt() ?? 0,
      role: json['role'] as String?,
      photoUrl: json['photo_url'] as String?,
      birthDate: json['birth_date'] != null
          ? DateTime.parse(json['birth_date'] as String)
          : null,
      companyName: json['company_name'] as String?,
      companyPosition: json['company_position'] as String?,
      companyStartDate: json['company_start_date'] != null
          ? DateTime.parse(json['company_start_date'] as String)
          : null,
      skillPoints: (json['skill_points'] as num?)?.toInt() ?? 0,
      coins: (json['coins'] as num?)?.toInt() ?? 0,
      rankId: (json['rank_id'] as num?)?.toInt(),
      branchId: (json['branch_id'] as num?)?.toInt(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt.toIso8601String(),
      'email': email,
      'xp_points': xpPoints,
      'first_name': firstName,
      'last_name': lastName,
      'level': level,
      'role': role,
      'photo_url': photoUrl,
      'birth_date': birthDate?.toIso8601String(),
      'company_name': companyName,
      'company_position': companyPosition,
      'company_start_date': companyStartDate?.toIso8601String(),
      'skill_points': skillPoints,
      'coins': coins,
      'rank_id': rankId,
      'branch_id': branchId,
    };
  }
}

class UserService {
  static UserService? _instance;
  factory UserService() => _instance ??= UserService._internal();
  UserService._internal();

  UsersRow? _currentUserData; // Cache for user data
  StreamSubscription<SupabaseStreamEvent>?
      _subscription; // Realtime subscription
  bool _isInitialized = false;

  // Initialize service: load data and set up Realtime subscription
  Future<void> initialize() async {
    if (_isInitialized) return; // Prevent re-initialization

    final user = Supabase.instance.client.auth.currentUser;
    if (user == null || user.id.isEmpty) {
      _currentUserData = null;
      print('UserService: No authenticated user found');
      return;
    }

    // Load initial data
    await _fetchUserData(user.id);

    // Set up Realtime subscription
    _subscription = Supabase.instance.client
        .from('users')
        .stream(primaryKey: ['id'])
        .eq('id', user.id)
        .listen((List<Map<String, dynamic>> data) {
          if (data.isNotEmpty) {
            _currentUserData = UsersRow.fromJson(data.first);
            print(
                'UserService: Updated user data in cache: ${_currentUserData?.toJson()}');
          } else {
            _currentUserData = null;
            print('UserService: No data received from Realtime stream');
          }
        }, onError: (error) {
          print('UserService: Realtime stream error: $error');
        });

    _isInitialized = true;
  }

  // Internal method to fetch user data
  Future<void> _fetchUserData(String userId) async {
    try {
      final response = await Supabase.instance.client.from('users').select('''
            id, created_at, email, xp_points, first_name, last_name, level, role,
            photo_url, birth_date, company_name, company_position, company_start_date,
            skill_points, coins, rank_id, branch_id
          ''').eq('id', userId).maybeSingle();

      if (response != null) {
        _currentUserData = UsersRow.fromJson(response);
        print('UserService: Fetched user data: ${_currentUserData?.toJson()}');
      } else {
        _currentUserData = null;
        print('UserService: No user data found for ID: $userId');
      }
    } catch (e) {
      print('UserService: Error fetching user data: $e');
      _currentUserData = null;
    }
  }

  // Get user data (from cache or database)
  Future<UsersRow?> getUserData() async {
    if (_currentUserData != null) {
      return _currentUserData;
    }

    final user = Supabase.instance.client.auth.currentUser;
    if (user == null || user.id.isEmpty) {
      print('UserService: No authenticated user found for getUserData');
      return null;
    }

    await _fetchUserData(user.id);
    return _currentUserData;
  }

  // Get cached user data directly
  UsersRow? getCachedUserData() {
    return _currentUserData;
  }

  // Clean up service (on logout)
  Future<void> dispose() async {
    await _subscription?.cancel();
    _currentUserData = null;
    _isInitialized = false;
    print('UserService: Disposed and unsubscribed from Realtime');
  }
}

// Custom Action to initialize the service
Future<void> userServiceInitializeAction() async {
  final service = UserService();
  await service.initialize();
}

// Custom Action to get user data
Future<UsersRow?> userServiceGetDataAction() async {
  final service = UserService();
  return await service.getUserData();
}

// Custom Action to get cached data
Future<UsersRow?> userServiceGetCachedDataAction() async {
  final service = UserService();
  return service.getCachedUserData();
}

// Custom Action to clean up on logout
Future<void> userServiceDisposeAction() async {
  final service = UserService();
  await service.dispose();
}
