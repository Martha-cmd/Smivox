import 'dart:developer';
import 'dart:math' hide log;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageManager {
  static String get _tokenKey => dotenv.get('TOKEN_KEY');
  static String get _refreshTokenKey => dotenv.get('REFRESH_TOKEN_KEY');

  static late SharedPreferences _prefs;

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
}