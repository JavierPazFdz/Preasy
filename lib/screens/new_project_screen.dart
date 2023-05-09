import 'package:flutter/material.dart';
import 'package:preasy/screens/projects_screen.dart';
import '../widgets/custom_input_field.dart';

final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

class NewProjectScreen extends StatelessWidget {
  const NewProjectScreen({Key? key}) : super(key: key);

  // final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final Map<String, String> formValues = {
      'proyect_name': '',
      'description': '',
      'fecha_inicio': '',
      'fecha_fin': '',
    };

    TextField(
      controller: textController,
    );

    return Scaffold(
        appBar: AppBar(
          title: const Text('Nuevo Proyecto'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Form(
              key: myFormKey,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 60, vertical: 20),
                    alignment: Alignment.center,
                    child: Image.asset('./lib/assets/logo_preasy.jpg'),
                  ),
                  TextField(
                    controller: textController,
                 ),
                  CustomInputField(
                    labelText: 'Nombre del proyecto',
                    icon: Icons.description_outlined,
                    formProperty: 'proyect_name',
                    formValues: formValues,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomInputField(
                    labelText: 'Descripción del proyecto',
                    icon: Icons.abc,
                    formProperty: 'description',
                    formValues: formValues,
                    
                    
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomInputField(
                    labelText: 'Fecha de creación del proyecto',
                    icon: Icons.date_range_outlined,
                    keyboardType: TextInputType.datetime,
                    formProperty: 'fecha_inicio',
                    formValues: formValues,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomInputField(
                    labelText: 'Fecha de finalización prevista',
                    icon: Icons.date_range_outlined,
                    keyboardType: TextInputType.datetime,
                    formProperty: 'fecha_fin',
                    formValues: formValues,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  
                  ElevatedButton(
                    child: const SizedBox(
                        width: double.infinity,
                        child: Center(child: Text('Guardar'))),
                    onPressed: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      if (!myFormKey.currentState!.validate()) {
                        print('Formulario no valido');

                        return;
                      }

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProjectsScreen()),
                      );

                      print(formValues);
                    },
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
