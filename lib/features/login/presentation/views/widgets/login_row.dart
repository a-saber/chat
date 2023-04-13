import 'package:flutter/material.dart';

import '../../../../../core/utils/Widgets.dart';
import '../../../../register/presentation/register_screen.dart';

class LoginRow extends StatelessWidget {
  const LoginRow({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Expanded(
          child: Text(
            'Don\'t have an account ?',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
          ),
        ),
        Expanded(
          child: TextButton(
              onPressed: () {
                NavigateTo(context, RegisterScreen());
              },
              child: const Text(
                'Register Now',
                style: TextStyle(fontSize: 10.0),
              )),
        )
      ],
    );
  }
}
