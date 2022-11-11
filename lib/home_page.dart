import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home_ui/utils/smart_devices_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double horizontalPadding = 30;
  final double verticalPadding = 20;

  //List of smart devices
  List mySmartDevices = [
    //[smartDevices name, iconPath, powerStatus]
    ["Smart Light", 'lib/icons/light-bulb.png', true],
    ["Smart AC", 'lib/icons/air-conditioner.png', false],
    ["Smart TV", 'lib/icons/smart-tv.png', false],
    ["Smart Fan", 'lib/icons/fan.png', false]
  ];

  //For switch on and off
  powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding, vertical: verticalPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'lib/icons/menu.png',
                  height: 45,
                  color: Colors.grey[800],
                ),
                Icon(
                  Icons.person,
                  size: 45,
                  color: Colors.grey[800],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                const Text("Welcome Home!"),
                Text(
                  "NILAVARASU",
                  style:  GoogleFonts.bebasNeue(
                    fontSize: 72
                  ),
                  
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: const Text("Smart Devices",
              style: TextStyle(
                fontWeight:  FontWeight.bold,
                fontSize: 20
              ))),
          Expanded(
              child: GridView.builder(
                physics:const NeverScrollableScrollPhysics(),
                  itemCount: mySmartDevices.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1 / 1.3),
                  itemBuilder: (context, index) {
                    return SmartDevicesBox(
                      smartDevicesName: mySmartDevices[index][0],
                      iconPatn: mySmartDevices[index][1],
                      powerOn: mySmartDevices[index][2],
                      onChanged: (value) => powerSwitchChanged(value, index),
                    );
                  }))
                  
        ],
      )),
    );
  }
}
