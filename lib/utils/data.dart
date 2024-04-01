import 'dart:async';
import 'package:week5challenge/main.dart';
import 'package:week5challenge/utils/supabase_data.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:week5challenge/widgets/progress_dialog.dart';

var profile =
    "https://scontent.fhre1-1.fna.fbcdn.net/v/t31.18172-8/30806193_1733216346737346_7068341401572357511_o.jpg?_nc_cat=108&ccb=1-7&_nc_sid=7a1959&_nc_ohc=u1BnW7gQsZ4AX-FTt78&_nc_ht=scontent.fhre1-1.fna&cb_e2o_trans=t&oh=00_AfDCBSty8XNvIXPHE3_cLSvBRRMhuc77NPMYD6jOyyzvMA&oe=65E781F8";

bool isloading = false;
var id = supabase.auth.currentUser!.id;
var selectedCarId;
var loadingCardId = 1;
final username = supabase.auth.currentUser!.email.toString();
Future<List> populars = SupabaseData().getPopular();
Future<List> myFavorites = SupabaseData().getFavorites();
Future<List> recommended = SupabaseData().getFavorites();
Future<List> searchResults = SupabaseData().getSearch('');
Future<List> selectedCarPhotos =
    SupabaseData().getSelectedCarPhotos(selectedCarId);
Future<int> favorites = SupabaseData().getLikes(loadingCardId);

// List recommended = [
//   {
//     "image":
//         "https://images.unsplash.com/photo-1621135802920-133df287f89c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
//     "name": "Lamborghini aventador",
//     "price": "\$380k",
//     "location": "Bulawayo",
//     "is_favorited": true,
//   },
// ];

List categories = [
  {"name": "All", "icon": FontAwesomeIcons.boxes},
  {"name": "Chairs", "icon": FontAwesomeIcons.chair},
  {"name": "Sofas", "icon": FontAwesomeIcons.couch},
  {"name": "Beds", "icon": FontAwesomeIcons.bed},
  {"name": "Lamps", "icon": FontAwesomeIcons.lightbulb},
];

List settingsItems = [
  {
    "title": "Light Mode",
    "subtitle": "Switch to light mode",
    "icon": Icons.contrast,
    "route": '',
    "is_switch": true,
    "is_switch_on": false
  },
  {
    "title": "Sound",
    "subtitle": "Turn off sound",
    "icon": Icons.speaker,
    "route": '',
    "is_switch": true,
    "is_switch_on": true
  },
  {
    "title": "Notifications",
    "subtitle": "Turn on Notifications",
    "icon": Icons.notifications,
    "route": '',
    "is_switch": true,
    "is_switch_on": false
  },
];

List contactUsItems = [
  {
    "title": "About",
    "subtitle": "Learn more about this app",
    "icon": Icons.info,
    "route": '',
    "is_switch": false,
    "is_switch_on": false
  },
  {
    "title": "Send Feedback",
    "subtitle": "Let Us Know how we can Improve",
    "icon": Icons.chat_bubble,
    "route": '',
    "is_switch": false,
    "is_switch_on": true
  },
  {
    "title": "Privacy",
    "subtitle": "Learn more about our Privacy Policy",
    "icon": Icons.fingerprint,
    "route": '',
    "is_switch": false,
    "is_switch_on": false
  },
];

List accountSettingsItems = [
  {
    "title": "Signout",
    "icon": Icons.logout,
    "route": '',
    "is_switch": false,
    "is_switch_on": false,
    "action": ''
  },
  {
    "title": "Change Email",
    "icon": Icons.replay,
    "route": '',
    "is_switch": false,
    "is_switch_on": true
  },
  {
    "title": "Delete Account",
    "icon": Icons.delete,
    "route": '',
    "is_switch": false,
    "is_switch_on": false
  },
];
