import 'package:dartbyte/screens/dashboard/dashboard_screen_web.dart';
import 'package:flutter/material.dart';

class ByteNewsCard extends StatelessWidget {
  final News newsItem;

  const ByteNewsCard({super.key, required this.newsItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              newsItem.imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Icon(
                    Icons.error,
                    size: 150,
                    color: Colors.red,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  child: Row(
                    children: [
                      Text(
                        newsItem.category,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 12,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        newsItem.isPopular ? 'Popular' : '',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        newsItem.isRecommended ? 'Recommended' : '',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  newsItem.title.length > 35
                      ? '${newsItem.title.substring(0, 35)}...'
                      : newsItem.title,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 2),
                Text(
                  'by ${newsItem.author}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
