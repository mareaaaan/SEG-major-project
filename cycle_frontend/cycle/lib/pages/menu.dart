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
          buildProfileColumn(),
          SizedBox(height: 10),
          buildFavorites(),
          SizedBox(height: 10),
          buildHistory(),
          SizedBox(height: 10),
          buildSettings(),
        ],
      ),
    );
  }
}

Widget buildProfileColumn() => Container(
      height: 150,
      child: Material(
        color: Colors.lightBlue[200],
        borderRadius: BorderRadius.circular(15.0),
        child: InkWell(
          splashColor: Colors.lightBlue,
          onTap: () {
            print("Profile");
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

Widget buildFavorites() => Container(
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
          print("Favorites");
        },
      ),
    ),
  ),
);

Widget buildHistory() => Container(
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
          print("Trip History");
        },
      ),
    ),
  ),
);

Widget buildSettings() => Container(
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
          print("Settings");
        },
      ),
    ),
  ),
);
