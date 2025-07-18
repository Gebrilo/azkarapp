import 'package:azkarapp/core/models/azkar.dart' as azkar_entity;
import 'package:azkarapp/features/azkar/widgets/azkar_list.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class AzkarPage extends StatefulWidget {
  final String title;
  final String jsonFile;
  final int? highlightedIndex;
  final bool showCounter;

  const AzkarPage({
    super.key,
    required this.title,
    required this.jsonFile,
    this.highlightedIndex,
    this.showCounter = false,
  });

  @override
  State<AzkarPage> createState() => _AzkarPageState();
}

class _AzkarPageState extends State<AzkarPage> {
  List<azkar_entity.Content> _azkarList = [];
  List<int> _counts = [];
  bool _isLoading = true;
  final ItemScrollController _scrollController = ItemScrollController();

  @override
  void initState() {
    super.initState();
    _loadAzkar();
  }

  Future<void> _loadAzkar() async {
    try {
      final jsonString = await DefaultAssetBundle.of(context)
          .loadString('assets/json/${widget.jsonFile}.json');
      if (mounted) {
        final azkarList = azkar_entity.parseAzkarContent(jsonString);
        setState(() {
          _azkarList = azkarList;
          if (widget.showCounter) {
            _counts = _azkarList
                .map((azkar) => int.tryParse(azkar.count ?? '1') ?? 1)
                .toList();
          }
          _isLoading = false;
        });

        if (widget.highlightedIndex != null && _azkarList.isNotEmpty) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _scrollToIndex(widget.highlightedIndex!);
          });
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _scrollToIndex(int index) {
    _scrollController.scrollTo(
      index: index,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
      alignment: 0.5,
    );
  }

  void _handleCount(int index) {
    if (widget.showCounter) {
      setState(() {
        if (_counts.isNotEmpty && _counts[index] > 0) {
          _counts[index]--;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            image: const DecorationImage(
              image: AssetImage("assets/images/d_ground.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _azkarList.isNotEmpty
                    ? AzkarList(
                        azkarList: _azkarList,
                        counts: _counts,
                        showCounter: widget.showCounter,
                        highlightedIndex: widget.highlightedIndex,
                        scrollController: _scrollController,
                        onCount: _handleCount,
                      )
                    : const Center(child: Text("No data available.")),
          ),
        ),
      ),
    );
  }
}
