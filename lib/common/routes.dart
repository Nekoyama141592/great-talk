// flutter
import 'package:flutter/material.dart';
// views
import 'package:great_talk/views/chat_page.dart';

void toChatPage({ required BuildContext context,required dynamic person }) => Navigator.push(context, MaterialPageRoute(builder: ((context) => ChatPage(person: person,)) ));