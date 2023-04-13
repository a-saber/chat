import 'package:flutter/material.dart';

import '../../../../cubit/cubit.dart';
import 'chat_screen_address.dart';

class ChatBodyConditionTrue extends StatelessWidget {
  const ChatBodyConditionTrue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
        Colors.blue[900]!,
        Colors.blue[800]!,
        Colors.blue[400]!,
      ])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 30.0, bottom: 20),
            child: Center(
              child: Text(
                "Chats",
                style: TextStyle(color: Colors.white, fontSize: 35),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 10, top: 40),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60))),
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: SocialCubit.get(context).users.length,
                itemBuilder: (BuildContext context, int index) =>
                    ChatScreenAddress(
                        model: SocialCubit.get(context).users[index]),
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
