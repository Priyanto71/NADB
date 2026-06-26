import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'user_model.dart';

/// AuthProvider is the single source of truth for "is the user logged in,
/// and who are they". It extends ChangeNotifier so that any widget
/// listening to it (via Provider/Consumer) automatically rebuilds when
/// login state changes.
///
/// It also talks to SharedPreferences so that login state survives an
/// app restart (close the app while logged in -> reopen -> still logged in).
class AuthProvider extends ChangeNotifier {
  static const _keyIsLoggedIn = 'isLoggedIn';
  static const _keyUserName = 'userName';
  static const _keyUserEmail = 'userEmail';

  AppUser? _currentUser;
  bool _isLoggedIn = false;
  bool _isLoading = true; // true while we check SharedPreferences on startup

  AppUser? get currentUser => _currentUser;
  bool get isLoggedIn => _isLoggedIn;
  bool get isLoading => _isLoading;

  AuthProvider() {
    _loadSession();
  }

  /// Runs once when the app starts. Checks SharedPreferences to see if
  /// a session was already saved from a previous app launch.
  Future<void> _loadSession() async {
    final prefs = await SharedPreferences.getInstance();
    final loggedIn = prefs.getBool(_keyIsLoggedIn) ?? false;

    if (loggedIn) {
      final name = prefs.getString(_keyUserName) ?? '';
      final email = prefs.getString(_keyUserEmail) ?? '';
      _currentUser = AppUser(name: name, email: email);
      _isLoggedIn = true;
    }

    _isLoading = false;
    notifyListeners(); // tell listening widgets: "loading is done, rebuild"
  }

  /// Called from the Login screen. In a real app this would call an API;
  /// here we just validate that both fields are non-empty and "log in".
  Future<bool> login({required String name, required String email}) async {
    if (name.trim().isEmpty || email.trim().isEmpty) {
      return false;
    }

    _currentUser = AppUser(name: name.trim(), email: email.trim());
    _isLoggedIn = true;

    // Persist the session so it survives an app restart.
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyIsLoggedIn, true);
    await prefs.setString(_keyUserName, _currentUser!.name);
    await prefs.setString(_keyUserEmail, _currentUser!.email);

    notifyListeners(); // tell listening widgets: "state changed, rebuild"
    return true;
  }

  /// Called from the Home screen's logout button. Clears both the
  /// in-memory state and the saved SharedPreferences data.
  Future<void> logout() async {
    _currentUser = null;
    _isLoggedIn = false;

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyIsLoggedIn);
    await prefs.remove(_keyUserName);
    await prefs.remove(_keyUserEmail);

    notifyListeners();
  }
}
