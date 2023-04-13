import 'package:achat/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/constance.dart';
import '../../../../cubit/cubit.dart';

class RegisterUserImage extends StatelessWidget {
  const RegisterUserImage({Key? key, required this.onpressed})
      : super(key: key);
  final Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 65.0,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              child: CircleAvatar(
                radius: 60.0,
                backgroundImage: SocialCubit.get(context).registerImage == null
                    ? const NetworkImage(
                        "https://tse2.mm.bing.net/th?id=OIP.cSPj7LvJYHZOnzdIyFok2gHaHT&pid=Api&P=0")
                    : FileImage(SocialCubit.get(context).registerImage!)
                        as ImageProvider,
              ),
            ),
            IconButton(
                onPressed: onpressed,
                icon: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20.0,
                  child: Icon(
                    Icons.camera,
                    color: defaultColor,
                    size: 18.0,
                  ),
                )),
          ],
        );
      },
    );
  }
}
