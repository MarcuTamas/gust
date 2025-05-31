import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
    ),
  );

  static SharedPreferences? _prefs;

  // Keys pentru stocare
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _userDataKey = 'user_data';
  static const String _isLoggedInKey = 'is_logged_in';
  static const String _themeKey = 'app_theme';
  static const String _languageKey = 'app_language';

  /// Inițializează serviciul de stocare
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Metodă pentru verificarea dacă SharedPreferences este inițializat
  static void _ensureInitialized() {
    if (_prefs == null) {
      throw Exception('StorageService nu a fost inițializat. Apelează init() primul.');
    }
  }

  // ============= Secure Storage Methods (pentru date sensibile) =============

  /// Salvează access token-ul
  static Future<void> saveAccessToken(String token) async {
    await _secureStorage.write(key: _accessTokenKey, value: token);
  }

  /// Obține access token-ul
  static Future<String?> getAccessToken() async {
    return await _secureStorage.read(key: _accessTokenKey);
  }

  /// Salvează refresh token-ul
  static Future<void> saveRefreshToken(String token) async {
    await _secureStorage.write(key: _refreshTokenKey, value: token);
  }

  /// Obține refresh token-ul
  static Future<String?> getRefreshToken() async {
    return await _secureStorage.read(key: _refreshTokenKey);
  }

  /// Salvează datele utilizatorului (JSON string)
  static Future<void> saveUserData(String userData) async {
    await _secureStorage.write(key: _userDataKey, value: userData);
  }

  /// Obține datele utilizatorului
  static Future<String?> getUserData() async {
    return await _secureStorage.read(key: _userDataKey);
  }

  /// Șterge toate datele securizate
  static Future<void> clearSecureData() async {
    await _secureStorage.deleteAll();
  }

  /// Șterge un anumit key din secure storage
  static Future<void> deleteSecureKey(String key) async {
    await _secureStorage.delete(key: key);
  }

  // ============= Shared Preferences Methods (pentru preferințe) =============

  /// Salvează starea de autentificare
  static Future<void> saveLoginState(bool isLoggedIn) async {
    _ensureInitialized();
    await _prefs!.setBool(_isLoggedInKey, isLoggedIn);
  }

  /// Verifică dacă utilizatorul este autentificat
  static bool isLoggedIn() {
    _ensureInitialized();
    return _prefs!.getBool(_isLoggedInKey) ?? false;
  }

  /// Salvează tema aplicației
  static Future<void> saveTheme(String theme) async {
    _ensureInitialized();
    await _prefs!.setString(_themeKey, theme);
  }

  /// Obține tema aplicației
  static String getTheme() {
    _ensureInitialized();
    return _prefs!.getString(_themeKey) ?? 'system';
  }

  /// Salvează limba aplicației
  static Future<void> saveLanguage(String language) async {
    _ensureInitialized();
    await _prefs!.setString(_languageKey, language);
  }

  /// Obține limba aplicației
  static String getLanguage() {
    _ensureInitialized();
    return _prefs!.getString(_languageKey) ?? 'ro';
  }

  /// Salvează o valoare string
  static Future<void> saveString(String key, String value) async {
    _ensureInitialized();
    await _prefs!.setString(key, value);
  }

  /// Obține o valoare string
  static String? getString(String key) {
    _ensureInitialized();
    return _prefs!.getString(key);
  }

  /// Salvează o valoare int
  static Future<void> saveInt(String key, int value) async {
    _ensureInitialized();
    await _prefs!.setInt(key, value);
  }

  /// Obține o valoare int
  static int? getInt(String key) {
    _ensureInitialized();
    return _prefs!.getInt(key);
  }

  /// Salvează o valoare bool
  static Future<void> saveBool(String key, bool value) async {
    _ensureInitialized();
    await _prefs!.setBool(key, value);
  }

  /// Obține o valoare bool
  static bool? getBool(String key) {
    _ensureInitialized();
    return _prefs!.getBool(key);
  }

  /// Salvează o listă de stringuri
  static Future<void> saveStringList(String key, List<String> value) async {
    _ensureInitialized();
    await _prefs!.setStringList(key, value);
  }

  /// Obține o listă de stringuri
  static List<String>? getStringList(String key) {
    _ensureInitialized();
    return _prefs!.getStringList(key);
  }

  /// Șterge toate preferințele
  static Future<void> clearPreferences() async {
    _ensureInitialized();
    await _prefs!.clear();
  }

  /// Șterge o preferință specifică
  static Future<void> removePreference(String key) async {
    _ensureInitialized();
    await _prefs!.remove(key);
  }

  // ============= Utility Methods =============

  /// Șterge toate datele (secure + preferences)
  static Future<void> clearAll() async {
    await clearSecureData();
    await clearPreferences();
  }

  /// Logout complet - șterge toate datele de autentificare
  static Future<void> logout() async {
    await deleteSecureKey(_accessTokenKey);
    await deleteSecureKey(_refreshTokenKey);
    await deleteSecureKey(_userDataKey);
    await saveLoginState(false);
  }

  /// Verifică dacă există token-uri valide
  static Future<bool> hasValidTokens() async {
    final accessToken = await getAccessToken();
    return accessToken != null && accessToken.isNotEmpty;
  }
}