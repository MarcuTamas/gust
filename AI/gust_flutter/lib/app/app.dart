import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gust_flutter/app/router.dart';
import 'package:gust_flutter/config/app_theme.dart';
import 'package:gust_flutter/providers/auth_provider.dart';

class GustApp extends ConsumerWidget {
  const GustApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Ascultă starea de autentificare pentru a actualiza router-ul
    final authState = ref.watch(authStateProvider);
    
    // Configurează router-ul bazat pe starea de autentificare
    final router = getRouter(authState.isAuthenticated);

    return MaterialApp.router(
      title: 'GUST - Monitorizare Zahăr',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // Folosește tema sistemului
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}