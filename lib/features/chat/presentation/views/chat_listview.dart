import 'package:achat/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/constance.dart';
import '../../../../cubit/cubit.dart';
import '../../data/models/message_model.dart';
import 'file_item.dart';
import 'image_item.dart';
import 'message_item.dart';

class ChatListView extends StatefulWidget {
  const ChatListView({Key? key, required this.onPressed}) : super(key: key);
  final void Function()? onPressed;

  @override
  State<ChatListView> createState() => _ChatListViewState();
}

class _ChatListViewState extends State<ChatListView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return InkWell(
          onTap: widget.onPressed,
          child: ListView.separated(
            itemBuilder: (context, index) {
              var message = SocialCubit.get(context).messages[index];
              if (SocialCubit.get(context).userModel!.uId == message.senderId) {
                if (message.fileName!.isEmpty) {
                  return buildMyMesItem(message);
                } else if (message.fileType == 'pdf'
                    // ||message.fileType == 'docx' ||
                    // message.fileType == 'pptx' ||
                    // message.fileType == 'txt' ||
                    // message.fileType == 'ppt' ||
                    // message.fileType == 'mp4' ||
                    // message.fileType == 'mp3' ||
                    // message.fileType == 'doc'
                    ) {
                  return buildMyFileItem(message);
                } else if (message.image!.isNotEmpty) {
                  return buildMyImageItem(message);
                }
              } else if (SocialCubit.get(context).userModel!.uId !=
                  message.senderId) {
                if (message.text != "") {
                  return buildReceiverMesItem(message);
                } else if (message.text == "" && message.fileType == 'pdf'
                    // || message.fileType == 'docx' ||
                    //  message.fileType == 'pptx' ||
                    //  message.fileType == 'txt' ||
                    //  message.fileType == 'ppt' ||
                    //  message.fileType == 'mp4' ||
                    //  message.fileType == 'doc'
                    ) {
                  return buildReceiverFileItem(message);
                } else if (message.image != null) {
                  return buildReceiverImageItem(message);
                }
              }
              return Container();
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 15.0,
              );
            },
            itemCount: SocialCubit.get(context).messages.length,
          ),
        );
      },
    );
  }

  Widget buildMyMesItem(MessageModel model) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: MessageItem(
        model: model,
        color: defaultColor,
        textColor: Colors.white,
      ),
    );
  }

  Align buildReceiverMesItem(MessageModel model) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: MessageItem(
        model: model,
        color: Colors.grey[300]!,
        textColor: defaultColor,
      ),
    );
  }

  Widget buildMyFileItem(MessageModel model) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: FileItem(model: model, color: defaultColor),
    );
  }

  Align buildReceiverFileItem(MessageModel model) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: FileItem(model: model, color: Colors.grey[300]!),
    );
  }

  Widget buildMyImageItem(MessageModel model) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: ImageItem(model: model, color: defaultColor, isResever: false),
    );
  }

  Align buildReceiverImageItem(MessageModel model) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: ImageItem(model: model, color: Colors.grey[300]!, isResever: true),
    );
  }
}
