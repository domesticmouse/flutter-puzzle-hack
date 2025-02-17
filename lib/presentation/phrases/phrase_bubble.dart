import 'package:Dashtronaut/presentation/layout/phrase_bubble_layout.dart';
import 'package:Dashtronaut/presentation/layout/spacing.dart';
import 'package:Dashtronaut/presentation/styles/app_colors.dart';
import 'package:Dashtronaut/presentation/styles/app_text_styles.dart';
import 'package:Dashtronaut/providers/phrases_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhraseBubble extends StatelessWidget {
  final PhraseState state;

  const PhraseBubble({
    Key? key,
    required this.state,
  })  : assert(state != PhraseState.none),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          right: -12,
          top: -4,
          child: Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(width: 1, color: Colors.white),
            ),
          ),
        ),
        Positioned(
          right: -21,
          top: -8,
          child: Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(width: 1, color: AppColors.primary),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
              horizontal: Spacing.md, vertical: Spacing.sm),
          constraints: const BoxConstraints(
            maxWidth: 180,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(width: 1, color: AppColors.primary),
          ),
          child: Consumer<PhrasesProvider>(
            builder: (c, phrasesProvider, _) {
              String phrase = phrasesProvider.getPhrase(state);

              return Text(
                phrase,
                style: AppTextStyles.h2.copyWith(
                  color: AppColors.primary,
                  fontSize: phrase.length > 20 ? 16 : 20,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
