import 'package:get/get.dart';
import 'package:great_talk/my_app.dart';
import 'package:great_talk/views/realtime_res_page/realtime_res_page.dart';
import 'package:great_talk/views/user_profile_page.dart';

final getPages = [
  GetPage(name: "/", page: () => const MyApp()),
  GetPage(
    name: "/chat/:uid",
    page: () => const RealtimeResPage(),
  ),
  GetPage(name: "/profile/:uid", page: () => const UserProfilePage())
];
