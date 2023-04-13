import 'package:achat/core/utils/constance.dart';
import 'package:achat/features/chat/presentation/chats_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/Widgets.dart';
import '../../../../../cubit/cubit.dart';
import '../../../../../cubit/states.dart';
import 'have_account_row.dart';

class LoginScrolledPart extends StatelessWidget {
  LoginScrolledPart({
    Key? key,
  }) : super(key: key);
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {
        if (state is ErrorState) {
          showToast(massage: state.error, state: ToastState.ERROR);
        } else if (state is SocialGeAllUsersSuccessState) {
          NavigateAndFinish(context, const ChatsScreen());
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 60,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: defaultFromField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          hintText: "Email address",
                          prefix: Icons.email_outlined,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      defaultFromField(
                        controller: passwordController,
                        type: TextInputType.visiblePassword,
                        hintText: "Password",
                        prefix: Icons.lock_outline,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                state is! LoadingState
                    ? buildLoginButton(context)
                    : const Center(child: CircularProgressIndicator()),
                const SizedBox(
                  height: 15,
                ),
                const HaveAccountRowLogin(),
              ],
            ),
          ),
        );
      },
    );
  }

  InkWell buildLoginButton(BuildContext context) {
    return InkWell(
      child: Container(
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 50),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: defaultColor),
        child: const Center(
          child: Text(
            "Login",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      onTap: () {
        if (formKey.currentState != null && formKey.currentState!.validate()) {
          SocialCubit.get(context).userLogin(
              email: emailController.text, password: passwordController.text);
        }
      },
    );
  }
}
