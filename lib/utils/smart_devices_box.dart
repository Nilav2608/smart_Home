import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SmartDevicesBox extends StatelessWidget {
  final String smartDevicesName;
  final String iconPatn;
  final bool powerOn;
  void Function(bool)? onChanged;

  SmartDevicesBox(
      {super.key,
      required this.smartDevicesName,
      required this.iconPatn,
      required this.powerOn,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
            color: powerOn ? Colors.grey[900] : Colors.grey[200], borderRadius: BorderRadius.circular(24)),
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              iconPatn,
              height: 65,
              color: powerOn? Colors.white : Colors.black,
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Text(
                      smartDevicesName,
                      style:  TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16,
                          color: powerOn ? Colors.white : Colors.black),
                    ),
                  ),
                ),
                Transform.rotate(
                    angle: pi / 2,
                    child:
                        CupertinoSwitch(value: powerOn, onChanged: onChanged))
              ],
            )
          ],
        ),
      ),
    );
  }
}
