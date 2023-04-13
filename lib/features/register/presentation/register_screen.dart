import 'package:achat/features/chat/presentation/chats_screen.dart';
import 'package:achat/features/register/presentation/views/register_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/Widgets.dart';
import '../../../cubit/cubit.dart';
import '../../../cubit/states.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {
        if (state is CreateUserSuccessState) {
          SocialCubit.get(context).getAllUsers();
          NavigateTo(context, const ChatsScreen());
        }
      },
      builder: (context, state) {
        return const SafeArea(
          child: Scaffold(
            body: RegisterScreenBody(),
          ),
        );
      },
    );
  }
}
