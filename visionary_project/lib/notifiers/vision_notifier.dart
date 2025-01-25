// lib/notifiers/vision_notifier.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visionary_project/models/vision_item.dart';
import 'package:visionary_project/services/vision_board_service.dart';

class VisionItemsNotifier extends StateNotifier<List<VisionItem>> {
  final VisionBoardService visionBoardService;

  VisionItemsNotifier(this.visionBoardService) : super([]) {
    _loadVisionItems();
  }

  Future<void> _loadVisionItems() async {
    final visionItems = await visionBoardService.visionItemsStream.first;
    state = visionItems;
  }

  Future<void> addOrUpdateItem(
      String itemText, String imageUrl, VisionItem? visionItem) async {
    if (visionItem == null) {
      await visionBoardService.addVisionItem(itemText, imageUrl);
    } else {
      await visionBoardService.updateVisionItem(
          visionItem.id, itemText, imageUrl);
    }
    _loadVisionItems();
  }

  Future<void> deleteItem(String id) async {
    await visionBoardService.deleteVisionItem(id);
    state = state.where((item) => item.id != id).toList();
  }
}
