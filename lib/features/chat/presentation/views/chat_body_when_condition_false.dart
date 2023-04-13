import 'package:achat/cubit/cubit.dart';
import 'package:achat/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBodyConditionFalse extends StatelessWidget {
  const ChatBodyConditionFalse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
        builder: (context, state) {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter, colors: [
              Colors.blue[900]!,
              Colors.blue[800]!,
              Colors.blue[400]!,
            ])),
            child: state is SocialGetAllUsersLoadingState
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SocialCubit.get(context).users.isEmpty
                          ? const Text(
                              "You Have No Friends",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.white),
                            )
                          : const Text(""),
                      const SizedBox(
                        height: 20,
                      ),
                      // const CircularProgressIndicator()
                    ],
                  )),
          );
        },
        listener: (context, state) {});
  }
}
