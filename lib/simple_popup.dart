library simple_popup;

import 'package:flutter/material.dart';

class Popup {
  static OverlayEntry _overlayEntry;

  static void show(
      {@required BuildContext context,
      @required Widget child,
      Color backgroundColor,
      bool disableBackgroundTouch = false}) {
    _overlayEntry = OverlayEntry(
      builder: (context) {
        return PopupWidget(
          child: child,
          backgroundColor: backgroundColor,
          onTapBackground: () {
            if (!disableBackgroundTouch) {
              _overlayEntry?.remove();
            }
          },
        );
      },
    );
    Overlay.of(context).insert(_overlayEntry);
  }

  static void dismiss() {
    _overlayEntry?.remove();
  }
}

class PopupWidget extends StatefulWidget {
  final GestureTapCallback onTapBackground;
  final Widget child;
  final Color backgroundColor;

  const PopupWidget(
      {Key key, this.onTapBackground, this.child, this.backgroundColor})
      : super(key: key);

  @override
  _PopupWidgetState createState() => _PopupWidgetState();
}

class _PopupWidgetState extends State<PopupWidget>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Offset> offset;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 220));

    offset = Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset.zero)
        .animate(controller);

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.widget.onTapBackground,
      child: Container(
        color: this.widget.backgroundColor ?? Colors.black26,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SlideTransition(
            position: offset,
            child: GestureDetector(
              onTap: (){},
              child:this.widget.child,
            )
          ),
        ),
      ),
    );
  }
}
