// flutter
import 'package:flutter/material.dart';
import 'package:great_talk/common/doubles.dart';
// common
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/common/routes.dart';
import 'package:great_talk/common/widgets.dart';
// packages
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
// components
import 'package:great_talk/views/components/circle_image.dart';

class PersonCards extends StatelessWidget {
  const PersonCards({Key? key,required this.persons}) : super(key: key);
  final List<types.User> persons;
  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: persons.length,
      itemBuilder: ((context, index) {
        final person = persons[index];
        final String name = getName(person);
        
        return Padding(
          padding: EdgeInsets.symmetric(vertical: defaultPadding(context) ),
          child: ListTile(
            leading: CircleImage(person: person),
            title: boldText(name),
            onTap: () => toChatPage(context: context,person: person),
          ),
        );
      })
    );
  }
}