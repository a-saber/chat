import 'package:achat/features/register/presentation/views/register_user_image.dart';
import 'package:flutter/material.dart';

import '../../../../cubit/cubit.dart';

class RegisterBodyAddress extends StatefulWidget {
  const RegisterBodyAddress({Key? key}) : super(key: key);

  @override
  State<RegisterBodyAddress> createState() => _RegisterBodyAddressState();
}

class _RegisterBodyAddressState extends State<RegisterBodyAddress> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Register",
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
            const SizedBox(
              height: 15,
            ),
            RegisterUserImage(
              onpressed: () {
                SocialCubit.get(context).getProfileImage();
              },
            )
          ],
        ),
      ),
    );
  }
}
