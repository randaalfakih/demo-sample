import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:echo_cash/core/constants/app_constants.dart';
import 'package:echo_cash/core/constants/app_globals.dart';

class DrawerItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final VoidCallback? onTap;
  bool hasChildren;

  DrawerItem({
    Key? key,
    required this.name,
    required this.icon,
    this.hasChildren=false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        width: MediaQuery.of(context).size.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              Icon(icon,color: Colors.grey.withOpacity(0.5)),
              Divider(
                indent: 15,
              ),
              Text(
                  name,
                  style: drawerItemTileTextStyle
              )
            ],),
            hasChildren?Icon(Icons.keyboard_arrow_right,color: Colors.grey.withOpacity(0.5),size: 25,):Container()
          ],
        ),
      ),
    );
  }
}