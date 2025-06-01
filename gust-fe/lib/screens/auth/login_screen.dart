import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:formz/formz.dart';
import '../../providers/auth_provider.dart';
import '../../utils/validators.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/loading_button.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authStateProvider);
    
    ref.listen<AuthState>(authStateProvider, (previous, next) {
      if (next.isAuthenticated) {
        context.go('/home');
      }
      
      if (next.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.error!),
            backgroundColor: Colors.red,
          ),
        );
        ref.read(authStateProvider.notifier).clearError();
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Logo și titlu
                const Icon(
                  Icons.local_cafe,
                  size: 80,
                  color: Colors.green,
                ),
                const SizedBox(height: 24),
                Text(
                  'GUST',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'Monitorizează consumul de zahăr',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),
                
                // Email field
                CustomTextField(
                  controller: _emailController,
                  label: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => EmailValidator.dirty(value ?? '').error?.text,
                  prefixIcon: Icons.email,
                ),
                const SizedBox(height: 16),
                
                // Password field
                CustomTextField(
                  controller: _passwordController,
                  label: 'Parolă',
                  obscureText: _obscurePassword,
                  validator: (value) => PasswordValidator.dirty(value ?? '').error?.text,
                  prefixIcon: Icons.lock,
                  suffixIcon: IconButton(
                    icon: Icon(_obscurePassword ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 24),
                
                // Login button
                LoadingButton(
                  onPressed: _handleLogin,
                  isLoading: authState.isLoading,
                  child: const Text('Conectează-te'),
                ),
                const SizedBox(height: 16),
                
                // Register link
                TextButton(
                  onPressed: () => context.go('/register'),
                  child: const Text('Nu ai cont? Înregistrează-te'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      ref.read(authStateProvider.notifier).login(
        _emailController.text.trim(),
        _passwordController.text,
      );
    }
  }
}

enum EmailValidationError { invalid }

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure() : super.pure('');
  const Email.dirty([super.value = '']) : super.dirty();

  static final _emailRegExp = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  @override
  EmailValidationError? validator(String value) {
    return _emailRegExp.hasMatch(value) ? null : EmailValidationError.invalid;
  }
}