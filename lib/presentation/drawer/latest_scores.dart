import 'package:Dashtronaut/models/score.dart';
import 'package:Dashtronaut/presentation/drawer/latest_score_item.dart';
import 'package:Dashtronaut/presentation/layout/spacing.dart';
import 'package:Dashtronaut/presentation/styles/app_text_styles.dart';
import 'package:Dashtronaut/providers/puzzle_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LatestScores extends StatelessWidget {
  const LatestScores({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<PuzzleProvider, List<Score>>(
      selector: (c, puzzleProvider) => puzzleProvider.scores.reversed.toList(),
      builder: (c, List<Score> scores, child) => Container(
        padding: const EdgeInsets.symmetric(vertical: Spacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).padding.left == 0
                    ? Spacing.md
                    : MediaQuery.of(context).padding.left,
                right: Spacing.screenHPadding,
                bottom: Spacing.xs,
              ),
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: Colors.white.withOpacity(0.5), width: 0.5)),
              ),
              child: Text(
                'Latest Scores',
                style:
                    AppTextStyles.bodySm.copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            if (scores.isEmpty)
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).padding.left == 0
                      ? Spacing.md
                      : MediaQuery.of(context).padding.left,
                  right: Spacing.screenHPadding,
                  top: Spacing.xs,
                  bottom: Spacing.xs,
                ),
                child: const Text(
                    'Solve the puzzle to see your scores here! You can do it!'),
              ),
            ...List.generate(scores.length, (i) => LatestScoreItem(scores[i])),
          ],
        ),
      ),
    );
  }
}
