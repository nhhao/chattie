class UserModel {
  const UserModel(
      {required this.uid,
      required this.username,
      this.isOnline = true,
      this.avatarUri = defaultAvatarUri,
      this.displayName = ''});

  final String uid;
  final String username;
  final String displayName;
  final String avatarUri;
  final bool isOnline;
  static const String defaultAvatarUri =
      'https://firebasestorage.googleapis.com/v0/b/kaos-chattie.appspot.com/o/default%2Fdefault_avatar.png?alt=media&token=1066c847-73e0-41f0-bc02-c98441add03d';

  Map<String, dynamic> userInfo() {
    return {
      'uid': uid,
      'username': username,
      'display_name': displayName,
      'avatar_uri': avatarUri,
      'is_online': isOnline,
    };
  }
}
