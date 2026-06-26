import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'auth_provider.dart';
import 'login_screen.dart';
import 'home_screen.dart';
import 'logout_screen.dart';

/// Builds the app's GoRouter instance.
///
/// [authProvider] is passed in so the router's `redirect` callback can
/// read the current login state and decide where the user is allowed to go.
/// `refreshListenable` makes the router re-run that redirect logic every
/// time AuthProvider calls notifyListeners() (e.g. right after login/logout),
/// so navigation reacts immediately to state changes instead of needing
/// a manual context.go() everywhere.
GoRouter buildRouter(AuthProvider authProvider) {
  return GoRouter(
    initialLocation: '/login',
    refreshListenable: authProvider,
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/logout',
        builder: (context, state) => const LogoutScreen(),
      ),
    ],

    /// Route guarding logic:
    /// - While the saved session is still loading from SharedPreferences,
    ///   don't redirect at all (avoids a flash to the login screen).
    /// - If NOT logged in and trying to reach home/logout -> send to /login.
    /// - If logged in and sitting on /login -> send to /home.
    redirect: (BuildContext context, GoRouterState state) {
      if (authProvider.isLoading) return null;

      final loggedIn = authProvider.isLoggedIn;
      final goingToLogin = state.matchedLocation == '/login';

      if (!loggedIn && !goingToLogin) {
        return '/login';
      }
      if (loggedIn && goingToLogin) {
        return '/home';
      }
      return null; // no redirect needed
    },
  );
}
