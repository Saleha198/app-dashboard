import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SideMenuWidget extends StatefulWidget {
  const SideMenuWidget({super.key});

  @override
  _SideMenuWidgetState createState() => _SideMenuWidgetState();
}

class _SideMenuWidgetState extends State<SideMenuWidget> {
  int _selectedIndex = 0; // Index of the selected item

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isMobile = mediaQuery.size.width < 600;

    return Drawer(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ListView(
            padding: EdgeInsets.zero,
            children: [
              // Drawer Header
              Container(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                  children: [
                    // Add any drawer header elements here if needed

                    // Divider under the header
                  ],
                ),
              ),
              // Drawer Items
              _buildDrawerMenuItem(
                icon: Icons.dashboard,
                text: 'Dashboard',
                index: 0,
                navigation1: '/dashboard',
                navigation2: '/dashboard_options',
              ),
              _buildDrawerMenuItem(
                icon: Icons.work,
                text: 'Project',
                index: 1,
                navigation1: '/projects',
                navigation2: '/projects_options',
              ),
              _buildDrawerMenuItem(
                icon: Icons.check_circle,
                text: 'Flats Approved',
                index: 2,
                navigation1: '/flats',
                navigation2: '/flats_options',
              ),
              _buildDrawerMenuItem(
                icon: Icons.store,
                text: 'Shop Approved',
                index: 3,
                navigation1: '/shops',
                navigation2: '/shops_options',
              ),
              _buildDrawerMenuItem(
                icon: Icons.logout,
                text: 'LogOut',
                index: 4,
                navigation1: '/logout',
                navigation2: '/logout_options',
              ),
              const Divider(),
              // Horizontal line above profile section
              Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey[300],
              ),
              _buildProfileSection(),
              _buildAdditionalActions(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildDrawerMenuItem({
    required IconData icon,
    required String text,
    required int index,
    required String navigation1,
    required String navigation2,
  }) {
    bool isSelected = _selectedIndex == index;

    return ListTile(
      selected: isSelected,
      selectedTileColor: Colors.blue[50],
      contentPadding: EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: MediaQuery.of(context).size.width < 600 ? 16.0 : 32.0,
      ),
      leading: Icon(
        icon,
        color: isSelected ? Colors.blue : Colors.grey,
        size: MediaQuery.of(context).size.width < 600 ? 24.0 : 28.0,
      ),
      title: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.blue : Colors.black,
          fontSize: MediaQuery.of(context).size.width < 600 ? 16.0 : 18.0,
        ),
      ),
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text('Flats'),
                  onTap: () {
                    Navigator.pushNamed(context, navigation1);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Shops'),
                  onTap: () {
                    Navigator.pushNamed(context, navigation2);
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildProfileSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/images/profile.png'),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Al-Saif',
                  style: TextStyle(
                    fontSize:
                        MediaQuery.of(context).size.width < 600 ? 16.0 : 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'alsaif@gmail.com',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize:
                        MediaQuery.of(context).size.width < 600 ? 14.0 : 16.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdditionalActions() {
    return Column(
      children: [
        _buildDrawerMenuItem(
          icon: Icons.settings,
          text: 'Settings',
          index: 5,
          navigation1: '/settings',
          navigation2: '/settings_options',
        ),
        _buildDrawerMenuItem(
          icon: Icons.help,
          text: 'Help',
          index: 6,
          navigation1: '/help',
          navigation2: '/help_options',
        ),
      ],
    );
  }
}
