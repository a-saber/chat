import 'package:achat/features/chat/presentation/views/chat_listview.dart';
import 'package:achat/features/chat/presentation/views/items_container.dart';
import 'package:achat/features/chat/presentation/views/send_message_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/styles/size.dart';
import '../../../core/utils/constance.dart';
import '../../../cubit/cubit.dart';
import '../../../cubit/states.dart';
import '../../register/data/models/user_model.dart';

class ChatDetailsScreen extends StatefulWidget {
  UserModel? model;

  ChatDetailsScreen({super.key, this.model});

  @override
  State<ChatDetailsScreen> createState() => _ChatDetailsScreenState();
}

class _ChatDetailsScreenState extends State<ChatDetailsScreen> {
  var mesController = TextEditingController();
  bool ispressed = false;

  bool isDocument = false;

  bool isImage = false;

  @override
  void initState() {
    mesController.text = "";
    super.initState();
  }

  @override
  void dispose() {
    mesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final String date1 = DateTime.now().toString();
    //String date = DateFormat('hh:mm a').format(DateTime.now()).toString();
    return Builder(
      builder: (BuildContext context) {
        SocialCubit.get(context).getMessages(receiverId: widget.model!.uId!);
        return BlocConsumer<SocialCubit, SocialStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  title: Text(
                    widget.model!.name!,
                    style: TextStyle(color: defaultColor),
                  ),
                  centerTitle: true,
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: defaultColor,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        child: CircleAvatar(
                          radius: 18,
                          backgroundImage: NetworkImage(widget.model!.image!),
                        ),
                      ),
                    )
                  ],
                ),
                body: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            ChatListView(
                              onPressed: () {
                                setState(() {
                                  ispressed = false;
                                });
                              },
                            ),
                            ispressed
                                ? ItemsContainer(
                                    imageOnPressed: () async {
                                      await SocialCubit.get(context)
                                          .getImageFile(
                                              receiverId: widget.model!.uId!,
                                              dateTime: date1);
                                      mesController.text =
                                          SocialCubit.get(context)
                                              .f_model
                                              .fileName!;
                                      setState(() {
                                        ispressed = false;
                                        isImage = true;
                                      });
                                    },
                                    date1: date1,
                                    model: widget.model!,
                                    mesController: mesController,
                                    documentOnPressed: () {
                                      SocialCubit.get(context)
                                          .getDocumentFile(
                                              receiverId: widget.model!.uId!,
                                              dateTime: date1)
                                          .then((value) {
                                        setState(() {
                                          ispressed = false;
                                          isDocument = true;
                                        });
                                      });
                                    },
                                  )
                                : const SizedBox()
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(
                                color: Colors.grey[300]!, width: 1.0)),
                        child: SendMessageTextField(
                          sendOnPressed: () {
                            if (isDocument) {
                              print(
                                  "herrrrrrrrrrrrrrrrrrrrrrrrrrrrrr wwwwwwwwwwwwww");
                              SocialCubit.get(context).uploadDocumentFile(
                                name:
                                    SocialCubit.get(context).f_model.fileName!,
                                size:
                                    SocialCubit.get(context).f_model.fileSize!,
                                type:
                                    SocialCubit.get(context).f_model.fileType!,
                                dateTime:
                                    SocialCubit.get(context).f_model.dateTime!,
                                receverId: SocialCubit.get(context)
                                    .f_model
                                    .receiverId!,
                              );
                              setState(() {
                                mesController.text = "";
                              });
                            } else if (isImage) {
                              print(SocialCubit.get(context).f_model.image);
                              print("object is image");
                              SocialCubit.get(context).uploadImageFile(
                                name:
                                    SocialCubit.get(context).f_model.fileName!,
                                size:
                                    SocialCubit.get(context).f_model.fileSize!,
                                type:
                                    SocialCubit.get(context).f_model.fileType!,
                                dateTime:
                                    SocialCubit.get(context).f_model.dateTime!,
                                receverId: SocialCubit.get(context)
                                    .f_model
                                    .receiverId!,
                              );
                              setState(() {
                                mesController.text = "";
                              });
                            } else {
                              print("mmmmmmmmmmmmmmmmmmmmmmm");
                              SocialCubit.get(context).sendMessage(
                                receiverId: widget.model!.uId!,
                                text: mesController.text,
                                dateTime: date1,
                                fileType: "",
                                fileSize: "",
                                fileName: "",
                              );
                              setState(() {
                                mesController.text = "";
                              });
                            }
                          },
                          date1: date1,
                          mesController: mesController,
                          model: widget.model!,
                          onPressed: () {
                            setState(() {
                              ispressed = true;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ));
          },
        );
      },
    );
  }
}
