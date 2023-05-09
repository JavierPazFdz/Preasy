import 'package:flutter/material.dart';
import 'package:preasy/screens/screens.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: Container(),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            onTap: (){
              //Volver a la pagina home
              Navigator.pushReplacementNamed(context, HomeScreen.routerName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.work_outlined),
            title: const Text('Projects'),
            //Navigator.pushReplacementNamed(context, ProjectsScreen.routerName);
            onTap: (){

            },
          ),
          ListTile(
            leading: const Icon(Icons.settings_rounded),
            title: const Text('Settings'),
            onTap: (){
              //Volver a la pagina home
              Navigator.pushReplacementNamed(context, SettingScreen.routerName);
            },
          ),
        ],
      ),

    );
}
}