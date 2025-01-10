import 'package:flutter/material.dart';

class ReviewWidget extends StatefulWidget {
  final String content;

  const ReviewWidget({super.key, required this.content});

  @override
  State<ReviewWidget> createState() => _ReviewWidgetState();
}

class _ReviewWidgetState extends State<ReviewWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    const int maxLines = 3;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.content,
          style: const TextStyle(fontSize: 14),
          maxLines: isExpanded ? null : maxLines,
          overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
        ),

        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Text(
            isExpanded ? 'Show Less' : 'Show More',
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
