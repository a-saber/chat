import 'package:flutter/material.dart';

import '../../../../core/utils/Widgets.dart';
import '../../../../core/utils/constance.dart';
import '../../../login/presentation/login_screen.dart';

class HaveAccountRowReg extends StatelessWidget {
  const HaveAccountRowReg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Already have an account ?',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
        ),
        TextButton(
            onPressed: () {
              NavigateTo(context, const SocialLoginScreen());
            },
            child: Text(
              'Login Now',
              style: TextStyle(fontSize: 13.0, color: defaultColor),
            ))
      ],
    );
  }
}
