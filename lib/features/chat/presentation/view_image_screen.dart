import 'package:flutter/material.dart';

class ViewImageScreen extends StatelessWidget {
  const ViewImageScreen({Key? key, required this.url}) : super(key: key);
  final String url;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(url), fit: BoxFit.fill)),
    );
  }
}
