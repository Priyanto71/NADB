/// Simple data model representing a logged-in user.
/// Kept deliberately minimal: just name and email.
class AppUser {
  final String name;
  final String email;

  const AppUser({required this.name, required this.email});

  /// Converts the user object into a Map, so it can be saved
  /// as a JSON-like string in SharedPreferences.
  Map<String, String> toMap() {
    return {'name': name, 'email': email};
  }

  /// Rebuilds an AppUser from a saved Map (used when restoring
  /// session data from SharedPreferences on app start).
  factory AppUser.fromMap(Map<String, String> map) {
    return AppUser(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
    );
  }
}
