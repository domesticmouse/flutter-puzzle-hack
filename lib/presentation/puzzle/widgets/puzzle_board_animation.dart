import 'package:flutter/material.dart';
import 'package:flutter_puzzle_hack/presentation/animations/utils/animations_manager.dart';

class PuzzleBoardAnimation extends StatefulWidget {
  final Widget child;

  const PuzzleBoardAnimation({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  _PuzzleBoardAnimationState createState() => _PuzzleBoardAnimationState();
}

class _PuzzleBoardAnimationState extends State<PuzzleBoardAnimation> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _scale;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: AnimationsManager.puzzleBoard.duration,
    )..forward();

    _scale = AnimationsManager.puzzleBoard.tween.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: AnimationsManager.puzzleBoard.curve,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scale,
      child: widget.child,
    );
  }
}
