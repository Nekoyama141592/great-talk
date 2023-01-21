// flutter
import 'package:flutter/material.dart';
import 'package:great_talk/api/search_api.dart';
import 'package:great_talk/common/colors.dart';
import 'package:great_talk/common/doubles.dart';
import 'package:great_talk/common/others.dart';
// common
import 'package:great_talk/common/persons.dart';
import 'package:great_talk/common/strings.dart';
// packages
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:great_talk/common/widgets.dart';
import 'package:great_talk/flavors.dart';
import 'package:great_talk/views/components/person_cards.dart';
import 'package:great_talk/views/components/search_screen.dart';

class PersonsPage extends HookWidget {
  const PersonsPage({Key? key}) : super(key: key);
  @override
  Widget build(context) {
    final results = useState(fullPersons);
    final isSearching = useState(false);
    return Scaffold(
      appBar: AppBar(
        title: boldText(F.title),
        shape: appBarShape(context)
      ),
      floatingActionButton:
      FloatingActionButton(
        onPressed: () {
          isSearching.value = !isSearching.value;
          results.value = fullPersons;
        },
        backgroundColor: kPrimaryColor,
        child: isSearching.value ? const Icon(Icons.search_off) : const Icon(Icons.search),
      ),
      body: isSearching.value ?
      SearchScreen(
        results: results,
        onQueryChanged: (query) {
          results.value = SearchApi.search(results, query);
        } ,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: defaultPadding(context)*7),
          child: PersonCards(persons: results.value,),
        ),
      ) : const PersonCards(persons: fullPersons)
    );
  }
}