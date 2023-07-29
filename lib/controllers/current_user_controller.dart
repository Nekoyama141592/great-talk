import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:great_talk/model/firestore_user/firestore_user.dart';
import 'package:great_talk/model/tokens/following_token/following_token.dart';

class CurrentUserController extends GetxController {
  static CurrentUserController get to => Get.find<CurrentUserController>();
  final Rx<User?> currentUser = Rx(FirebaseAuth.instance.currentUser);
  final Rx<FirestoreUser?> firestoreUser = Rx(null);

  final followingTokens = <FollowingToken>[]; // Viewの変更には関与しないので観測しない.
  final followingUids = <String>[].obs;

  @override
  void onInit() async {
    if (currentUser.value == null) {
      final credential = await FirebaseAuth.instance.signInAnonymously();
      currentUser(credential.user);
    }
    super.onInit();
  }

  void addFollowingUid(FollowingToken followingToken) {
    followingTokens.add(followingToken);
    followingUids.add(followingToken.passiveUid);
    followingUids([...followingUids]);
  }

  void removeFollowingUid(FollowingToken followingToken) {
    followingTokens.remove(followingToken);
    followingUids.remove(followingToken.passiveUid);
    followingUids([...followingUids]);
  }

  String currentUid() => currentUser.value!.uid;

  bool isAnonymous() => currentUser.value!.isAnonymous;
  bool isNotLoggedIn() =>
      currentUser.value == null || currentUser.value!.isAnonymous;
}
