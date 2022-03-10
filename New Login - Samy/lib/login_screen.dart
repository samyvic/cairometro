import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_login/profile_screen.dart';
//import 'package:new_login/register_screen.dart';
import 'package:flutter/material.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  //login function
  static Future<User?> loginUsingEmailPassword({required String email, required String password, required BuildContext context}) async{
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try{
      UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e){
      if(e.code == "user-not-found"){
        print("No user found for that email");
      }
    }
    return user;

  }
  //password variables
  bool hidePassword = true;
  bool obscure = true;
  Icon icon = Icon(Icons.visibility);
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    // Create the textfield controller
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: w,
          maxHeight: h,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Colors.cyan,
            ],
            begin: Alignment.topLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex:2,

              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 36.0, horizontal: 24.0,

                ),

                child: Column(

                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                     const Text("Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    const Text("Enter to Cairo Metro",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                child: Padding(

                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        _TextField(label: 'Email', controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: _requiredValidator,
                          prefixIcon: Icon(Icons.mail,),
                        ),
                        const SizedBox(height: 15.0),
                        // _TextField(label: 'Password', controller: _passwordController,
                        //   validator: _requiredValidator,
                        //   password: true,
                        //   prefixIcon: Icon(Icons.lock,),
                        //   suffixIcon: IconButton(
                        //     icon: hidePassword
                        //         ? Icon(Icons.visibility_off)
                        //         : Icon(Icons.visibility),
                        //     onPressed: () {
                        //       setState(() {
                        //         hidePassword = !hidePassword;
                        //         if (obscure == true) {
                        //           obscure = false;
                        //           icon = Icon(Icons.visibility_off);
                        //         } else {
                        //           obscure = true;
                        //           icon = Icon(Icons.visibility);
                        //         }
                        //       });
                        //     },
                        //
                        //   ),
                        // ),

                        TextField(
                          controller: _passwordController,
                          obscureText: obscure,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: hidePassword
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                  if (obscure == true) {
                                    obscure = false;
                                    icon = Icon(Icons.visibility_off);
                                  } else {
                                    obscure = true;
                                    icon = Icon(Icons.visibility);
                                  }
                                });
                              },

                            ),
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                            hintText: 'Enter Your Password',
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        GestureDetector(

                          onTap: () {
                            Navigator.pushReplacementNamed(
                              context,
                              "Register"
                            );
                          },
                          child: const Text("Create new account?",
                            style: TextStyle(
                              color: Colors.blue,
                            ),

                          ),
                        ),
                        const SizedBox(height: 88.0),
                        Container(
                          child: RawMaterialButton(
                            fillColor: const Color(0xFF0069FE),
                            elevation: 0.0,
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                            onPressed: () async{
                              // Let's test the app
                              User? user = await loginUsingEmailPassword(email: _emailController.text, password: _passwordController.text, context: context);
                              print(user);
                              if(user != null){
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> ProfileScreen()));
                                //Let's make a new screen
                              }
                            },
                            child: const Text("Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                ),
              ),
            ),
          //   Container(
          //
          //     child: Padding(
          //
          //       padding: const EdgeInsets.all(20.0),
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //
          //           TextField(
          //             controller: _emailController,
          //             keyboardType: TextInputType.emailAddress,
          //             decoration: const InputDecoration(
          //                 border: OutlineInputBorder(),
          //                 labelText: 'Email',
          //                 hintText: "User Email",
          //                 prefixIcon: Icon(Icons.mail,color: Colors.black)
          //             ),
          //           ),
          //           const SizedBox(height: 26.0),
          //           TextField(
          //             controller: _passwordController,
          //             obscureText: obscure,
          //             decoration: InputDecoration(
          //               prefixIcon: Icon(Icons.lock),
          //               suffixIcon: IconButton(
          //                 icon: hidePassword
          //                     ? Icon(Icons.visibility_off)
          //                     : Icon(Icons.visibility),
          //                 onPressed: () {
          //                   setState(() {
          //                     hidePassword = !hidePassword;
          //                     if (obscure == true) {
          //                       obscure = false;
          //                       icon = Icon(Icons.visibility_off);
          //                     } else {
          //                       obscure = true;
          //                       icon = Icon(Icons.visibility);
          //                     }
          //                   });
          //                 },
          //
          //               ),
          //               border: OutlineInputBorder(),
          //               labelText: 'Password',
          //               hintText: 'Enter Your Password',
          //             ),
          //           ),
          //           const SizedBox(height: 12.0),
          //           const Text("Don't Remember your Password?",
          //             style: TextStyle(
          //               color: Colors.blue,
          //             ),
          //           ),
          //           const SizedBox(height: 88.0),
          //           Container(
          //             width: double.infinity,
          //             child: RawMaterialButton(
          //               fillColor: const Color(0xFF0069FE),
          //               elevation: 0.0,
          //               padding: const EdgeInsets.symmetric(vertical: 20.0),
          //               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          //               onPressed: () async{
          //                 // Let's test the app
          //                 User? user = await loginUsingEmailPassword(email: _emailController.text, password: _passwordController.text, context: context);
          //                 print(user);
          //                 if(user != null){
          //                   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> ProfileScreen()));
          //                   //Let's make a new screen
          //                 }
          //               },
          //               child: const Text("Login",
          //                 style: TextStyle(
          //                   color: Colors.white,
          //                   fontSize: 18.0,
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ],
          //       )
          // ),
          //   ),
          ],

        ),
      ),
    )
    );
  }
  String? _requiredValidator(String? text){
    if(text == null || text.trim().isEmpty){
      return 'This field is required';
    }
    return null;
  }
  String? _confirmPasswordValidator(String? confirmPasswordText){
    if(confirmPasswordText == null || confirmPasswordText.trim().isEmpty){
      return 'This field is required';
    }
    if(_passwordController.text != confirmPasswordText){
      return "Password doesn't match";
    }
    return null;
  }
}


class _TextField extends StatelessWidget {
  //const _TextField({Key? key}) : super(key: key);
  final TextEditingController controller;
  final String label;
  final bool password;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const _TextField({
    required this.label,
    required this.controller,
    this.validator,
    this.password = false,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 0),
      child: TextFormField(

        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          enabledBorder: const OutlineInputBorder(
            // width: 0.0 produces a thin "hairline" border
            borderSide: const BorderSide(color: Color(0xFFf7f7f7), width: 0.0),
          ),
          border: const OutlineInputBorder(),
          labelStyle: new TextStyle(color: Color(0xFF737373)),
          filled: true,
          fillColor: Color(0xFFf7f7f7),
        ),
        keyboardType: keyboardType,
        obscureText: password,
        validator: validator,
      ),
    );
  }
}
