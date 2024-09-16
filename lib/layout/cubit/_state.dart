abstract class SocialStates {}

class SocialInitialState extends SocialStates {}
//===========================================================>
class SocialGetUserLoadingState extends SocialStates {}

class SocialGetUserSuccessState extends SocialStates {}

class SocialGetUserErrorState extends SocialStates {
  final String error;
  SocialGetUserErrorState(this.error);
}
//===========================================================>
class SocialChangeBottomNavState extends SocialStates {}
//===========================================================>
class SocialNewPostState extends SocialStates {}
//===========================================================>
class SocialProfileImagePickedSuccessState extends SocialStates {}
class SocialProfileImagePickedErrorState extends SocialStates {}
class SocialCoverImagePickedSuccessState extends SocialStates {}
class SocialCoverImagePickedErrorState extends SocialStates {}
//===========================================================>
class SocialUploadProfileImageLoadingState extends SocialStates {}
class SocialUploadProfileImageSuccessState extends SocialStates {}
class SocialUploadProfileImageErrorState extends SocialStates {}
class SocialUploadCoverImageLoadingState extends SocialStates {}
class SocialUploadCoverImageSuccessState extends SocialStates {}
class SocialUploadCoverImageErrorState extends SocialStates {}
//===========================================================>
class SocialUserUpdateLoadingState extends SocialStates {}
class SocialUserUpdateSuccessState extends SocialStates {
  // Unused
}
class SocialUserUpdateErrorState extends SocialStates {}
//===========================================================>
                   /* Create Post */
class SocialCreatePostLoadingState extends SocialStates {}
class SocialCreatePostSuccessState extends SocialStates {}
class SocialCreatePostErrorState extends SocialStates {}
//===========================================================>
class SocialPostImagePickedSuccessState extends SocialStates {}
class SocialPostImagePickedErrorState extends SocialStates {}
//===========================================================>
class SocialRemovePostImageState extends SocialStates {}
//===========================================================>
class SocialGetPostsLoadingState extends SocialStates {}

class SocialGetPostsSuccessState extends SocialStates {}

class SocialGetPostsErrorState extends SocialStates {
  final String error;
  SocialGetPostsErrorState(this.error);
}
//===========================================================>
class SocialGetLikesLoadingState extends SocialStates {}

class SocialGetLikesSuccessState extends SocialStates {}

class SocialGetLikesErrorState extends SocialStates {
  final String error;
  SocialGetLikesErrorState(this.error);
}
//===========================================================>
class SocialLikePostSuccessState extends SocialStates {}

class SocialLikePostErrorState extends SocialStates {
  final String error;
  SocialLikePostErrorState(this.error);
}
//===========================================================>
class SocialCommentPostSuccessState extends SocialStates {}

class SocialCommentPostErrorState extends SocialStates {
  final String error;
  SocialCommentPostErrorState(this.error);
}
//===========================================================>
                          /* Chats */
class SocialGetAllUsersLoadingState extends SocialStates {}

class SocialGetAllUsersSuccessState extends SocialStates {}

class SocialGetAllUsersErrorState extends SocialStates {
  final String error;
  SocialGetAllUsersErrorState(this.error);
}
//===========================================================>
                        /* Chats Details */
class SocialSendMessageSuccessState extends SocialStates {}

class SocialSendMessageErrorState extends SocialStates {}

class SocialGetMessagesSuccessState extends SocialStates {}

class SocialGetMessagesErrorState extends SocialStates {}
//===========================================================>
//===========================================================>
