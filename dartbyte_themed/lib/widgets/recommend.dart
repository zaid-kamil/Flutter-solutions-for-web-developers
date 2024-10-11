import 'dart:math';

import 'package:flutter/material.dart';

class RecommendedNews extends StatelessWidget {
  const RecommendedNews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: List.generate(4, (index) {
          var views = (index + 1) * Random().nextInt(1000);
          return Expanded(
            child: Card(
              color: Theme.of(context).cardColor,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              elevation: 5,
              margin: const EdgeInsets.all(4),
              child: Column(
                children: [
                  Image.network(
                    "https://picsum.photos/id/${index + 10}/500/500",
                    fit: BoxFit.fill,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'Dartbyte #${index + 1}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text('Views: $views'),
                        ],
                      )),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
