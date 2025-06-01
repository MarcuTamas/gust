import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/auth_provider.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/register_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/logs/add_log_screen.dart';
import '../screens/logs/edit_log_screen.dart';
import '../screens/logs/logs_screen.dart';
import '../screens/analytics/analytics_screen.dart';
import '../screens/community/community_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/main_scaffold.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: authState.isAuthenticated ? '/home' : '/login',
    redirect: (context, state) {
      final isAuthenticated = authState.isAuthenticated;
      final isGoingToAuth = state.matchedLocation.startsWith('/login') ||
          state.matchedLocation.startsWith('/register');

      if (!isAuthenticated && !isGoingToAuth) {
        return '/login';
      }

      if (isAuthenticated && isGoingToAuth) {
        return '/home';
      }

      return null;
    },
    routes: [
      // Auth routes
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),

      // Main app routes with bottom navigation
      ShellRoute(
        builder: (context, state, child) => MainScaffold(child: child),
        routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/logs',
            builder: (context, state) => const LogsScreen(),
          ),
          GoRoute(
            path: '/analytics',
            builder: (context, state) => const AnalyticsScreen(),
          ),
          GoRoute(
            path: '/community',
            builder: (context, state) => const CommunityScreen(),
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) => const ProfileScreen(),
          ),
        ],
      ),

      // Detail routes
      GoRoute(
        path: '/add-log',
        builder: (context, state) => const AddLogScreen(),
      ),
      GoRoute(
        path: '/edit-log/:id',
        builder: (context, state) {
          final id = int.parse(state.pathParameters['id']!);
          return EditLogScreen(logId: id);
        },
      ),
    ],
  );
});
