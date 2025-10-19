import 'dart:convert';
import 'dart:developer';
import 'dart:math' hide log;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smivox_inventory_software/src/features/authentication/model/store/store_registration_model.dart';

class StorageManager {
  static String get _tokenKey => dotenv.get('TOKEN_KEY');
  static String get _refreshTokenKey => dotenv.get('REFRESH_TOKEN_KEY');
  static const String _storeDataKey = "STORE_DATA";
  static const String _userDataKey = "USER_DATA";
  static const String _hasSeenOnboardingKey = "HAS_SEEN_ONBOARDING";
  static const String _currentStepKey = "CURRENT_STEP";

  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> clearAuthData() async {
    _prefs = await SharedPreferences.getInstance();
    logTokenStatus();

  }

  static String? getAccessToken() {
    final token = _prefs.getString(_tokenKey);
    if (token == null) {
      log('Access Token: NULL (key: $_tokenKey)');
    } else {
      log('Access Token: Present (length: ${token.length})');
    }
    return token;
  }

  static String? getRefreshToken() {
    final token = _prefs.getString(_refreshTokenKey);
    if (token == null) {
      log('Refresh Token: NULL (key: $_refreshTokenKey)');
    } else {
      log('Refresh Token: Present (length: ${token.length})');
    }
    return token;
  }

  static Future<bool> saveAccessToken(String accessToken) async {
    try {
      final success = await _prefs.setString(_tokenKey, accessToken);
      if (success) {
        log('Access token saved successfully (length: ${accessToken.length})');
        final savedToken = getAccessToken();
        if (savedToken == accessToken) {
          log('Access token verified in storage');
        } else {
          log('Access token verification FAILED - storage issue');
        }
      } else {
        log('Failed to save access token to storage');
      }
      return success;
    } catch (e) {
      log('Error saving access token: $e');
      return false;
    }
  }

  static Future<bool> saveRefreshToken(String refreshToken) async {
    try {
      final success = await _prefs.setString(_refreshTokenKey, refreshToken);
      if (success) {
        log('Refresh token saved successfully (length: ${refreshToken.length})');
        final savedToken = getRefreshToken();
        if (savedToken == refreshToken) {
          log('Refresh token verified in storage');
        } else {
          log('Refresh token verification FAILED - storage issue');
        }
      } else {
        log('Failed to save refresh token to storage');
      }
      return success;
    } catch (e) {
      log('Error saving refresh token: $e');
      return false;
    }
  }

  static void logTokenStatus() {
    final access = getAccessToken();
    final refresh = getRefreshToken();

    log('=== TOKEN STORAGE STATUS ===');
    if (access != null) {
      log('Access Token: ${access.substring(0, min(30, access.length))}... (length: ${access.length})');
    } else {
      log('Access Token: NULL');
    }

    if (refresh != null) {
      log('Refresh Token: ${refresh.substring(0, min(30, refresh.length))}... (length: ${refresh.length})');
    } else {
      log('Refresh Token: NULL');
    }
    log('============================');
  }

  static Future<void> saveStoreData (Map<String, dynamic> storeJson) async {
          try {
              final jsonString = jsonEncode(storeJson);
              await _prefs.setString(_storeDataKey, jsonString);
              log("Store data saved: $storeJson");
          } catch (e) {
             log("Error saving store data: $e");
          }
  }

  static Map<String, dynamic>? getStoreData() {
       try {
          final jsonString = _prefs.getString(_storeDataKey);
          if (jsonString == null) return null;
          return jsonDecode(jsonString);
       } catch (e) {
         log("Error reading store data: $e");
         return null;
       }
  }

  static StoreRegistrationModel? getStoreDataAsModel() {
    try {
      final data = getStoreData();
      if (data == null) return null;
      return StoreRegistrationModel.fromJson(data);
    } catch (e) {
      log("❌ Error converting store data to model: $e");
      return null;
    }
  }

  static Future<void> clearStoreData() async {
     await _prefs.remove(_storeDataKey);
     log("Store data cleared from storage");
  }

  static Future<void> saveUserData(Map<String, dynamic> userJson) async {
        try {
            final jsonString = jsonEncode(userJson);
            await _prefs.setString(_userDataKey, jsonString);
            log("User data saved: $userJson");
        } catch (e) {
           log("Error saving user data: $e");
        }
  }

  static Map<String, dynamic>? getUserData() {
      try {
         final jsonString = _prefs.getString(_userDataKey);
         if (jsonString == null) return null;
         return jsonDecode(jsonString);
      } catch (e) {
         log("Error reading user data from local storage: $e");
         return null;
      }
  }

  static Future<void> clearUserData() async {
     await _prefs.remove(_storeDataKey);
     log("User data cleared from storage");
  }

  static Future<bool> setHasSeenOnboarding(bool value) async {
      try {
        final success = await _prefs.setBool(_hasSeenOnboardingKey, value);
        log("User seen onboarding: $value (success: $success)");
        return success;
      } catch (e) {
        log("Error setting hasSeenOnboarding: $e");
        return false;
      }
  }

  static bool getHasSeenOnboarding() {
      try {
         return _prefs.getBool(_hasSeenOnboardingKey) ?? false;
      } catch (e) {
        log("Error getting hasSeenOnboarding: $e");
        return false;
      }
  }

  static Future<void> clearHasSeenOnboarding() async {
      await _prefs.remove(_hasSeenOnboardingKey);
      log("User has seen onboarding cleared from storage");
  }

  static Future<bool> setCurrentStep (String step) async {
     try {
        final success = await _prefs.setString(_currentStepKey, step);
        log("Current step saved: $step (success: $success)");
        return success;
     } catch (e) {
        log("Error setting current step: $e");
        return false;
     }
  }

  static String? getCurrentStep() {
    try {
      return _prefs.getString(_currentStepKey);
    } catch (e) {
      log("Error getting current step: $e");
      return null;
    }
  }

  static Future<void> clearCurrentStep() async {
    await _prefs.remove(_currentStepKey);
    log("Current step cleared from storage");
  }


/// ==================== COMPLETE CLEAR METHODS ====================

  static Future<void> clearAllUserData() async {
    await clearAuthData();
    await clearStoreData();
    await clearUserData();
    await clearCurrentStep();
    // Note: We don't clear onboarding here as it's a one-time setting
    log("All user data cleared from storage");
  }

  static Future<void> clearEverything() async {
    await clearAllUserData();
    await clearHasSeenOnboarding();
    log("All storage data cleared (fresh install)");
  }

  static void logStorageStatus() {
    log('=== STORAGE STATUS ===');
    log('Has Seen Onboarding: ${getHasSeenOnboarding()}');
    log('Current Step: ${getCurrentStep()}');
    log('Access Token: ${getAccessToken() != null ? "Present" : "NULL"}');
    log('Refresh Token: ${getRefreshToken() != null ? "Present" : "NULL"}');
    log('Store Data: ${getStoreData() != null ? "Present" : "NULL"}');
    log('User Data: ${getUserData() != null ? "Present" : "NULL"}');
    log('======================');
  }


}