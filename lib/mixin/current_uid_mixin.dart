import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/infrastructure/firestore/firestore_queries.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

mixin CurrentUserMixin {
  String currentUid() => CurrentUserController.to.currentUid();
  DocRef currentUserRef() => FirestoreQueries.userDocRef(currentUid());
}
