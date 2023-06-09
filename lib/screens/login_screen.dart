import 'package:flutter/material.dart';
import 'package:preasy/providers/login_form_provider.dart';
import 'package:preasy/services/auth_service.dart';
import 'package:preasy/services/notifications_service.dart';
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
                    TextButton(onPressed: 
                      () => Navigator.pushReplacementNamed(context, 'register'), 
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(Colors.indigo.withOpacity(0.1)),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                      
                      child: const Text('Crear una nueva cuenta',style: TextStyle(fontSize: 18,  color: Colors.black87)),
                    ),
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
            onPressed: loginForm.isLoging ? null : () async {
              FocusScope.of(context).unfocus();
              final authservice = Provider.of<AuthService>(context, listen:false);
              
              if(!loginForm.isValidForm()) return;
              loginForm.isLoging = true;

              final String? errorMessage = await authservice.login(loginForm.email, loginForm.password);
              
              if(errorMessage==null){
                Navigator.pushReplacementNamed(context, 'home');
              }else{
                print(errorMessage);
                NotificationsService.showSnackbar('El Correo o la Contraseña son incorrectas');
                loginForm.isLoging = false;
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              child: Text(
                loginForm.isLoging ?
                'Espere....'
                :
                'Acceder',
                style: const TextStyle(color: Colors.white),
              ),
            ) )
        ],
      )
      ,
      ),
    );
  }
}