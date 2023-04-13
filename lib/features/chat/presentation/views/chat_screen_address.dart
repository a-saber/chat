import 'package:achat/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/Widgets.dart';
import '../../../../cubit/cubit.dart';
import '../../../register/data/models/user_model.dart';
import '../chat_detils_screen.dart';

class ChatScreenAddress extends StatelessWidget {
  const ChatScreenAddress({Key? key, required this.model}) : super(key: key);
  final UserModel model;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return InkWell(
          onTap: () {
            NavigateTo(
                context,
                ChatDetailsScreen(
                  model: model,
                ));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Material(
              color: Colors.transparent,
              elevation: 10,
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.grey[200]),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(model.image!),
                      radius: 25.0,
                    ),
                    const SizedBox(width: 20.0),
                    Text(model.name!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
