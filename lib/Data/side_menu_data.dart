import 'package:dash_board/model/menu_model.dart';
import 'package:flutter/material.dart';

class SideMenuData {
  final menu = const <MenuModel>[
    MenuModel(icon: Icons.home, title: 'Dashboard'),
    MenuModel(icon: Icons.person, title: 'profile'),
    MenuModel(icon: Icons.run_circle, title: 'Approval'),
    MenuModel(icon: Icons.settings, title: 'Settings'),
    MenuModel(icon: Icons.history, title: 'Unit_edit'),
    MenuModel(icon: Icons.logout, title: 'Logout'),
  ];
}
