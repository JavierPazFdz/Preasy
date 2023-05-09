import 'package:flutter/material.dart';
import 'package:preasy/providers/login_form_provider.dart';
import 'package:preasy/ui/input_decoration.dart';
import 'package:preasy/widgets/widgets.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});


  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      body: AuthBackground(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),              
              child: Column(
                children: [
                    const SizedBox(height: 250,),
                    CardContainer(
                      child: Column(
                        children: [
                  
                          const SizedBox(height: 10,),
                          Text('Login',style: Theme.of(context).textTheme.headlineMedium,),
                          ChangeNotifierProvider(
                            create: ( _ )=> LoginFormProvider(),
                            child: const _LoginForm())
                           ,
                  
                        ],
                      )
                    ),
                    const SizedBox(height: 50),
                    const Text('Crear una nueva cuenta',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 50),
                ],
                
            ),),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
   const _LoginForm();

  
  @override
  Widget build(BuildContext context) {

    final loginForm = Provider.of<LoginFormProvider>(context);
  return Container(
    child: Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: loginForm.formKey,
      child: Column(
        children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
              hintText: 'john.doe@gmail.com',
              labelText: 'Correo electronico',
              prefixIcon: Icons.alternate_email_rounded
            ),
            onChanged: (value) => loginForm.email = value,
            validator: (value){
                String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp  = new RegExp(pattern);
                return regExp.hasMatch(value ?? '')
                ? null
                :'Debe ser un correo electrónico válido';
            },
          ),
          const SizedBox(height: 30,),

          TextFormField(
            autocorrect: false,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecorations.authInputDecoration(
              hintText: '********',
              labelText: 'Contraseña',
              prefixIcon: Icons.lock_outline
            ),
            onChanged: (value) => loginForm.password = value,
            validator: (value){
                if(value != null && value.length>=6) return null;
                return 'La contraseña debe ser de al menos 6 caracteres';
            },
          ),
          const SizedBox(height: 30),

          MaterialButton(
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            disabledColor: Colors.grey,
            elevation: 0,
            color: Colors.deepPurple,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              child: Text(
                loginForm.isLoging ?
                'Espere....'
                :
                'Acceder',
                style: const TextStyle(color: Colors.white),
              ),
            ),
            onPressed: loginForm.isLoging ? null : () async {
              FocusScope.of(context).unfocus();
              if(!loginForm.isValidForm()) return;
              loginForm.isLoging = true;

              await Future.delayed(const Duration(seconds: 2));
              loginForm.isLoging = false;
              Navigator.pushReplacementNamed(context, 'home');

            } )
        ],
      )
      ,
      ),
    );
  }
}