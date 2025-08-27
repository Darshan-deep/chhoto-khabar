import 'package:chhoto_khabar/core/utils/snack_bars.dart';
import 'package:chhoto_khabar/core/widgets/body_description_text.dart';
import 'package:chhoto_khabar/core/widgets/input_field.dart';
import 'package:chhoto_khabar/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:chhoto_khabar/features/auth/presentation/bloc/auth_bloc/auth_event.dart';
import 'package:chhoto_khabar/features/auth/presentation/bloc/auth_bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:chhoto_khabar/l10n/app_localizations_unified.dart';

class PatientLogInPage extends StatefulWidget {
  const PatientLogInPage({super.key});

  @override
  State<PatientLogInPage> createState() => _PatientLogInPageState();
}

class _PatientLogInPageState extends State<PatientLogInPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          authenticated: (accessToken, refreshToken) {
            SnackBars.showSuccessSnackBar('Welcome back!');
            context.go('/news-feed');
          },
          failure: (exception) {
            SnackBars.showErrorSnackBar(exception.message);
          },
          validationError: (validationErrors) {
            String errorMessage = 'Please check your input';
            if (validationErrors.errors.isNotEmpty) {
              errorMessage = validationErrors.errors.values.first.first;
            }
            SnackBars.showErrorSnackBar(errorMessage);
          },
          authRequired: (action, message) {
            SnackBars.showInfoSnackBar(message);
          },
        );
      },
      child: Scaffold(
        backgroundColor: theme.colorScheme.surface,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () => context.go('/'),
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 20,
              color: theme.colorScheme.onSurface,
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),

                  // Simple header
                  Icon(
                    Icons.newspaper_rounded,
                    size: 64,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Welcome Back',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Sign in to continue reading',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.onSurface.withOpacity(0.7),
                    ),
                  ),

                  const SizedBox(height: 48),

                  // Browse as guest button
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: OutlinedButton.icon(
                      onPressed: () => context.go('/news-feed'),
                      icon: const Icon(Icons.explore_outlined, size: 20),
                      label: const Text('Browse as Guest'),
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Divider
                  Row(
                    children: [
                      Expanded(
                          child: Divider(
                              color:
                                  theme.colorScheme.outline.withOpacity(0.3))),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'or',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurface.withOpacity(0.6),
                          ),
                        ),
                      ),
                      Expanded(
                          child: Divider(
                              color:
                                  theme.colorScheme.outline.withOpacity(0.3))),
                    ],
                  ),

                  const SizedBox(height: 32),

                  // Email field
                  BodyDescriptionText(text: 'Email'),
                  const SizedBox(height: 8),
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      final isLoading = state.maybeWhen(
                        loading: () => true,
                        orElse: () => false,
                      );

                      return InputField(
                        controller: _emailController,
                        hintText: 'Enter your email',
                        enabled: !isLoading,
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: theme.colorScheme.primary.withOpacity(0.7),
                          size: 20,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          }
                          if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w]{2,4}$')
                              .hasMatch(value)) {
                            return 'Enter a valid email';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                      );
                    },
                  ),

                  const SizedBox(height: 20),

                  // Password field
                  BodyDescriptionText(text: 'Password'),
                  const SizedBox(height: 8),
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      final isLoading = state.maybeWhen(
                        loading: () => true,
                        orElse: () => false,
                      );

                      return InputField(
                        controller: _passwordController,
                        hintText: 'Enter your password',
                        isPassword: true,
                        enabled: !isLoading,
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: theme.colorScheme.primary.withOpacity(0.7),
                          size: 20,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (_) => _handleLogin(),
                      );
                    },
                  ),

                  const SizedBox(height: 32),

                  // Login button
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      final isLoading = state.maybeWhen(
                        loading: () => true,
                        orElse: () => false,
                      );

                      return SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: isLoading ? null : _handleLogin,
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: isLoading
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                              : const Text(
                                  'Sign In',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 16),

                  // Forgot password
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      final isLoading = state.maybeWhen(
                        loading: () => true,
                        orElse: () => false,
                      );

                      return TextButton(
                        onPressed: isLoading
                            ? null
                            : () => context.push('/patient-forgot-password'),
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: isLoading
                                ? theme.colorScheme.primary.withOpacity(0.5)
                                : theme.colorScheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 32),

                  // Sign up
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      final isLoading = state.maybeWhen(
                        loading: () => true,
                        orElse: () => false,
                      );

                      return TextButton(
                        onPressed:
                            isLoading ? null : () => context.push('/register'),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Don\'t have an account? ',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.colorScheme.onSurface
                                      .withOpacity(0.7),
                                ),
                              ),
                              TextSpan(
                                text: 'Sign up',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: isLoading
                                      ? theme.colorScheme.primary
                                          .withOpacity(0.5)
                                      : theme.colorScheme.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      HapticFeedback.lightImpact();

      context.read<AuthBloc>().add(
            AuthEvent.signIn(
              email: _emailController.text.trim().toLowerCase(),
              password: _passwordController.text.trim(),
            ),
          );
    } else {
      HapticFeedback.mediumImpact();
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
