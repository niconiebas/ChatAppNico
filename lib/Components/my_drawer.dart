import 'package:chatappnotification/Pages/settings_page.dart';
import 'package:chatappnotification/services/auth/auth_services.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    // get auth service
    final auth = AuthService();
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text(
              'Nico Niebas',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.amber),
            ),
            accountEmail: const Text(
              'testapp@gmail.com',
              style: TextStyle(color: Colors.white),
            ),
            currentAccountPicture: Stack(
              children: [
                SizedBox(
                  height: 120,
                  width: 120,
                  child: CircleAvatar(
                    child: ClipOval(
                      child: Image.network(
                        'https://i.pinimg.com/736x/a3/96/63/a3966351deb43da383db28f854e2f6b3.jpg',
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Theme.of(context).colorScheme.secondary),
                      child: const Icon(
                        Icons.edit,
                        size: 15,
                      ),
                    ),
                  ),
                )
              ],
            ),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://images.wallpapersden.com/image/download/topography-abstract-black-texture_a2lmZmiUmZqaraWkpJRmbmdlrWZlbWU.jpg'),
                    fit: BoxFit.cover)),
          ),

          // home list tile
          ListTile(
            title: const Text("H O M E"),
            leading: Icon(
              Icons.home,
              color: Theme.of(context).colorScheme.primary,
            ),
            onTap: () {
              // pop the drawer
              Navigator.pop(context);
            },
          ),

          // settings list tile
          ListTile(
            title: const Text("S E T T I N G S"),
            leading: Icon(
              Icons.settings,
              color: Theme.of(context).colorScheme.primary,
            ),
            onTap: () {
              // pop the drawer
              Navigator.pop(context);

              // navigate to settings page
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsPage(),
                  ));
            },
          ),

          Divider(
            height: 50,
            color: Theme.of(context).colorScheme.primary,
            thickness: .2,
          ),

          // logout list tile
          ListTile(
            title: const Text("L O G O U T"),
            leading: Icon(
              Icons.logout,
              color: Theme.of(context).colorScheme.primary,
            ),
            onTap: logout,
          ),
        ],
      ),
    );
  }
}
