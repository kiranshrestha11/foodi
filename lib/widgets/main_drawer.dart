import 'package:flutter/material.dart';
import 'package:foodi/screens/bottom_bar_screen.dart';
import 'package:foodi/screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
//            Container(
//              height: 120,
//              color: Theme.of(context).primaryColor,
//              width: double.infinity,
//              child: Center(
//                child: Text(
//                  'Welcome to Foodi',
//                  style: TextStyle(
//                      color: Colors.white,
//                      fontSize: 32,
//                      fontFamily: "Roboto",
//                      fontWeight: FontWeight.bold),
//                ),
//              ),
//            ),
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://scontent.fktm3-1.fna.fbcdn.net/v/t1.0-9/23722598_1983723755233960_8086614917141637050_n.jpg?_nc_cat=105&_nc_sid=85a577&_nc_ohc=mMxUFyFeQiQAX-oImX3&_nc_ht=scontent.fktm3-1.fna&oh=a223be5e5f6699a6c4bee6128671be16&oe=5EF54FAC"),
            ),
            accountName: Text('kiran shrestha'),
            accountEmail: Text('kiranstha179@gamil.com'),
          ),
          ListTile(
              leading: Icon(
                Icons.restaurant,
              ),
              title: Text('Meals'),
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, BottomBarScreen.routeName);
              }),
          Divider(
            thickness: 3,
          ),
          ListTile(
              leading: Icon(
                Icons.settings,
              ),
              title: Text('Filters'),
              onTap: () {
                Navigator.pushReplacementNamed(context, FilterScreen.routeName);
              }),
          Divider(
            thickness: 3,
          ),
        ],
      ),
    );
  }
}
