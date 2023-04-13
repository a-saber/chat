abstract class SocialStates {}

class SocialInitialState extends SocialStates {}

class SocialLoadingState extends SocialStates {}

class SocialSuccessState extends SocialStates {}

class SocialErrorState extends SocialStates {
  final String error;
  SocialErrorState(this.error);
}

class CreateUserSuccessState extends SocialStates {}

class CreateUserErrorState extends SocialStates {
  final String error;
  CreateUserErrorState(this.error);
}

class SocialChangePasswordVisibilityState extends SocialStates {}

class InitalState extends SocialStates {}

class LoadingState extends SocialStates {}

class SuccessState extends SocialStates {
  final String uid;

  SuccessState(this.uid);
}

class ErrorState extends SocialStates {
  final String error;

  ErrorState(this.error);
}

class socialChangePasswordState extends SocialStates {}

class SocialGetUserLoadingState extends SocialStates {}

class SocialGetUserSuccessState extends SocialStates {}

class SocialGetUserErrorState extends SocialStates {
  final String error;
  SocialGetUserErrorState(this.error);
}

//get posts
class SocialGetPostsLoadingState extends SocialStates {}

class SocialGePostsSuccessState extends SocialStates {}

class SocialGetPostsErrorState extends SocialStates {
  final String error;
  SocialGetPostsErrorState(this.error);
}

//get All users
class SocialGetAllUsersLoadingState extends SocialStates {}

class SocialGeAllUsersSuccessState extends SocialStates {}

class SocialGetAllUsersErrorState extends SocialStates {
  final String error;
  SocialGetAllUsersErrorState(this.error);
}

//like posts

class SocialLikePostsSuccessState extends SocialStates {}

class SocialLikePostsErrorState extends SocialStates {
  final String error;
  SocialLikePostsErrorState(this.error);
}
//comment posts

class SocialCommentPostsSuccessState extends SocialStates {}

class SocialCommentPostsErrorState extends SocialStates {
  final String error;
  SocialCommentPostsErrorState(this.error);
}

class ChangeBottomNavState extends SocialStates {}

class NewBottomNavPostState extends SocialStates {}

class ProfileImagePickedSuccessState extends SocialStates {}

class ProfileImagePickedLoadingState extends SocialStates {}

class ProfileImagePickedErrorState extends SocialStates {}

class RegisterImagePickedSuccessState extends SocialStates {}

class RegisterImagePickedErrorState extends SocialStates {}

class DocumentFilePickedSuccessState extends SocialStates {}

class DocumentFilePickedErrorState extends SocialStates {}

class ImageFilePickedSuccessState extends SocialStates {}

class ImageFilePickedErrorState extends SocialStates {}

class AudioFilePickedSuccessState extends SocialStates {}

class AudioFilePickedErrorState extends SocialStates {}

class VideoFilePickedSuccessState extends SocialStates {}

class VideoFilePickedErrorState extends SocialStates {}

class UploadDocumentSuccessState extends SocialStates {}

class UploadDocumentErrorState extends SocialStates {}

class UploadVideoSuccessState extends SocialStates {}

class UploadVideoErrorState extends SocialStates {}

class UploadAudioSuccessState extends SocialStates {}

class UploadAudioErrorState extends SocialStates {}

class UploadImageSuccessState extends SocialStates {}

class UploadImageErrorState extends SocialStates {}

class PostImagePickedSuccessState extends SocialStates {}

class PostImagePickedErrorState extends SocialStates {}

class CoverImagePickedSuccessState extends SocialStates {}

class CoverImagePickedErrorState extends SocialStates {}

class UploadProfileImageSuccessState extends SocialStates {}

class UploadProfileImageErrorState extends SocialStates {}

class UploadCoverImageSuccessState extends SocialStates {}

class UploadCoverImageErrorState extends SocialStates {}

class UserUpdateErrorState extends SocialStates {}

class UserUpdateLoadingState extends SocialStates {}

//create post
class UploadPostLoadingState extends SocialStates {}

class CreatePostSuccessState extends SocialStates {}

class UploadPostErrorState extends SocialStates {}

class CreatePostErrorState extends SocialStates {}

class RemovePostImageState extends SocialStates {}

//send message
class SendSuccessMesState extends SocialStates {}

class SendErrorMesState extends SocialStates {
  final error;

  SendErrorMesState(this.error);
}

//send documents
class SendDocSuccessMesState extends SocialStates {}

class SendDocErrorMesState extends SocialStates {
  final error;

  SendDocErrorMesState(this.error);
}

//get message
class GetSuccessMesState extends SocialStates {}

class GetDocSuccessMesState extends SocialStates {}
