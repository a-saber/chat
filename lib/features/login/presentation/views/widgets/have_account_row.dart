import 'package:flutter/material.dart';

import '../../../../../core/utils/Widgets.dart';
import '../../../../../core/utils/constance.dart';
import '../../../../register/presentation/register_screen.dart';

class HaveAccountRowLogin extends StatelessWidget {
  const HaveAccountRowLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Don\'t have an account ?',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
        ),
        TextButton(
            onPressed: () {
              NavigateTo(context, RegisterScreen());
            },
            child: Text(
              'Register Now',
              style: TextStyle(fontSize: 16.0, color: defaultColor),
            ))
      ],
    );
  }
}
