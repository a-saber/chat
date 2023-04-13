import 'dart:io';

import 'package:achat/cubit/states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../core/cache_helper.dart';
import '../core/utils/constance.dart';
import '../features/chat/data/models/message_model.dart';
import '../features/register/data/models/user_model.dart';

class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(SocialInitialState());

  static SocialCubit get(context) => BlocProvider.of(context);

//LOGIN

  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String image,
  }) {
    emit(SocialLoadingState());
    print("here lodingggggggggggggggg");
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      userCreate(
        uId: value.user!.uid,
        email: email,
        phone: phone,
        name: name,
        image: image,
      );
      emit(SocialSuccessState());
      print("succcccccccccccccccesssssssssssss");
    }).catchError((error) {
      emit(SocialErrorState(error));
      print("erroooooooooooooooooor ============== ${error.toString()}");
    });
  }

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      await CacheHelper.removeData(key: 'uid');
      uid = value.user!.uid;
      await CacheHelper.saveData(key: 'uid', value: value.user!.uid);
      await getUser();
      print("hereeeeeeeeeeeeeeeeeeeeeeeee");
      print(value.user!.uid);
      emit(SuccessState(value.user!.uid));
    }).catchError((error) {
      print("Login Error ${error.toString()}");
      emit(ErrorState(error.toString()));
    });
  }

  void userCreate({
    required String email,
    required String name,
    required String phone,
    required String uId,
    required String image,
  }) {
    UserModel model = UserModel(
        name: name, email: email, phone: phone, uId: uId, image: image);
    FirebaseFirestore.instance
        .collection("user")
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      CacheHelper.saveData(key: "uid", value: uId);
      print("******************User Model Here *******************");
      print(userModel);
      emit(CreateUserSuccessState());
    }).catchError((error) {
      print("Create User Error ${error.toString()}");
      emit(CreateUserErrorState(error));
    });
  }

  UserModel? userModel;

  Future getUser() async {
    emit(SocialGetUserLoadingState());
    FirebaseFirestore.instance
        .collection("user")
        .doc(uid)
        .get()
        .then((value) async {
      print("data****************");
      print(value.data().toString());
      userModel = UserModel.fromJson(value.data()!);
      await getAllUsers();
      emit(SocialGetUserSuccessState());
      print("data****************");
    }).catchError((error) {
      emit(SocialGetUserErrorState(error.toString()));
      print("****************get User error :- ${error.toString()}");
    });
  }

  List<UserModel> users = [];
  Future getAllUsers() async {
    users = [];
    emit(SocialGetAllUsersLoadingState());
    FirebaseFirestore.instance.collection("user").get().then((value) {
      value.docs.forEach((element) {
        if (element.data()['uid'] != userModel!.uId!) {
          users.add(UserModel.fromJson(element.data()));
        }
      });
      emit(SocialGeAllUsersSuccessState());
    }).catchError((error) {
      print("Get All Users Error:- ${error.toString()}");
      emit(SocialGetAllUsersErrorState(error.toString()));
    });
  }

  //IMAGE PICKER
  var picker = ImagePicker();
  File? documentFile;
  File? imageFile;
  late MessageModel f_model;
  //file picker
  File? registerImage;

  Future<void> getProfileImage() async {
    emit(ProfileImagePickedLoadingState());
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      registerImage = File(pickedFile.path);
      emit(ProfileImagePickedSuccessState());
      uploadRegisterImage();
    } else {
      emit(ProfileImagePickedErrorState());
      print("no image selected");
    }
  }

  String? userImage;
  void uploadRegisterImage() {
    emit(UserUpdateLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child("users/${Uri.file(registerImage!.path).pathSegments.last}")
        .putFile(registerImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        userImage = value;

        //emit(UploadProfileImageSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(UploadProfileImageErrorState());
      });
    }).catchError((error) {
      print(error.toString());
      emit(UploadProfileImageErrorState());
    });
  }

  Future getDocumentFile(
      {required String receiverId, required String dateTime}) async {
    final result = FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: [
          'pdf',
          'docx',
          'pptx',
          'txt',
          'ppt',
          'doc'
        ]).then((value) {
      documentFile = File(value!.files.first.path!);
      f_model = MessageModel(
          fileType: value.files.first.extension,
          fileSize: value.files.first.size.toString(),
          fileName: value.files.first.name,
          senderId: userModel!.uId,
          receiverId: receiverId,
          text: "",
          dateTime: dateTime);
      print("modellllllllllllllll");
      print(f_model.fileName);
    });
    if (result != null) {
      print("yes*********************");
      emit(DocumentFilePickedSuccessState());
    } else {
      emit(DocumentFilePickedErrorState());
      print("no document selected*********************");
    }
  }

  Future getImageFile(
      {required String receiverId, required String dateTime}) async {
    final result = await picker.pickImage(source: ImageSource.gallery);
    if (result != null) {
      imageFile = File(result.path);
      f_model = MessageModel(
          text: "",
          fileType: "",
          fileSize: "",
          fileName: result.name,
          senderId: userModel!.uId,
          receiverId: receiverId,
          dateTime: dateTime);
      print("modellllllllllllllll");
      print(f_model.fileName);
      print(result.name);
      emit(DocumentFilePickedSuccessState());
    } else {
      emit(DocumentFilePickedErrorState());
      print("no document selected");
    }
  }

  uploadDocumentFile(
      {required String name,
      required String size,
      required String type,
      required String dateTime,
      required String receverId}) {
    var ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child("files/${Uri.file(documentFile!.path).pathSegments.last}")
        .putFile(documentFile!);
    ref.then((value) {
      value.ref.getDownloadURL().then((value) {
        emit(UploadDocumentSuccessState());
        print("mooooooooooooooooodelllllllllllllllll");
        sendMessage(
            image: "",
            fileName: name,
            fileSize: size,
            text: "",
            fileUrl: value,
            fileType: type,
            dateTime: dateTime,
            receiverId: receverId);
        print(name);
      }).catchError((error) {
        print("not upllllllllllllllllllllllloded");
        print(error.toString());
        emit(UploadDocumentErrorState());
      });
    }).catchError((error) {
      print("not upllllllllllllllllllllllloded");
      print(error.toString());
      emit(UploadDocumentErrorState());
    });
  }

  uploadImageFile(
      {required String name,
      required String size,
      required String type,
      required String dateTime,
      required String receverId}) {
    var ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child("files/${Uri.file(imageFile!.path).pathSegments.last}")
        .putFile(imageFile!);
    ref.then((value) {
      value.ref.getDownloadURL().then((value) {
        emit(UploadImageSuccessState());
        print("mooooooooooooooooodelllllllllllllllll");
        sendMessage(
            image: value,
            fileUrl: value,
            fileName: name,
            fileSize: size,
            fileType: type,
            dateTime: dateTime,
            receiverId: receverId);
        print(name);
      }).catchError((error) {
        print("not upllllllllllllllllllllllloded");
        print(error.toString());
        emit(UploadImageErrorState());
      });
    }).catchError((error) {
      print("not upllllllllllllllllllllllloded");
      print(error.toString());
      emit(UploadImageErrorState());
    });
  }

  void sendMessage({
    required String receiverId,
    String? text,
    String? image,
    required String dateTime,
    String? fileName,
    String? fileSize,
    String? fileUrl,
    String? fileType,
  }) {
    MessageModel model = MessageModel(
      text: text ?? "",
      dateTime: dateTime,
      image: image,
      fileUrl: fileUrl,
      receiverId: receiverId,
      senderId: userModel!.uId,
      fileType: fileType ?? "",
      fileName: fileName ?? "",
      fileSize: fileSize ?? "0.0",
    );
    FirebaseFirestore.instance
        .collection("user")
        .doc(userModel!.uId)
        .collection("chats")
        .doc(receiverId)
        .collection("message")
        .add(model.toMap())
        .then((value) {
      emit(SendSuccessMesState());
    }).catchError((error) {
      print("send message error:- ${error.toString()}");
      emit(SendErrorMesState(error));
    });
    FirebaseFirestore.instance
        .collection("user")
        .doc(receiverId)
        .collection("chats")
        .doc(userModel!.uId)
        .collection("message")
        .add(model.toMap())
        .then((value) {
      emit(SendSuccessMesState());
    }).catchError((error) {
      print("send message error:- ${error.toString()}");
      emit(SendErrorMesState(error));
    });
  }

  List<MessageModel> messages = [];

  void getMessages({
    required String receiverId,
  }) {
    FirebaseFirestore.instance
        .collection("user")
        .doc(userModel!.uId)
        .collection("chats")
        .doc(receiverId)
        .collection("message")
        .orderBy("dateTime")
        .snapshots()
        .listen((event) {
      messages = [];
      event.docs.forEach((element) {
        messages.add(MessageModel.fromJson(element.data()));
      });
      emit(GetSuccessMesState());
    });
  }
}
