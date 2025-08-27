// import 'package:chhoto_khabar/core/utils/snack_bars.dart';
// import 'package:chhoto_khabar/core/widgets/body_description_text.dart';
// import 'package:chhoto_khabar/core/widgets/password_input_field.dart';
// import 'package:chhoto_khabar/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:pinput/pinput.dart';
// import 'package:chhoto_khabar/l10n/app_localizations.dart';


// class PatientNewPasswordPage extends StatefulWidget {
//   final String phone;

//   const PatientNewPasswordPage({
//     super.key,
//     required this.phone,
//   });

//   @override
//   State<PatientNewPasswordPage> createState() => _PatientNewPasswordPageState();
// }

// class _PatientNewPasswordPageState extends State<PatientNewPasswordPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _passwordController = TextEditingController();
//   final _confirmPasswordController = TextEditingController();
//   final _otpController = TextEditingController();

//   @override
//   void dispose() {
//     _passwordController.dispose();
//     _confirmPasswordController.dispose();
//     _otpController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final theme = Theme.of(context);

//     return BlocListener<AuthBloc, AuthState>(
//       listener: (context, state) {
//         state.maybeWhen(
//           orElse: () {},
//           failure: (exception) =>
//               SnackBars.showErrorSnackBar(exception.message),
//           success: (message, data) {
//             SnackBars.showSuccessSnackBar(message);
//             context.go('/login');
//           },
//         );
//       },
//       child: Scaffold(
//         backgroundColor: theme.colorScheme.surface,
//         body: SafeArea(
//           child: SingleChildScrollView(
//             physics: const BouncingScrollPhysics(),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24.0),
//               child: Form(
//                 key: _formKey,
//                 autovalidateMode: AutovalidateMode.onUserInteraction,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Back button
//                     Padding(
//                       padding: const EdgeInsets.only(top: 4.0),
//                       child: IconButton(
//                         onPressed: () => context.pop(),
//                         icon: Icon(
//                           Icons.arrow_back_ios_new_rounded,
//                           size: 20,
//                           color: theme.colorScheme.onSurface
//                               .withValues(alpha: 0.7),
//                         ),
//                       ),
//                     ),

//                     // Header section
//                     Center(
//                       child: Column(
//                         children: [
//                           const SizedBox(height: 4),
//                           Container(
//                             height: 80,
//                             width: 80,
//                             padding: const EdgeInsets.all(20),
//                             decoration: BoxDecoration(
//                               gradient: LinearGradient(
//                                 colors: [
//                                   Colors.green.shade100,
//                                   Colors.green.shade50,
//                                 ],
//                                 begin: Alignment.topLeft,
//                                 end: Alignment.bottomRight,
//                               ),
//                               borderRadius: BorderRadius.circular(24),
//                               border: Border.all(
//                                 color: Colors.green.shade200,
//                                 width: 1,
//                               ),
//                             ),
//                             child: Icon(
//                               Iconsax.security_safe,
//                               size: 40,
//                               color: Colors.green.shade600,
//                             ),
//                           ),
//                           const SizedBox(height: 24),
//                           Text(
//                             'Create New Password',
//                             style: theme.textTheme.headlineSmall?.copyWith(
//                               fontWeight: FontWeight.w700,
//                               color: theme.colorScheme.onSurface,
//                             ),
//                           ),
//                           const SizedBox(height: 12),
//                           SizedBox(
//                             width: size.width * 0.85,
//                             child: Text(
//                               'Your new password must be different from previously used passwords and meet our security requirements.',
//                               textAlign: TextAlign.center,
//                               style: theme.textTheme.bodySmall?.copyWith(
//                                 color: theme.colorScheme.onSurface
//                                     .withValues(alpha: 0.6),
//                                 fontWeight: FontWeight.w400,
//                                 height: 1.5,
//                               ),
//                             ),
//                           ),

//                           // Phone number context
//                           Container(
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 16,
//                               vertical: 12,
//                             ),
//                             decoration: BoxDecoration(
//                               color: theme.colorScheme.primary
//                                   .withValues(alpha: 0.08),
//                               borderRadius: BorderRadius.circular(12),
//                               border: Border.all(
//                                 color: theme.colorScheme.primary
//                                     .withValues(alpha: 0.2),
//                               ),
//                             ),
//                             child: Row(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 Icon(
//                                   Icons.phone_android_rounded,
//                                   size: 16,
//                                   color: theme.colorScheme.primary,
//                                 ),
//                                 const SizedBox(width: 8),
//                                 Text(
//                                   '+977- ${widget.phone}',
//                                   style: theme.textTheme.bodyMedium?.copyWith(
//                                     fontWeight: FontWeight.w600,
//                                     color: theme.colorScheme.primary,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),

//                     const SizedBox(height: 16),

//                     // Verification code section
//                     BodyDescriptionText(
//                       text: 'Verification Code',
//                       fontWeight: FontWeight.w600,
//                       color: theme.colorScheme.onSurface,
//                     ),
//                     const SizedBox(height: 8),
//                     Text(
//                       'Enter the 6-digit code sent to your phone',
//                       style: theme.textTheme.bodySmall?.copyWith(
//                         color:
//                             theme.colorScheme.onSurface.withValues(alpha: 0.6),
//                       ),
//                     ),
//                     const SizedBox(height: 12),

                    

//                     const SizedBox(height: 16),

//                     // Password fields
//                     BodyDescriptionText(
//                       text: 'New Password',
//                       fontWeight: FontWeight.w600,
//                       color: theme.colorScheme.onSurface,
//                     ),

