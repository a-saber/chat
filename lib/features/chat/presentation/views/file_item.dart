import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../core/styles/size.dart';
import '../../../../core/utils/Widgets.dart';
import '../../data/models/message_model.dart';
import '../view_file_screen.dart';

class FileItem extends StatelessWidget {
  const FileItem({Key? key, required this.model, required this.color})
      : super(key: key);
  final MessageModel model;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: () {
          NavigateTo(
              context,
              ViewFileScreen(
                url: model.fileUrl!,
              ));
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: SizeConfig.screenWidth * 0.8,
              height: 90,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                      bottomRight: Radius.circular(0)),
                  color: color),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(40)),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                        child: Container(
                          width: (SizeConfig.screenWidth * 0.8) - 20,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200.withOpacity(0.5),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(40))),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: 36,
                                height: 36,
                                child: Stack(
                                  children: [
                                    const Icon(
                                      Icons.insert_drive_file,
                                      size: 36,
                                      color: Colors.black87,
                                    ),
                                    Center(
                                      child: Text(
                                        model.fileType!.toUpperCase(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 9,
                                            color: Colors.blueGrey),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                model.fileName!.length > 20
                                    ? "${model.fileName!.substring(0, 8)}...${model.fileName!.substring(model.fileName!.length - 9, model.fileName!.length)}"
                                    : "${model.fileName}",
                                style: const TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3.0),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                            "${(double.parse(model.fileSize!) / 1024 / 1000).toStringAsFixed(2)} MB",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 12),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Spacer(),
                        Text(
                          model.dateTime!.substring(11, 19),
                          style: const TextStyle(
                              fontSize: 12, color: Colors.white),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
