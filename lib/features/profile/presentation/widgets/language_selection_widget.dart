import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chhoto_khabar/shared/language/domain/model/language_model.dart';
import 'package:chhoto_khabar/shared/language/presentation/language_bloc/language_bloc.dart';

class LanguageSelectionWidget extends StatelessWidget {
  const LanguageSelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, languageState) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFF2A2A2A),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.grey.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Language',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ...Language.values.map((language) {
                final isSelected = languageState.selectedLanguage == language;
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () {
                        context.read<LanguageBloc>().add(
                          ChangeLanguage(selectedLanguage: language),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 16,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: isSelected 
                            ? const Color(0xFF4A9B8C).withOpacity(0.2)
                            : Colors.transparent,
                          border: isSelected
                            ? Border.all(
                                color: const Color(0xFF4A9B8C),
                                width: 1,
                              )
                            : null,
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: isSelected 
                                    ? const Color(0xFF4A9B8C)
                                    : Colors.grey,
                                  width: 2,
                                ),
                              ),
                              child: isSelected
                                ? Center(
                                    child: Container(
                                      width: 12,
                                      height: 12,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFF4A9B8C),
                                      ),
                                    ),
                                  )
                                : null,
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    language.text,
                                    style: TextStyle(
                                      color: isSelected 
                                        ? const Color(0xFF4A9B8C)
                                        : Colors.white,
                                      fontSize: 16,
                                      fontWeight: isSelected 
                                        ? FontWeight.w600
                                        : FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    '${language.value.languageCode.toUpperCase()} - ${language.value.countryCode}',
                                    style: TextStyle(
                                      color: Colors.grey.withOpacity(0.7),
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (isSelected)
                              const Icon(
                                Icons.check_circle,
                                color: Color(0xFF4A9B8C),
                                size: 20,
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}
