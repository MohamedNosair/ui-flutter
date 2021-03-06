
import 'package:flutter/material.dart';
import 'package:softscope/shared/components/conponents.dart';

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController() ;

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isPassword = true ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 35.0 ,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 30.0 ,
                  ),
                  defaultFormField(
                    controller: emailController ,
                    label: 'Email',
                    prefix: Icons.email ,
                    type: TextInputType.emailAddress,
                    validate: (String value)
                    {
                      if(value.isEmpty)
                      {
                       return 'email must not be empty ';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15.0 ,
                  ),
                  defaultFormField(
                    controller: passwordController ,
                    label: 'password',
                    prefix: Icons.lock ,
                    suffix:   isPassword ? Icons.visibility_off : Icons.visibility ,
                    type: TextInputType.visiblePassword,
                    isPassword: isPassword,
                    suffixPressed: ()
                    {
                      setState(() {
                        isPassword =! isPassword ;
                      });
                    },
                    validate: (String value)
                    {
                      if(value.isEmpty)
                      {
                        return 'password must not be empty ';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15.0 ,
                  ),
                  defaultButton(
                   radius: 5.0 ,
                    text: 'LOGIN',
                    function: ()
                    {
                      if(formKey.currentState!.validate())
                      {
                        print(passwordController.text);
                        print(emailController.text);
                      }
                    },
                  ),

                  SizedBox(
                    height: 10.0 ,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account? ',
                      ),
                      TextButton(
                          onPressed:(){},
                          child: Text(
                          'Register Now',
                          ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
