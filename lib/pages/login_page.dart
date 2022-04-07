import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skilled_tasker/Models/login_response.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:skilled_tasker/bloc/api_bloc.dart';
import 'package:skilled_tasker/controller/comman_dailog.dart';
import 'package:skilled_tasker/pages/home_page.dart';
import 'package:skilled_tasker/pages/register_page.dart';
import 'package:skilled_tasker/util/shar_prefreances.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //sf = SharePref();

    bloc.login.listen((event) {
      // print(event.result.data.accessToken);
      if (event.success) {
        saveData(event);
      } else {
        Fluttertoast.showToast(msg: event.result.message.toString());
      }
    });
  }

  googleLogin() async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      var result = await _googleSignIn.signIn();
      print(result!.displayName);
      print(result.email);
      print(result.photoUrl);
      if (result != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomaPage()));
      }
    } catch (error) {
      print(error);
    }
  }

  facebookLogin() async {
    print("FaceBook");
    try {
      final result =
          await FacebookAuth.i.login(permissions: ['public_profile', 'email']);
      if (result.status == LoginStatus.success) {
        final userData = await FacebookAuth.i.getUserData();
        print(userData);
      }
    } catch (error) {
      print(error);
    }
  }

  Future saveData(LoginResponse e) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('token', e.result.data.accessToken);
    preferences.setInt("id", e.result.data.id);
    //print(preferences.getString('token'));
    if (e.success) {
      CommanDialog.hideLoading();
      Get.off(HomaPage());
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => HomaPage()));
    } else {
      Fluttertoast.showToast(msg: e.result.message.toString());
    }
  }

  void validation() async {
    if (formkey.currentState!.validate()) {
      //  Fluttertoast.showToast(msg: "Valid");

      Map<String, dynamic> map = {
        'usernameOrEmailAddress': _email.text.toString().trim(),
        'password': _password.text.toString().trim(),
        'rememberMe': true
      };

      bloc.loginApi(map);

      // LoginResponse value = bloc.loginApi(map);
      // if (value.success) {
      //   Navigator.push(
      //       context, MaterialPageRoute(builder: (context) => HomaPage()));
      // } else {
      //   Fluttertoast.showToast(msg: value.error.toString());
      // }
    }
  }

//  login(String usernameOrEmailAddress, password) async {
//     try {
//        return await   http.post(
//         Uri.parse(
//           'http://api.skilledtasker.com.preview.my-hosting-panel.com/api/TokenAuth/Login',
//         ),
//         headers: {"content-type": "application/json-path+json"},
//         body: jsonEncode({
//           'password': password,
//           'usernameOrEmailAddress': usernameOrEmailAddress,
//           'rememberMe': true
//         }),
//       );

//       // if (response.statusCode == 200) {
//       //   Fluttertoast.showToast(msg: "Sucessfully login");
//       // } else {
//       //   Fluttertoast.showToast(msg: "Log in issue");
//       // }
//     } catch (e) {
//       // ignore: avoid_print
//       print(e.toString());
//     }
//   }

  @override
  Widget build(BuildContext context) {
    MainAxisAlignment.spaceEvenly;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  "assets/images/icon.png",
                  fit: BoxFit.cover,
                  height: 300,
                  width: 300,
                ),
                Column(
                  children: [
                    const SizedBox(height: 30.0),
                    const Text(
                      "Earn money, socialize and have fun at the same time",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    const SizedBox(height: 30.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 32),
                      child: Form(
                        key: formkey,
                        autovalidateMode: AutovalidateMode.always,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _email,
                              decoration: const InputDecoration(
                                hintText: "Enter Email",
                                labelText: "UserEmail",
                                focusColor: Colors.green,
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.green)),
                                border: OutlineInputBorder(),
                              ),
                              validator: MultiValidator([
                                RequiredValidator(errorText: "Required*"),
                                EmailValidator(
                                    errorText: "Please enter valid email")
                              ]),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: _password,
                              obscureText: true,
                              decoration: const InputDecoration(
                                  hintText: "Enter Password",
                                  labelText: "Password",
                                  border: OutlineInputBorder()),
                              validator: MultiValidator([
                                RequiredValidator(errorText: "Requires*"),
                                MaxLengthValidator(15,
                                    errorText:
                                        "Maximum length of password is 15"),
                                MinLengthValidator(6,
                                    errorText: "Minmum length of password is 6")
                              ]),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            CommanDialog.showLoading();
                            validation();
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => HomaPage()));
                          },
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 2),
                            width: 150,
                            height: 50,
                            alignment: Alignment.center,
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),

                        const SizedBox(
                          width: 10,
                        ),
                        // ElevatedButton(
                        //   onPressed: () {},
                        //   child: const Text("Forget Password?"),
                        //   style: TextButton.styleFrom(
                        //       maximumSize: const Size(180, 40),
                        //       backgroundColor: Colors.grey),
                        // ),
                        InkWell(
                          child: Container(
                            width: 150,
                            height: 50,
                            alignment: Alignment.center,
                            child: const Text(
                              "Forget Password?",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Or connect with",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              googleLogin();
                            },
                            child: Image.asset(
                              "assets/images/GoogleIcon.png",
                              height: 40,
                              width: 40,
                            ),
                          ),
                          const SizedBox(width: 15),
                          InkWell(
                            onTap: facebookLogin,
                            child: Image.asset(
                              "assets/images/Fb.png",
                              height: 40,
                              width: 40,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Continue as guest"),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          CupertinoIcons.arrow_right,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        const SizedBox(width: 10),
                        InkWell(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Register()),
                              (Route<dynamic> route) => false,
                            );
                          },
                          child: Text(
                            "Sing?",
                            style: TextStyle(color: Colors.green[300]),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // login() async {
  //   Map map = {
  //     "usernameOrEmailAddress": _email.text,
  //     "password": _password.text
  //   };
  //   LoginController controler = LoginController();
  //   final data = await controler.userLogin(map);
  //   print(data);

  //   if (data["result"]["succes"]) {
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => HomaPage()));
  //   }
  // }
}

class HomePage {}
