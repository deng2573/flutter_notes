import 'package:flutter/material.dart';

import 'package:notes/core/widgets/widget_button.dart';

class Web3ListHeader extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback? onTap;

  const Web3ListHeader({
    Key? key,
    required this.title,
    required this.content,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
            ScaleTap(
              onPressed: onTap,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Text(
                      content,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Icon(
                      Icons.chevron_right_outlined,
                      color: Colors.blueAccent,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
