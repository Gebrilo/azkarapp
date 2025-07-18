import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:azkarapp/core/models/names.dart' as names_entity;

class NameOfAlah extends StatefulWidget {
  const NameOfAlah({super.key, this.highlightedIndex});

  final int? highlightedIndex;

  @override
  _NameOfAlahState createState() => _NameOfAlahState();
}

class _NameOfAlahState extends State<NameOfAlah> {
  List<names_entity.Name> _names = [];
  bool _isLoading = true;
  final ItemScrollController _scrollController = ItemScrollController();

  @override
  void initState() {
    super.initState();
    _loadNames();
  }

  Future<void> _loadNames() async {
    try {
      final jsonString = await DefaultAssetBundle.of(context)
          .loadString('assets/json/name_of_alah.json');
      if (mounted) {
        final namesData = names_entity.parseNames(jsonString);
        setState(() {
          _names = namesData;
          _isLoading = false;
        });

        if (widget.highlightedIndex != null) {
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("أسماء الله الحسنى"),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            image: const DecorationImage(
              image: AssetImage("assets/images/a_ground.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _names.isNotEmpty
                    ? ScrollablePositionedList.builder(
                        itemCount: _names.length,
                        itemScrollController: _scrollController,
                        itemBuilder: (BuildContext context, int index) {
                          bool isHighlighted = index == widget.highlightedIndex;
                          final name = _names[index];
                          return Card(
                            elevation: isHighlighted ? 8.0 : 0.7,
                            color: isHighlighted
                                ? Colors.yellow.withAlpha(128)
                                : const Color(0xff2c2c2c),
                            child: Column(
                              textDirection: TextDirection.rtl,
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    name.name ?? '',
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        fontSize: 29),
                                  ),
                                ),
                                ListTile(
                                  title: Text(
                                    name.transliteration ?? '',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 21),
                                  ),
                                  subtitle: Text(
                                    name.meaning ?? '',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  leading: CircleAvatar(
                                    backgroundColor: Theme.of(context)
                                        .colorScheme
                                        .secondary,
                                    child: Text(
                                      name.number.toString(),
                                      style: TextStyle(
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      )
                    : const Center(child: Text("No data available.")),
          ),
        ),
      ),
    );
  }
}
