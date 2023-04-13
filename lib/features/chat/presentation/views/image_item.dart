import 'package:achat/core/utils/Widgets.dart';
import 'package:flutter/material.dart';

import '../../../../core/styles/size.dart';
import '../../data/models/message_model.dart';
import '../view_image_screen.dart';

class ImageItem extends StatelessWidget {
  const ImageItem(
      {Key? key,
      required this.model,
      required this.color,
      required this.isResever})
      : super(key: key);
  final MessageModel model;
  final Color color;
  final bool isResever;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment:
            isResever ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Container(
              width: SizeConfig.screenWidth * 0.5,
              height: SizeConfig.screenWidth * 0.6,
              decoration: BoxDecoration(
                border: Border.all(color: color.withOpacity(0.18)),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(0),
                    bottomRight: Radius.circular(0)),
              ),
              child: InkWell(
                onTap: () {
                  NavigateTo(
                      context,
                      ViewImageScreen(
                        url: model.fileUrl!,
                      ));
                },
                child: Container(
                  width: SizeConfig.screenWidth * 0.5,
                  height: SizeConfig.screenWidth * 0.4,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(model.image!), fit: BoxFit.cover),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(0),
                      )),
                ),
              )),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(model.dateTime!.substring(11, 19),
                    style: TextStyle(color: color, fontSize: 12),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
