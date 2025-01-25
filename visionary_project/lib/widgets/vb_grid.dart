// lib/widgets/vb_grid.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visionary_project/providers/vision_provider.dart';
import 'package:visionary_project/widgets/vb_card.dart';
import 'package:visionary_project/widgets/vb_form.dart';

class VisionGrid extends ConsumerWidget {
  const VisionGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visionItemsAsyncValue = ref.watch(visionItemsProvider);
    final visionItemsNotifier = ref.read(visionItemsNotifierProvider.notifier);

    return visionItemsAsyncValue.when(
      // check state and data to return the appropriate widget
      data: (visionItems) {
        if (visionItems.isEmpty) {
          return const Center(child: Text('No items found'));
        } else {
          return GridView.builder(
            padding: const EdgeInsets.all(30),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 600,
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
            ),
            itemCount: visionItems.length,
            itemBuilder: (context, index) {
              final visionItem = visionItems[index];
              return VisionItemCard(
                visionItem: visionItem,
                onEdit: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => AddItemForm(
                    initialImageUrl: visionItem.imageUrl,
                    initialItemText: visionItem.itemText,
                    onSubmit: (itemText, imageUrl) async {
                      Navigator.pop(context);
                      await visionItemsNotifier.addOrUpdateItem(
                        itemText,
                        imageUrl,
                        visionItem,
                      );
                    },
                  ),
                ),
                onDelete: () async => await visionItemsNotifier.deleteItem(
                  visionItem.id,
                ),
              );
            },
          );
        }
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text('Error: $error')),
    );
  }
}
