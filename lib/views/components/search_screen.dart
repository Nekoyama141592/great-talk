// flutter
import 'package:flutter/material.dart';
// packages
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class SearchScreen extends StatelessWidget {
  const SearchScreen({
    Key? key,
    required this.results,
    required this.onQueryChanged,
    required this.child
  }) : super(key: key);
  final ValueNotifier<List<types.User>> results;
  final void Function(String)? onQueryChanged;
  final Widget child;
  @override 
  Widget build(BuildContext context) {
    return FloatingSearchBar(
      onQueryChanged: onQueryChanged,
      clearQueryOnClose: true,
      body: IndexedStack(
        children: [
          FloatingSearchBarScrollNotifier(
            child: child
          )
        ]
      ),
      builder: (context, transition) => const SizedBox.shrink()
    );
  }
}