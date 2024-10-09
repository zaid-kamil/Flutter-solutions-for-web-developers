import 'package:flutter/material.dart';

class TopSlider extends StatelessWidget {
  const TopSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: double.infinity,
      child: Expanded(
        child: Scrollbar(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [],
          ),
        ),
      ),
    );
  }
}
