import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 35,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(title,
            style: Theme.of(context)
                .textTheme
                .displayMedium
                ?.copyWith(color: Colors.black)),
      ),
    );
  }
}
