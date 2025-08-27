import 'package:chhoto_khabar/l10n/app_localizations_unified.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../blocs/profile_bloc/profile_bloc.dart';
import '../blocs/profile_bloc/profile_event.dart';
import '../blocs/profile_bloc/profile_state.dart';
import '../../../../core/config/dependency_injection/di_config.dart';
import '../widgets/authenticated_profile_view.dart';
import '../widgets/unauthenticated_profile_view.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A), // Dark background
      body: BlocProvider(
        create: (context) => sl<ProfileBloc>()..add(const ProfileEvent.checkAuthAndLoad()),
        child: BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {
            state.when(
              initial: () {},
              checkingAuth: () {},
              unauthenticated: () {
                // Could show a snackbar or handle navigation
              },
              loading: () {},
              loaded: (profile) {},
              updating: (currentProfile) {},
              updated: (profile) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text(
                      'Profile updated successfully',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: const Color(0xFF4A9B8C),
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                );
              },
              error: (exception) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      exception.message,
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor: const Color(0xFFE74C3C),
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                );
              },
              updateError: (exception, profile) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Update failed: ${exception.message}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor: const Color(0xFFE74C3C),
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                );
              },
            );
          },
          builder: (context, state) {
            return state.when(
              initial: () => _buildLoadingContent('Initializing...'),
              checkingAuth: () => _buildLoadingContent('Checking authentication...'),
              unauthenticated: () => const UnauthenticatedProfileView(),
              loading: () => _buildLoadingContent('Loading profile...'),
              loaded: (profile) => AuthenticatedProfileView(profile: profile),
              updating: (currentProfile) => Stack(
                children: [
                  AuthenticatedProfileView(profile: currentProfile),
                  Container(
                    color: Colors.black.withOpacity(0.5),
                    child: const Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF4A9B8C)),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Updating profile...',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              updated: (profile) => AuthenticatedProfileView(profile: profile),
              error: (exception) => _buildErrorContent(context, exception.message),
              updateError: (exception, currentProfile) => Stack(
                children: [
                  AuthenticatedProfileView(profile: currentProfile),
                  Container(
                    color: const Color(0xFF1A1A1A).withOpacity(0.9),
                    child: Center(
                      child: Container(
                        margin: const EdgeInsets.all(32),
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2A2A2A),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: const Color(0xFFE74C3C).withOpacity(0.3),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.error_outline,
                              color: Color(0xFFE74C3C),
                              size: 48,
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'Update Failed',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              exception.message,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Color(0xFF888888),
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 24),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  context.read<ProfileBloc>().add(
                                    const ProfileEvent.loadProfile(),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF4A9B8C),
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Text(
                                  'Dismiss',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildLoadingContent(String message) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: const Color(0xFF1A1A1A),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Handle back navigation if needed 
          },
        ),
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF4A9B8C)),
            ),
            const SizedBox(height: 24),
            Text(
              message,
              style: const TextStyle(
                color: Color(0xFF888888),
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorContent(BuildContext context, String errorMessage) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A1A),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                size: 80,
                color: Color(0xFFE74C3C),
              ),
              const SizedBox(height: 24),
              const Text(
                'Error Loading Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                errorMessage,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF888888),
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    context.read<ProfileBloc>().add(
                      const ProfileEvent.checkAuthAndLoad(),
                    );
                  },
                  icon: const Icon(Icons.refresh, size: 20),
                  label: const Text(
                    'Retry',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4A9B8C),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}