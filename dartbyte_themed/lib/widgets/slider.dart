import 'package:flutter/material.dart';

import 'news_card.dart';

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
            children: const [
              ByteNewsCard("Dart collections", "Noor ul Aman", 1),
              ByteNewsCard("Web is Amazing", "Zaid Kamil", 2),
              ByteNewsCard("Responsive Design", "Amna Ghazal", 3),
              ByteNewsCard("List of Flutter Widgets", "Bharvi Sharma", 4),
              ByteNewsCard("Learn Dart", "Akbar Ahmad", 5),
              ByteNewsCard("Learn Dart Collections", "Adeeba Ahmad", 6),
            ],
          ),
        ),
      ),
    );
  }
}
