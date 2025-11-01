
import 'package:flutter/material.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BasicAppBar({
    super.key,
    this.title,
    this.bgColor,
    this.hideback = false,
    this.action,
  });
  final Widget? title;
  final Color? bgColor;
  final Widget? action;
  final bool hideback;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor ?? Colors.transparent,
      elevation: 0,
      centerTitle: true,
      actions: [action ?? Container()],
      title: title ?? Text(''),
      leading:
          hideback
              ? null
              : IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Container(
                  margin: const EdgeInsets.only(left: 10.0),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color:
                         Colors.white.withOpacity(0.03)
                           ,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_back_sharp,
                    color:Colors.white ,
                  ),
                ),
              ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
