import 'package:flutter/material.dart';

BoxDecoration get cardDecoration {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20),
    border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
    boxShadow: [
      BoxShadow(
        color: const Color(0xFF0F172A).withOpacity(0.04),
        blurRadius: 10,
        offset: const Offset(0, 4),
      ),
    ],
  );
}
