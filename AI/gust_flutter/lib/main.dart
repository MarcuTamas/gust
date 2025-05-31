import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gust_flutter/app/app.dart';
import 'package:gust_flutter/services/storage_service.dart';

void main() async {
  // Asigură că Flutter bindings sunt inițializate
  WidgetsFlutterBinding.ensureInitialized();
  
  // Inițializează serviciile
  await StorageService.init();
  
  // Rulează aplicația cu ProviderScope pentru Riverpod
  runApp(
    const ProviderScope(
      child: GustApp(),
    ),
  );
}