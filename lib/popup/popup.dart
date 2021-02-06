import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:giphy_search/popup/popup_layout.dart';
import 'package:giphy_search/utils.dart';

class PopUp {
  static void showPopUp(BuildContext context, {Widget child}) {
    Navigator.push(
      context,
      PopupLayout(
        bgColor: Colors.black.withOpacity(0.2),
        top: 0,
        left: 0,
        right: 0,
        bottom: 0,
        child: GestureDetector(
          onTap: () {
            if (child != null) {
              Navigator.pop(context);
            }
          },
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
            child: Material(
              color: transparent,
              child: Center(
                child: child ??
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: white),
                      child: Center(
                        child: CircularProgressIndicator(
                            // radius: 15,
                            ),
                      ),
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
