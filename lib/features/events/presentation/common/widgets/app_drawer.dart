import 'package:camabelcommunity/core/constants/app_images.dart';
import 'package:camabelcommunity/core/enums/screen_name.dart';
import 'package:camabelcommunity/core/enums/screen_uri_path.dart';
import 'package:camabelcommunity/core/theme/custom_colors.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  final ScreenName screenName;
  const AppDrawer({super.key, required this.screenName});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: CustomColors.white,
      child: Column(
        children: [
          DrawerHeader(child: Image(image: AssetImage(AppImages.logoCamabel))),
          Expanded(
            child: ListView(
              children: [
                _buildDrawerItem(
                  context,
                  icon: Icons.home,
                  title: ScreenName.home.label,
                  screeName: ScreenName.home,
                  destination: ScreenUriPath.home.label,
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.history,
                  title: ScreenName.eventHistory.label,
                  screeName: ScreenName.eventHistory,
                  destination: ScreenUriPath.eventHistory.label,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.info_outline, color: CustomColors.white),
                  title: Text(
                    "A propos",
                    style: TextStyle(
                      color: CustomColors.white,
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                  //onTap: () {},
                ),

                Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    horizontal: 12.0,
                    vertical: 10,
                  ),
                  child: Divider(color: CustomColors.black, height: 1),
                ),
                Text(
                  "Camabel Community © 2026",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: CustomColors.black, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required ScreenName screeName,
    required String destination,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: CustomColors.darkBlue,
        fontWeight: widget.screenName == screeName
            ? FontWeight.bold
            : FontWeight.normal,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: CustomColors.darkBlue,
          fontWeight: widget.screenName == screeName
              ? FontWeight.bold
              : FontWeight.normal,
          decoration: widget.screenName == screeName
              ? TextDecoration.underline
              : TextDecoration.none,
          decorationColor: CustomColors.darkBlue,
        ),
      ),
      enabled: !(widget.screenName == screeName),
      tileColor: CustomColors.white,
      onTap: () {
        Navigator.of(context).pushNamed(destination);
      },
    );
  }
}
