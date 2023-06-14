import 'package:flutter/material.dart';

import '../../../Shared/constant.dart';
import '../../constants/size_constants.dart';

Widget errorContainer() {
  return Container(
    clipBehavior: Clip.hardEdge,
    child: Image.asset(
      'assets/images/img_not_available.jpeg',
      height: Sizes.dimen_200,
      width: Sizes.dimen_200,
    ),
  );
}

Widget chatImage({required String imageSrc, required Function onTap}) {
  return OutlinedButton(
      onPressed: () => onTap(),
      child: Image.network(imageSrc,
          width: Sizes.dimen_200,
          height: Sizes.dimen_200,
          fit: BoxFit.cover,
          loadingBuilder: (BuildContext ctx, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return Container(
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(Sizes.dimen_10)),
                width: Sizes.dimen_200,
                height: Sizes.dimen_200,
                child: Center(
                    child: CircularProgressIndicator(
                        color: button2color,
                        value: loadingProgress.expectedTotalBytes != null &&
                                loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null)));
          },
          errorBuilder: (context, object, stackTrace) => errorContainer()));
}

Widget messageBubble(
    {required String chatContent, Color? color, Color? textColor}) {
  return Flexible(
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          margin: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(Sizes.dimen_12)),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            Flexible(
                child: Text(chatContent,
                    style:
                        TextStyle(fontSize: Sizes.dimen_16, color: textColor)))
          ])));
}
