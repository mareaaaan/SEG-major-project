import 'package:cycle/main.dart';
import 'package:cycle/pages/favorites.dart';
import 'package:cycle/pages/home_page.dart';
import 'package:cycle/pages/settings.dart';
import 'package:cycle/pages/signup_login_pages/signup_page.dart';
import 'package:cycle/pages/starting_page.dart';
import 'package:cycle/services/user_details_helper.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'trip_history.dart';
import 'profile.dart';
import 'package:cycle/pages/trip_history.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.lightBlue,
      child: ListView(
        padding: EdgeInsets.all(10),
        children: [
          SizedBox(height: 70),
          buildProfileColumn(context),
          SizedBox(height: 10),
          buildMap(context),
          SizedBox(height: 10),
          buildFavorites(context),
          SizedBox(height: 10),
          buildHistory(context),
          SizedBox(height: 10),
          buildSettings(context),
          SizedBox(height: 50),
          ElevatedButton(
              onPressed: () {
                // Error here
                UserDetailsHelper.logout(context);
                Navigator.pushNamed(context, StartingPage.id);
              },
              child: const Text('Log out'))
        ],
      ),
    );
  }
}

Widget buildProfileColumn(BuildContext context) => Container(
      height: 150,
      child: Material(
        color: Colors.lightBlue[200],
        borderRadius: BorderRadius.circular(15.0),
        child: InkWell(
          splashColor: Colors.lightBlue,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Profile()),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: const EdgeInsets.all(5)),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.network(
                        'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
                        width: 100,
                      )),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("John Doe",
                          style: GoogleFonts.lato(
                            fontStyle: FontStyle.normal,
                            color: Colors.white,
                            fontSize: 30,
                          )),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

Widget buildFavorites(BuildContext context) => Container(
      height: 50,
      child: Material(
        color: Colors.lightBlue[200],
        borderRadius: BorderRadius.circular(15.0),
        child: InkWell(
          splashColor: Colors.lightBlue,
          child: ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favorites',
                style: GoogleFonts.lato(
                    fontStyle: FontStyle.normal, color: Colors.white)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Favorites()),
              );
            },
          ),
        ),
      ),
    );

Widget buildMap(BuildContext context) => Container(
      height: 50,
      child: Material(
        color: Colors.lightBlue[200],
        borderRadius: BorderRadius.circular(15.0),
        child: InkWell(
          splashColor: Colors.lightBlue,
          child: ListTile(
            leading: Icon(Icons.map),
            title: Text('Map',
                style: GoogleFonts.lato(
                    fontStyle: FontStyle.normal, color: Colors.white)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
        ),
      ),
    );

Widget buildHistory(BuildContext context) => Container(
      height: 50,
      child: Material(
        color: Colors.lightBlue[200],
        borderRadius: BorderRadius.circular(15.0),
        child: InkWell(
          splashColor: Colors.lightBlue,
          child: ListTile(
            leading: Icon(Icons.history),
            title: Text('Trip History',
                style: GoogleFonts.lato(
                    fontStyle: FontStyle.normal, color: Colors.white)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TripHistory()),
              );
            },
          ),
        ),
      ),
    );

Widget buildSettings(BuildContext context) => Container(
      height: 50,
      child: Material(
        color: Colors.lightBlue[200],
        borderRadius: BorderRadius.circular(15.0),
        child: InkWell(
          splashColor: Colors.lightBlue,
          child: ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings',
                style: GoogleFonts.lato(
                    fontStyle: FontStyle.normal, color: Colors.white)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Settings()),
              );
            },
          ),
        ),
      ),
    );
