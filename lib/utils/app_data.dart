import 'package:aeo_logic/model/navigation_model.dart';
import 'package:aeo_logic/ui/home/home_page.dart';
import 'package:flutter/material.dart';

class AppData {
  static final List<NavigationModel> navigationList = [
    NavigationModel(
      "Home",
      Icons.home,
      HomePage(),
    ),
    NavigationModel(
      "Wallet",
      Icons.account_balance_wallet_outlined,
      Placeholder()
    ),
    NavigationModel(
      "Settings",
      Icons.settings_outlined,
        Placeholder()
    ),
    NavigationModel(
      "Profile",
      Icons.person_outline_outlined,
        Placeholder()
    ),
  ];
}



