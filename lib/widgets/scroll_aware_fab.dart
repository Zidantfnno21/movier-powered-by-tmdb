import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ScrollAwareFab extends StatefulWidget {
  final ScrollController scrollController;

  const ScrollAwareFab({super.key, required this.scrollController});

  @override
  State<ScrollAwareFab> createState() => _ScrollAwareFabState();
}

class _ScrollAwareFabState extends State<ScrollAwareFab> {
  bool _isScrolling = false;
  bool _showFab = false;
  late final ValueNotifier<bool> _extendedNotifier;

  @override
  void initState() {
    super.initState();
    _extendedNotifier = ValueNotifier(false);
    widget.scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_handleScroll);
    _extendedNotifier.dispose();
    super.dispose();
  }

  void _handleScroll() {
    final position = widget.scrollController.position;
    final threshold = MediaQuery.of(context).size.height;

    if (position.pixels > threshold && !_showFab) {
      setState(() {
        _showFab = true;
      });
    } else if (position.pixels <= threshold && _showFab) {
      setState(() {
        _showFab = false;
      });
    }

    // Check if scrolling
    if (!_isScrolling) {
      setState(() {
        _isScrolling = true;
        _extendedNotifier.value = true; // Extend the FAB
      });
    }

    // Detect idle state
    Future.delayed(const Duration(milliseconds: 500), () {
      if (position.userScrollDirection == ScrollDirection.idle) {
        setState(() {
          _isScrolling = false;
          _extendedNotifier.value = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _showFab ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 300),
      child: _showFab
          ? ValueListenableBuilder<bool>(
              valueListenable: _extendedNotifier,
              builder: (context, isExtended, _) {
                return FloatingActionButton.extended(
                  backgroundColor: Theme.of(context).brightness == Brightness.light
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.secondary,
                  onPressed: () {
                    widget.scrollController.animateTo(
                      0.0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeOut,
                    );
                  },
                  isExtended: isExtended,
                  icon: const Icon(Icons.arrow_upward),
                  label: const Text('Scroll to Top'),
                );
              },
            )
          : const SizedBox.shrink(),
    );
  }
}
