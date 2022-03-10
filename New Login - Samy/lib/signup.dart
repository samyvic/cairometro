import 'package:firebase_auth/firebase_auth.dart';

//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  var loading = false;
  //password variables
  bool hidePassword = true;
  bool obscure = true;
  Icon icon = Icon(Icons.visibility);

  // Initially password is obscure
  bool _isObscure = true;


  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
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
                    const Text("Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    const Text("Create a new account",
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
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      children: [

                        _TextField(label: 'Name', controller: _nameController,
                          validator: _requiredValidator,
                          prefixIcon: Icon(Icons.person,),
                        ),
                        const SizedBox(height: 15.0,),
                        _TextField(label: 'Email', controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: _requiredValidator,
                          prefixIcon: Icon(Icons.mail,),
                        ),
                        const SizedBox(height: 15.0,),
                        _TextField(label: 'Password', controller: _passwordController,
                          validator: _requiredValidator,
                          password: true,
                          prefixIcon: Icon(Icons.lock,),
                          // suffixIcon: IconButton(
                          //   icon: hidePassword
                          //       ? Icon(Icons.visibility_off)
                          //       : Icon(Icons.visibility),
                          //   onPressed: () {
                          //     setState(() {
                          //       hidePassword = !hidePassword;
                          //       if (obscure == true) {
                          //         obscure = false;
                          //         icon = Icon(Icons.visibility_off);
                          //       } else {
                          //         obscure = true;
                          //         icon = Icon(Icons.visibility);
                          //       }
                          //     });
                          //   },
                          //
                          // ),
                        ),
                        const SizedBox(height: 15.0,),
                        _TextField(label: 'Confirm Password', controller: _confirmPasswordController,
                          validator: _confirmPasswordValidator,
                          password: true,
                          prefixIcon: Icon(Icons.lock,),
                        ),
                        const SizedBox(height: 20.0,),
                        Container(
                          width: w,
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context,
                                  "Register"
                              );
                            },
                            child: const Text("Forgot your password?",
                              style: TextStyle(
                                color: Colors.blue,
                              ),

                            ),
                          ),
                        ),
                        const SizedBox(height: 60.0,),
                        if(loading) ...[
                          Center(child: CircularProgressIndicator()),
                        ],
                        if (!loading) ...[
                          RawMaterialButton(
                            onPressed: (){
                              if(_formKey.currentState != null && _formKey.currentState!.validate()){
                                //_signUp();
                              }
                            },
                            fillColor: const Color(0xFF0069FE),
                            elevation: 0.0,
                            padding: const EdgeInsets.symmetric(vertical: 20.0),

                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                            child: const Text("Create",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                            ),
                          )
                        ],
                        const SizedBox(height: 40.0,),
                        Container(
                          width: w,
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context,
                                  "Login"
                              );
                            },
                            child: const Text("Already have an account? Login",
                              style: TextStyle(
                                color: Colors.blue,
                              ),

                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

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
  // Future _signUp() async{
  //   try{
  //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: _emailController.text,
  //       password: _passwordController.text,
  //     );
  //     // await FirebaseFirestore.instance.collection('users').add({
  //     //   'email': _emailController.text,
  //     //   'name': _nameController.text,
  //     //
  //     // });
  //     await showDialog(context: context, builder: (context) => AlertDialog(
  //       title: Text('Sign up succedded'),
  //       content: Text('Your account is created, you can login now!'),
  //       actions: [
  //         TextButton(onPressed: (){
  //           Navigator.of(context).pop();
  //         }, child: Text('Ok'))
  //       ],
  //     ));
  //     Navigator.of(context).pop();
  //   } on FirebaseAuthException catch(e){
  //     _handleSignUpError(e);
  //     setState(() {
  //       loading = false;
  //     });
  //   }
  // }
  // void _handleSignUpError(FirebaseAuthException e){
  //   String messageToDisplay;
  //   switch (e.code){
  //     case 'email-already-in-use':
  //       messageToDisplay = 'This email is already in use';
  //       break;
  //     case 'invalid-email':
  //       messageToDisplay = 'This email is invalid';
  //       break;
  //     case 'operation-not-allowed':
  //       messageToDisplay = 'This operation is not allowed';
  //       break;
  //     case 'weak-password':
  //       messageToDisplay = 'The password you entered is weak';
  //       break;
  //     default:
  //       messageToDisplay = 'An unknown error occurred';
  //       break;
  //   }
  //   showDialog(context: context, builder: (context) => AlertDialog(
  //     title: Text('Sign up failed'),
  //     content: Text(messageToDisplay),
  //     actions: [
  //       TextButton(onPressed: (){
  //         Navigator.of(context).pop();
  //       }, child: Text('Ok'))
  //     ],
  //   ));
  // }
}


class _TextField extends StatelessWidget {
  //const _TextField({Key? key}) : super(key: key);
  final TextEditingController controller;
  final String label;
  final bool password;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final Widget? prefixIcon;
  //final Widget? suffixIcon;

  const _TextField({
    required this.label,
    required this.controller,
    this.validator,
    this.password = true,
    this.keyboardType,
    this.prefixIcon,
    //this.suffixIcon,

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
          //suffixIcon: suffixIcon,
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




