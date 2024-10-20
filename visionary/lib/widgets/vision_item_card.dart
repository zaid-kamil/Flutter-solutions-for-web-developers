// lib/widgets/vision_item_card.dart

import 'package:flutter/material.dart';
import 'package:visionary/models/vision_item.dart';
import 'package:visionary/utils/constants.dart';

class VisionItemCard extends StatelessWidget {
  final VisionItem visionItem;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const VisionItemCard({
    super.key,
    required this.visionItem,
    required this.onEdit,
    required this.onDelete,
  });

  String formatDate(DateTime date) {
    return '${date.day}-${date.month}-${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4,
        margin: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(8)),
                child: FadeInImage.assetNetwork(
                  placeholder: Constants.placeholderImage,
                  image: visionItem.imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 100,
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      Constants.placeholderImage,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 100,
                    );
                  },
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Added on: ${formatDate(visionItem.timestamp)}",
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      visionItem.itemText,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlinedButton(
                          onPressed: onEdit,
                          child: const Text(Constants.editVisionItem),
                        ),
                        IconButton(
                          onPressed: onDelete,
                          icon: const Icon(Icons.delete),
                          tooltip: Constants.deleteVisionItem,
                          color: Colors.red,
                        )
                      ],
                    ),
                  ],
                ))
          ],
        ));
  }
}
