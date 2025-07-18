import 'package:azkarapp/core/models/azkar.dart' as azkar_entity;
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class AzkarList extends StatelessWidget {
  final List<azkar_entity.Content> azkarList;
  final List<int> counts;
  final bool showCounter;
  final int? highlightedIndex;
  final ItemScrollController scrollController;
  final void Function(int) onCount;

  const AzkarList({
    super.key,
    required this.azkarList,
    required this.counts,
    required this.showCounter,
    required this.highlightedIndex,
    required this.scrollController,
    required this.onCount,
  });

  @override
  Widget build(BuildContext context) {
    return ScrollablePositionedList.builder(
      itemCount: azkarList.length,
      itemScrollController: scrollController,
      itemBuilder: (BuildContext context, int index) {
        final isCompleted =
            showCounter && counts.isNotEmpty && counts[index] == 0;
        final isHighlighted = index == highlightedIndex;
        final item = azkarList[index];
        return Card(
          elevation: isHighlighted ? 8.0 : 0.7,
          color: isHighlighted
              ? Colors.yellow.withAlpha(128)
              : isCompleted
                  ? const Color(0xffe5b620).withAlpha(150)
                  : const Color(0xff2c2c2c),
          child: ListTile(
            onTap: () => onCount(index),
            title: Text(
              item.zekr ?? '',
              style: const TextStyle(color: Colors.white, fontSize: 19),
            ),
            subtitle: (item.bless != null && item.bless!.isNotEmpty)
                ? Text(
                    item.bless!,
                    style: const TextStyle(color: Color(0xffe5b620)),
                  )
                : null,
            leading: showCounter
                ? CircleAvatar(
                    radius: 20,
                    backgroundColor: const Color(0xffe5b620),
                    child: Text(
                      counts.isNotEmpty ? counts[index].toString() : '0',
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  )
                : null,
          ),
        );
      },
    );
  }
}
