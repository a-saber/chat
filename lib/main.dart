import 'package:achat/cubit/cubit.dart';
import 'package:achat/cubit/states.dart';
import 'package:achat/features/chat/presentation/chats_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/cache_helper.dart';
import 'core/utils/constance.dart';
import 'features/login/presentation/login_screen.dart';
import 'firebase_options.dart';

Future onBackground(RemoteMessage message) async {
  //print("on background:---------- ${message.notification!.body}");
}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.instance;
  var token = FirebaseMessaging.instance.getToken();
  FirebaseMessaging.onMessage.listen((event) {});
  FirebaseMessaging.onMessageOpenedApp.listen((event) {});
  FirebaseMessaging.onBackgroundMessage(onBackground);

  Widget widget;
  await CacheHelper.init();
  uid = await CacheHelper.getData(key: "uid");
  print(" $uid");
  if (uid != null) {
    widget = const ChatsScreen();
  } else {
    widget = const SocialLoginScreen();
  }

  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  Widget? startWidget;

  MyApp({super.key, this.startWidget});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SocialCubit()
        ..getUser()
        ..getAllUsers(),
      child: BlocConsumer<SocialCubit, SocialStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(
                appBarTheme: const AppBarTheme(
                    systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
            ))),
            debugShowCheckedModeBanner: false,
            home: startWidget,
          );
        },
      ),
    );
  }
}
