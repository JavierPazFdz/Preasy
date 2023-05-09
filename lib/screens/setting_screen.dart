import 'package:flutter/material.dart';
import 'package:preasy/Widgets/widgets.dart';


class SettingScreen extends StatelessWidget {

  static const String routerName='Setting';

  const SettingScreen({Key? key}): super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        drawer: const SideMenu(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
            children: [
              const Text('Settings', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200)),
              const Divider(),

              SwitchListTile.adaptive(
                  value: true,
                  title: const Text('DarkMode'),
                  onChanged: (value){
                  }
              ),
          const Divider(),

              RadioListTile<int>(
                  value:1,
                  groupValue: 1,
                  title: const Text ('Masculino'),
                  onChanged: (value){

              }),
              const Divider(),

              RadioListTile<int>(value:1, groupValue: 1,
                  title: const Text ('Femenino'),
                  onChanged: (value){

              }),
              const Divider(),

              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  initialValue: '',
                  decoration: const InputDecoration(
                    labelText: 'Nombre', helperText: 'Nombre de Usuario',

                  ),

                ),
              )
            ],
          ),
          ),
        )
    );
  }
}
