import 'package:flutter/material.dart';
import 'package:wrg3/backend/services/service.theme.dart';

extension TextExtension on Text {
  Text h1() {
    return Text(
      data!,
      textScaleFactor: 1,
      maxLines: maxLines ?? 2,
      overflow: overflow ?? TextOverflow.ellipsis,
      softWrap: softWrap ?? true,
      textAlign: textAlign,
      style:
          TextStyle(fontWeight: FontWeight.w700, color: themeService.fontColor),
    );
  }

  Text h2() {
    return Text(
      data!,
      textScaleFactor: .85,
      maxLines: maxLines ?? 2,
      overflow: overflow ?? TextOverflow.ellipsis,
      softWrap: softWrap ?? true,
      textAlign: textAlign,
      style: TextStyle(
          fontWeight: FontWeight.w600,
          color: themeService.fontColor.withOpacity(1)),
    );
  }

  Text h3() {
    return Text(
      data!,
      textScaleFactor: .85,
      maxLines: maxLines ?? 2,
      overflow: overflow ?? TextOverflow.ellipsis,
      softWrap: softWrap ?? true,
      textAlign: textAlign,
      style: TextStyle(
          fontWeight: FontWeight.w500,
          color: themeService.fontColor.withOpacity(.5)),
    );
  }

  Text h4() {
    return Text(
      data!,
      textScaleFactor: .8,
      maxLines: maxLines ?? 2,
      overflow: overflow ?? TextOverflow.ellipsis,
      softWrap: softWrap ?? true,
      textAlign: textAlign,
      style: TextStyle(
          fontWeight: FontWeight.w400,
          color: themeService.fontColor.withOpacity(.4)),
    );
  }
}
