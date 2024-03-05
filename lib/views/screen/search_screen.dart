// flutter
import 'package:flutter/material.dart';
import 'package:great_talk/common/doubles.dart';
// packages
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen(
      {super.key,
      required this.hint,
      required this.onQueryChanged,
      required this.child});
  final String hint;
  final void Function(String)? onQueryChanged;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return FloatingSearchBar(
        hint: hint,
        onQueryChanged: onQueryChanged,
        clearQueryOnClose: true,
        body: IndexedStack(children: [
          FloatingSearchBarScrollNotifier(
              child: Padding(
            padding: EdgeInsets.only(top: searchScreenTopPadding(context)),
            child: child,
          ))
        ]),
        builder: (context, transition) => const SizedBox.shrink());
  }
}
