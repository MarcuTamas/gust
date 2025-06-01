import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';

import 'config/app_theme.dart';
import 'config/app_router.dart';
import 'services/storage_service.dart';
import 'services/dio_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Inițializarea serviciilor
  await StorageService.instance.init();
  
  // Inițializează DioService aici!
  DioService.instance.init();
  
  // Configurare portret
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  runApp(const ProviderScope(child: GustApp()));
}

class GustApp extends ConsumerWidget {
  const GustApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    
    return MaterialApp.router(
      title: 'GUST - Monitor Zahăr',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}