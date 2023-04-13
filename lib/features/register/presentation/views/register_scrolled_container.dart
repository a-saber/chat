import 'package:achat/core/utils/constance.dart';
import 'package:achat/features/register/presentation/views/have_account_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/Widgets.dart';
import '../../../../cubit/cubit.dart';
import '../../../../cubit/states.dart';

class RegisterScrolledContainer extends StatelessWidget {
  RegisterScrolledContainer({Key? key, required this.state}) : super(key: key);
  final SocialStates state;
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var phoneController = TextEditingController();
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Expanded(
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60))),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 45,
                      ),
                      Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: defaultFromField(
                              controller: nameController,
                              type: TextInputType.name,
                              hintText: "Name",
                              prefix: Icons.person,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: defaultFromField(
                              type: TextInputType.emailAddress,
                              controller: emailController,
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
                            prefix: Icons.lock,
                            onSubmit: (value) {},
                            isPassword: isPassword,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: defaultFromField(
                              controller: phoneController,
                              type: TextInputType.phone,
                              prefix: Icons.phone,
                              hintText: "New Phone",
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      state is! SocialLoadingState
                          ? buildInkWell(context)
                          : const Center(
                              child: CircularProgressIndicator(),
                            ),
                      const SizedBox(
                        height: 10,
                      ),
                      const HaveAccountRowReg(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  InkWell buildInkWell(BuildContext context) {
    return InkWell(
      onTap: () {
        if (formKey.currentState != null && formKey.currentState!.validate()) {
          SocialCubit.get(context).userRegister(
            image: SocialCubit.get(context).userImage!,
            name: nameController.text,
            email: emailController.text,
            password: passwordController.text,
            phone: phoneController.text,
          );
        }
      },
      child: Container(
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 50),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: defaultColor),
        child: const Center(
          child: Text(
            "Register",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
