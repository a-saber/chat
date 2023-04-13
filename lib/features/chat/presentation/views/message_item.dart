import 'package:flutter/material.dart';

import '../../data/models/message_model.dart';

class MessageItem extends StatelessWidget {
  const MessageItem(
      {Key? key,
      required this.model,
      required this.color,
      required this.textColor})
      : super(key: key);
  final MessageModel model;
  final Color color;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(40),
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
              bottomRight: Radius.circular(0)),
          color: color),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(
              model.text!,
              maxLines: 3,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                color: textColor,
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Text(
              model.dateTime!.substring(11, 19),
              style: TextStyle(color: textColor),
            ),
          )
        ],
      ),
    );
    ;
  }
}
