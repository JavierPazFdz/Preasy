import 'package:flutter/material.dart';
import 'package:preasy/screens/projects_screen.dart';
import 'package:preasy/screens/screens.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

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
            onTap: () {
              //Volver a la pagina home

              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.work_outlined),
            title: const Text('Projectos'),
            //Navigator.pushReplacementNamed(context, ProjectsScreen.routerName);
            onTap: () {

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>ProjectsScreen(text: '')));
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings_rounded),
            title: const Text('Nuevo Proyecto'),
            onTap: () {
              //Volver a la pagina home

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NewProjectScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings_rounded),
            title: const Text('Configuración'),
            onTap: () {
              //Volver a la pagina home

              Navigator.pushReplacementNamed(context, SettingScreen.routerName);
            },
          ),
        ],
      ),
    );
  }
}
