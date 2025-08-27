import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class InputField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final VoidCallback? onTap;
  final bool readOnly;
  final bool enabled;
  final IconData? suffixIcon;
  final Widget? prefixIcon;
  final Widget? suffixWidget;
  final int? maxLines;
  final double? iconWeight;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final String? errorText;
  final Function()? onSuffixIconTap;
  final String? prefixText;
  final TextInputAction textInputAction;
  final Color? color;
  final double? size;
  final bool obscureText;
  final FocusNode? focusNode;
  final bool autofocus;

  const InputField({
    super.key,
    required this.controller,
    required this.hintText,
    this.isPassword = false,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.onTap,
    this.readOnly = false,
    this.enabled = true,
    this.prefixText,
    this.suffixIcon,
    this.suffixWidget,
    this.maxLines,
    this.iconWeight,
    this.inputFormatters,
    this.onChanged,
    this.onFieldSubmitted,
    this.errorText,
    this.onSuffixIconTap,
    this.textInputAction = TextInputAction.next,
    this.prefixIcon,
    this.color,
    this.size,
    this.obscureText = false,
    this.focusNode,
    this.autofocus = false,
  }) : assert(!isPassword || maxLines == null || maxLines == 1,
            'Obscured fields cannot be multiline.');

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late bool _isPasswordVisible;
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _isPasswordVisible = !widget.isPassword; // Start with password hidden if it's a password field
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    } else {
      _focusNode.removeListener(_onFocusChange);
    }
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
    
    // Add haptic feedback
    HapticFeedback.lightImpact();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    // Determine if field should be obscured
    final shouldObscure = widget.isPassword ? !_isPasswordVisible : widget.obscureText;
    
    // Determine border color based on state
    Color getBorderColor() {
      if (!widget.enabled) {
        return colorScheme.outline.withOpacity(0.2);
      }
      if (_isFocused) {
        return colorScheme.primary;
      }
      return colorScheme.outline.withOpacity(0.3);
    }
    
    // Determine fill color based on state
    Color getFillColor() {
      if (!widget.enabled) {
        return colorScheme.surfaceVariant.withOpacity(0.3);
      }
      if (_isFocused) {
        return colorScheme.surface;
      }
      return colorScheme.surface;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: widget.controller,
          focusNode: _focusNode,
          maxLines: widget.isPassword ? 1 : widget.maxLines,
          keyboardType: widget.keyboardType,
          obscuringCharacter: '•',
          obscureText: shouldObscure,
          enabled: widget.enabled,
          readOnly: widget.readOnly,
          autofocus: widget.autofocus,
          onChanged: widget.onChanged,
          onTap: widget.onTap,
          onFieldSubmitted: widget.onFieldSubmitted,
          textInputAction: widget.textInputAction,
          inputFormatters: widget.inputFormatters,
          
          style: theme.textTheme.bodyMedium?.copyWith(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            fontFamily: GoogleFonts.poppins().fontFamily,
            color: widget.enabled 
                ? colorScheme.onSurface 
                : colorScheme.onSurface.withOpacity(0.5),
          ),
          
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.outline.withOpacity(0.7),
              fontSize: 15,
              fontWeight: FontWeight.w400,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
            
            // Enhanced border styling with animation
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: getBorderColor(),
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: colorScheme.primary,
                width: 2,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: colorScheme.outline.withOpacity(0.2),
                width: 1,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: colorScheme.error,
                width: 1,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: colorScheme.error,
                width: 2,
              ),
            ),

            // Fill color with state-based changes
            filled: true,
            fillColor: getFillColor(),

            // Improved prefix handling
            prefixIcon: _buildPrefixWidget(context),
            prefixIconConstraints: const BoxConstraints(
              minWidth: 48,
              minHeight: 48,
            ),

            // Enhanced suffix icon handling
            suffixIcon: _buildSuffixWidget(context),
            suffixIconConstraints: const BoxConstraints(
              minWidth: 48,
              minHeight: 48,
            ),

            isDense: false,
            contentPadding: EdgeInsets.symmetric(
              horizontal: widget.prefixIcon != null || widget.prefixText != null ? 0 : 16,
              vertical: 16,
            ),
            
            // Error text styling
            errorText: widget.errorText,
            errorStyle: TextStyle(
              color: colorScheme.error,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
            errorMaxLines: 2,
          ),
          validator: widget.validator,
        ),
      ],
    );
  }

  // Enhanced prefix widget builder
  Widget? _buildPrefixWidget(BuildContext context) {
    if (widget.prefixIcon == null && widget.prefixText == null) {
      return null;
    }

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.only(left: 16, right: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon first
          if (widget.prefixIcon != null) ...[
            // If prefixIcon is already a widget, use it directly
            if (widget.prefixIcon is Icon)
              Icon(
                (widget.prefixIcon as Icon).icon,
                size: 20,
                color: widget.enabled 
                    ? (_isFocused ? colorScheme.primary : colorScheme.onSurface.withOpacity(0.6))
                    : colorScheme.onSurface.withOpacity(0.3),
              )
            else
              widget.prefixIcon!,
            if (widget.prefixText != null) const SizedBox(width: 8),
          ],
          // Then prefix text
          if (widget.prefixText != null)
            Container(
              padding: const EdgeInsets.only(right: 8),
              child: Text(
                widget.prefixText!,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: widget.enabled
                      ? colorScheme.onSurface.withOpacity(0.8)
                      : colorScheme.onSurface.withOpacity(0.4),
                ),
              ),
            ),
        ],
      ),
    );
  }

  // Enhanced suffix widget builder
  Widget? _buildSuffixWidget(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Password visibility toggle has priority
    if (widget.isPassword) {
      return Container(
        padding: const EdgeInsets.only(right: 12),
        child: IconButton(
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: Icon(
              _isPasswordVisible ? Iconsax.eye : Iconsax.eye_slash,
              key: ValueKey(_isPasswordVisible),
              size: 20,
              color: widget.enabled
                  ? (_isFocused ? colorScheme.primary : colorScheme.onSurface.withOpacity(0.6))
                  : colorScheme.onSurface.withOpacity(0.3),
            ),
          ),
          onPressed: widget.enabled ? _togglePasswordVisibility : null,
          tooltip: _isPasswordVisible ? 'Hide password' : 'Show password',
          splashRadius: 20,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(
            minWidth: 24,
            minHeight: 24,
          ),
        ),
      );
    }

    // Custom suffix widget
    if (widget.suffixWidget != null) {
      return Container(
        padding: const EdgeInsets.only(right: 12),
        child: widget.suffixWidget,
      );
    }

    // Suffix icon
    if (widget.suffixIcon != null) {
      return Container(
        padding: const EdgeInsets.only(right: 12),
        child: IconButton(
          icon: Icon(
            widget.suffixIcon,
            size: 20,
            color: widget.enabled
                ? (widget.color ?? (_isFocused ? colorScheme.primary : colorScheme.onSurface.withOpacity(0.6)))
                : colorScheme.onSurface.withOpacity(0.3),
          ),
          onPressed: widget.enabled ? widget.onSuffixIconTap : null,
          splashRadius: 20,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(
            minWidth: 24,
            minHeight: 24,
          ),
        ),
      );
    }
  
    return null;
  }
}