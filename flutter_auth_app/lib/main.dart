import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_provider.dart';
import 'router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ChangeNotifierProvider creates ONE AuthProvider instance and makes
    // it available to every widget below it in the tree via
    // context.watch<AuthProvider>() or context.read<AuthProvider>().
    return ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: const _AppWithRouter(),
    );
  }
}

/// Separated into its own widget so that `context.watch<AuthProvider>()`
/// here can rebuild the router safely without rebuilding the provider above.
class _AppWithRouter extends StatefulWidget {
  const _AppWithRouter();

  @override
  State<_AppWithRouter> createState() => _AppWithRouterState();
}

class _AppWithRouterState extends State<_AppWithRouter> {
  late final auth = context.read<AuthProvider>();
  late final router = buildRouter(auth);

  @override
  Widget build(BuildContext context) {
    final isLoading = context.watch<AuthProvider>().isLoading;

    // While SharedPreferences is being read on first launch, show a
    // minimal splash instead of letting go_router flash the login screen.
    if (isLoading) {
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Color(0xFFF4F6FB),
          body: Center(
            child: CircularProgressIndicator(color: Color(0xFF3B5BDB)),
          ),
        ),
      );
    }

    return MaterialApp.router(
      title: 'Flutter Auth Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF3B5BDB),
        fontFamily: 'Roboto',
      ),
      routerConfig: router,
    );
  }
}
