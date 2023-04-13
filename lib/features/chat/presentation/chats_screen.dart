import 'package:achat/features/chat/presentation/views/chat_body_condition_true.dart';
import 'package:achat/features/chat/presentation/views/chat_body_when_condition_false.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/cubit.dart';
import '../../../cubit/states.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              body: SocialCubit.get(context).users.isNotEmpty
                  ? const ChatBodyConditionTrue()
                  : const ChatBodyConditionFalse(),
            ),
          );
        },
        listener: (context, state) {});
  }
}