//                     const SizedBox(height: 12),
//                     Container(
//                       decoration: BoxDecoration(
//                         boxShadow: [
//                           BoxShadow(
//                             color: theme.colorScheme.primary
//                                 .withValues(alpha: 0.05),
//                             blurRadius: 20,
//                             offset: const Offset(0, 4),
//                           ),
//                         ],
//                       ),
//                       child: PasswordInputField(
//                         controller: _passwordController,
//                         hintText: 'Create a strong password',
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Password is required';
//                           }
//                           if (value.length < 8) {
//                             return 'Password must be at least 8 characters';
//                           }
//                           if (!RegExp(r'[A-Z]').hasMatch(value)) {
//                             return 'Password must contain at least 1 uppercase letter';
//                           }
//                           if (!RegExp(r'[a-z]').hasMatch(value)) {
//                             return 'Password must contain at least 1 lowercase letter';
//                           }
//                           if (!RegExp(r'[0-9]').hasMatch(value)) {
//                             return 'Password must contain at least 1 number';
//                           }
//                           if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]')
//                               .hasMatch(value)) {
//                             return 'Password must contain at least 1 special character';
//                           }
//                           return null;
//                         },
//                       ),
//                     ),

//                     const SizedBox(height: 8),

//                     BodyDescriptionText(
//                       text: 'Confirm Password',
//                       fontWeight: FontWeight.w600,
//                       color: theme.colorScheme.onSurface,
//                     ),

//                     const SizedBox(height: 12),
//                     Container(
//                       decoration: BoxDecoration(
//                         boxShadow: [
//                           BoxShadow(
//                             color: theme.colorScheme.primary
//                                 .withValues(alpha: 0.05),
//                             blurRadius: 20,
//                             offset: const Offset(0, 4),
//                           ),
//                         ],
//                       ),
//                       child: PasswordInputField(
//                         controller: _confirmPasswordController,
//                         hintText: 'Confirm your new password',
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please confirm your password';
//                           }
//                           if (value != _passwordController.text) {
//                             return 'Passwords do not match';
//                           }
//                           return null;
//                         },
//                       ),
//                     ),

//                     const SizedBox(height: 14),

//                     // Reset password button
//                     BlocBuilder<AuthBloc, AuthState>(
//                       builder: (context, state) {
//                         final isLoading = state.maybeWhen(
//                           loading: () => true,
//                           orElse: () => false,
//                         );

//                         return SizedBox(
//                           width: double.infinity,
//                           height: 55,
//                           child: ElevatedButton(
//                             onPressed: isLoading ? null : _resetPassword,
//                             child: isLoading
//                                 ? SizedBox(
//                                     height: 24,
//                                     width: 24,
//                                     child: CircularProgressIndicator(
//                                       strokeWidth: 2.5,
//                                       color: theme.colorScheme.onPrimary,
//                                     ),
//                                   )
//                                 : Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Icon(
//                                         Iconsax.shield_tick,
//                                         size: 18,
//                                         color: theme.colorScheme.onPrimary,
//                                       ),
//                                       const SizedBox(width: 10),
//                                       Text(
//                                         'Reset Password',
//                                       ),
//                                     ],
//                                   ),
//                           ),
//                         );
//                       },
//                     ),

//                     const SizedBox(height: 14),

//                     // Back to login link
//                     Center(
//                       child: TextButton(
//                         onPressed: () => context.go('/login'),
//                         child: RichText(
//                           text: TextSpan(
//                             children: [
//                               TextSpan(
//                                 text: 'Remember your password? ',
//                                 style: theme.textTheme.bodyMedium?.copyWith(
//                                   color: theme.colorScheme.onSurface
//                                       .withValues(alpha: 0.7),
//                                 ),
//                               ),
//                               TextSpan(
//                                 text: 'Sign In',
//                                 style: theme.textTheme.bodyMedium?.copyWith(
//                                   color: theme.colorScheme.primary,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),

//                     const SizedBox(height: 32),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   List<Widget> _buildPasswordRequirements(ThemeData theme) {
//     final requirements = [
//       'At least 8 characters long',
//       'Contains uppercase and lowercase letters',
//       'Contains at least one number',
//       'Contains at least one special character',
//     ];

//     return requirements.map((requirement) {
//       return Padding(
//         padding: const EdgeInsets.only(bottom: 6),
//         child: Row(
//           children: [
//             Icon(
//               Icons.check_circle_outline,
//               size: 14,
//               color: Colors.amber.shade600,
//             ),
//             const SizedBox(width: 8),
//             Text(
//               requirement,
//               style: theme.textTheme.bodySmall?.copyWith(
//                 color: Colors.amber.shade700,
//               ),
//             ),
//           ],
//         ),
//       );
//     }).toList();
//   }

//   void _resetPassword() {
//     if (_formKey.currentState!.validate()) {
//       // Check if passwords match
//       if (_passwordController.text != _confirmPasswordController.text) {
//         SnackBars.showErrorSnackBar('Passwords do not match');
//         return;
//       }

//       // Check if OTP is entered
//       if (_otpController.text.length != 6) {
//         SnackBars.showErrorSnackBar('Please enter a valid verification code');
//         return;
//       }

//       // Reset password
//       context.read<AuthBloc>().add(
//             AuthEvent.resetPassword(
//               otpCode: _otpController.text,
//               newPassword: _passwordController.text,
//             ),
//           );
//     }
//   }
// }
