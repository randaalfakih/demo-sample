import 'package:flutter/material.dart';
import 'package:echo_cash/core/widgets/drawer_item.dart';
import 'package:echo_cash/core/constants/app_constants.dart';
import 'package:echo_cash/core/constants/app_globals.dart';
import 'package:flutter/cupertino.dart';
class LoggedInCustomDrawer extends StatefulWidget {
  LoggedInCustomDrawer({Key? key}) : super(key: key);

  @override
  _LoggedInCustomDrawerState createState() => _LoggedInCustomDrawerState();
}

class _LoggedInCustomDrawerState extends State<LoggedInCustomDrawer> {
  bool isSettingsSelected = false;

  bool isAllowNotificationsSwitched = false;
  bool isDarkModeSwitched = false;
  String selectedLanguage='english';
  bool isLanguageTileExpanded=false;

  void _toggleAllowNotificationsSwitch(bool value) {
    setState(() {
      isAllowNotificationsSwitched = value;
    });
  }
  void _toggleDarkModeSwitch(bool value) {
    setState(() {
      isDarkModeSwitched = value;
    });
  }

  void _toggleDrawerSettings() {
    setState(() {
      isSettingsSelected = !isSettingsSelected;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.6,
      color: Colors.white,
      child: LayoutBuilder(
        builder: (context, constraint) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 160,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(bottom: 30),
                      color: secondaryColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: greyColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: const CircleAvatar(
                                  radius: 22,
                                  backgroundImage: NetworkImage(
                                    "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                width: (MediaQuery.of(context).size.width / 1.6) / 1.5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: (MediaQuery.of(context).size.width / 1.6) / 2,
                                          child: Text("Rima Dardar", style: white18TextStyle, maxLines: 2, overflow: TextOverflow.ellipsis),
                                        ),
                                        SizedBox(width: 5),
                                        Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Icon(Icons.circle_rounded, color: Colors.white,size: 18,),
                                            Icon(Icons.verified, color: primaryColor,size: 22,),
                                          ],),
                                        //Icon(Icons.verified, color: primaryColor,size: 22,),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Container(
                                      height: 29,
                                      padding: EdgeInsets.symmetric(horizontal: 6),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.white,
                                      ),
                                      child:  Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.circle, color: secondaryColor, size: 22),
                                          SizedBox(width: 5),
                                          Text("Manager", style: textStyle4Secondary),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    !isSettingsSelected?
                    Column(children: [
                      DrawerItem(
                        name: 'Home',
                        icon: Icons.home_rounded,
                        onTap: () async {
                          Navigator.pop(context);
                        },
                      ),
                      Container(width: MediaQuery.of(context).size.width, color: Colors.grey.withOpacity(0.5), height: 0.5),
                      DrawerItem(
                        name: 'Wallets',
                        icon: Icons.wallet,
                        onTap: () async {
                          Navigator.pop(context);
                        },
                      ),
                      Container(width: MediaQuery.of(context).size.width, color: Colors.grey.withOpacity(0.5), height: 0.5),
                      DrawerItem(
                        name: 'My Profile',
                        icon: Icons.person,
                        onTap: () async {
                          Navigator.pop(context);
                        },
                      ),
                      Container(width: MediaQuery.of(context).size.width, color: Colors.grey.withOpacity(0.5), height: 0.5),
                      DrawerItem(
                        name: 'Change PIN',
                        icon: Icons.lock,
                        onTap: () async {
                          Navigator.pop(context);
                        },
                      ),
                      Container(width: MediaQuery.of(context).size.width, color: Colors.grey.withOpacity(0.5), height: 0.5),
                      DrawerItem(
                        name: 'Notifications',
                        icon: Icons.notifications,
                        onTap: () async {
                          Navigator.pop(context);
                        },
                      ),
                      Container(width: MediaQuery.of(context).size.width, color: Colors.grey.withOpacity(0.5), height: 0.5),
                      DrawerItem(
                        name: 'Settings',
                        icon: Icons.settings,
                        hasChildren: true,
                        onTap: () async {
                          isSettingsSelected=true;
                          setState(() {

                          });
                        },
                      ),
                      Container(width: MediaQuery.of(context).size.width, color: Colors.grey.withOpacity(0.5), height: 0.5),

                    ],):
                    Column(children: [
                      DrawerItem(
                        name: 'Back',
                        icon: Icons.keyboard_arrow_left_outlined,
                        onTap: () async {
                          isSettingsSelected=false;
                          setState(() {

                          });
                        },
                      ),
                      Container(width: MediaQuery.of(context).size.width, color: Colors.grey.withOpacity(0.5), height: 0.5),
                      InkWell(
                        onTap: (){
                          _toggleAllowNotificationsSwitch(!isAllowNotificationsSwitched);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          width: MediaQuery.of(context).size.width,
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Text(
                                  'Allow Notifications',
                                  style: drawerItemTileTextStyle
                              ),

                              Container(
                                height: 20,
                                width: 20,
                                child: Transform.scale(
                                  scale: 0.4,
                                  child: Switch(

                                    activeColor: Colors.white,
                                    activeTrackColor: primaryColor,
                                    inactiveThumbColor: Colors.grey.withOpacity(0.5),
                                    inactiveTrackColor: Colors.white,
                                    thumbIcon: MaterialStateProperty.resolveWith<Icon?>((Set<MaterialState> states) {
                                      if (states.contains(MaterialState.selected)) {
                                        return Icon(Icons.circle,color: Colors.white,);
                                      }
                                      return Icon(Icons.circle,color: Colors.white,size: 18,);
                                    }),
                                    trackOutlineColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
                                      if (states.contains(MaterialState.selected)) {
                                        return primaryColor;
                                      }
                                      return Colors.grey.withOpacity(0.5);
                                    }),


                                    value: isAllowNotificationsSwitched,
                                    onChanged: _toggleAllowNotificationsSwitch,
                                  ),
                                ),
                              )

                            ],),
                        ),
                      ),
                      Container(width: MediaQuery.of(context).size.width, color: Colors.grey.withOpacity(0.5), height: 0.5),
                      InkWell(
                        onTap: (){
                          _toggleDarkModeSwitch(!isDarkModeSwitched);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          width: MediaQuery.of(context).size.width,
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Text(
                                  'Dark Mode',
                                  style: drawerItemTileTextStyle
                              ),

                              Container(
                                height: 20,
                                width: 20,
                                child: Transform.scale(
                                  scale: 0.4,
                                  child: Switch(

                                    activeColor: Colors.white,
                                    activeTrackColor: primaryColor,
                                    inactiveThumbColor: Colors.grey.withOpacity(0.5),
                                    inactiveTrackColor: Colors.white,
                                    thumbIcon: MaterialStateProperty.resolveWith<Icon?>((Set<MaterialState> states) {
                                      if (states.contains(MaterialState.selected)) {
                                        return Icon(Icons.circle,color: Colors.white,);
                                      }
                                      return Icon(Icons.circle,color: Colors.white,size: 18,);
                                    }),
                                    trackOutlineColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
                                      if (states.contains(MaterialState.selected)) {
                                        return primaryColor;
                                      }
                                      return Colors.grey.withOpacity(0.5);
                                    }),
                                    value: isDarkModeSwitched,
                                    onChanged: _toggleDarkModeSwitch,
                                  ),
                                ),
                              )

                            ],),
                        ),
                      ),
                      Container(width: MediaQuery.of(context).size.width, color: Colors.grey.withOpacity(0.5), height: 0.5),
                      InkWell(
                        onTap: (){
                          isLanguageTileExpanded=!isLanguageTileExpanded;
                          setState(() {

                          });
                        },
                        child:  Container(
                          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              selectedLanguage=='english'?
                              Text('English',style: drawerItemTileTextStyle,):
                              Text('Arabic',style: drawerItemTileTextStyle,),
                              isLanguageTileExpanded?
                              Icon(Icons.arrow_drop_up_sharp,color: Colors.grey.withOpacity(0.5),size: 25,):
                              Icon(Icons.arrow_drop_down_outlined,color: Colors.grey.withOpacity(0.5),size: 25,)
                            ],),


                        ),
                      ),

                      Align(
                        alignment: Alignment.centerLeft,
                        child:  isLanguageTileExpanded? InkWell(
                            onTap: (){
                              if(selectedLanguage=='english'){
                                selectedLanguage='arabic';
                              }
                              else{
                                selectedLanguage='english';
                              }
                              setState(() {

                              });
                            },
                            child:
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                              child: selectedLanguage=='english'?
                              Text('Arabic',style: drawerItemTileTextStyle,textAlign: TextAlign.start,):
                              Text('English',style: drawerItemTileTextStyle,textAlign: TextAlign.start),
                            )
                        ):Container(),
                      ),
                      Container(width: MediaQuery.of(context).size.width, color: Colors.grey.withOpacity(0.5), height: 0.5),

                    ],),
                    const Expanded(child: SizedBox()),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        DrawerItem(
                          name: 'Help',
                          icon: Icons.help,
                          onTap: () async {
                            Navigator.pop(context);
                          },
                        ),
                        Container(width: MediaQuery.of(context).size.width, color: Colors.grey.withOpacity(0.5), height: 0.5),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.logout, color: redColor),
                                    Divider(
                                      indent: 15,
                                    ),
                                    Text(
                                      'Logout',
                                      style: drawerItemTileRedTextStyle,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
