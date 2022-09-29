import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.title});

  final String title;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  String username = '';
  String password = '';

  bool backVisible = true;

  bool pressed = false;
  bool pressedBack = false;

  bool passwordToggle = false;

  bool correctUsername = true;
  bool correctPassword = true;

  void setPressedBack() {
    pressedBack = true;
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool checkInputs() {
    bool flag = true;
    correctUsername = true;
    correctPassword = true;

    if (usernameController.text.isEmpty) {
      flag = false;
      correctUsername = false;

    } else if (usernameController.text.length < 4) {
      flag = false;
      correctUsername = false;
    }

    if (passwordController.text.isEmpty) {
      flag = false;
      correctPassword = false;

    } else if (passwordController.text.length < 8) {
      flag = false;
      correctPassword = false;
    }

    return flag;
  }

  void welcomeUser() {
    username = usernameController.text;
    password = passwordController.text;

    pressed  = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      setPressedBack();
                      Navigator.pop(context);
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back,
                          color: pressedBack ? Colors.blueGrey : Colors.blue,),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Text(
                            'Go back',
                            style: TextStyle(
                                color: pressedBack ? Colors.blueGrey : Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 120.0),
                  child: Hero(
                    tag: 'welcomeText',
                    child: Material(
                      child: AnimatedOpacity(
                        opacity: backVisible ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 500),
                        child: const Text(
                          'Welcome back',
                          style: TextStyle(color: Colors.blue, fontSize: 40.0),
                        ),
                      ),
                    ),
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.only(top: 80)
                ),
                Column(
                  children: [
                    TextField(
                        controller: usernameController,
                        keyboardType: TextInputType.name,
                        textCapitalization: TextCapitalization.sentences,
                        style: TextStyle(
                            color: correctUsername ? Colors.blue : Colors.red
                        ),
                        decoration: InputDecoration(
                            hintText: 'Email',
                            hintStyle: TextStyle(color: correctUsername ? Colors.blueGrey : Colors.red),
                            prefixIcon: Icon(Icons.email_outlined, color: correctUsername ? Colors.blue : Colors.red),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: correctUsername ? Colors.blue : Colors.red
                                )
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(
                                    width: 2,
                                    color: correctUsername ? Colors.blue : Colors.red
                                )
                            )
                        )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: [
                          Visibility(
                            visible: !correctUsername,
                            child: const Icon(Icons.error_outline, color: Colors.red,),
                          ),
                          Visibility(
                            visible: !correctUsername,
                            child: const Text('The email must be valid', style: TextStyle(color: Colors.red),),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextField(
                        controller: passwordController,
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.sentences,
                        obscureText: !passwordToggle,
                        style: TextStyle(
                            color: correctPassword ? Colors.blue : Colors.red
                        ),
                        decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(color: correctPassword ? Colors.blueGrey : Colors.red),
                            prefixIcon: Icon(Icons.lock_outlined,  color: correctPassword ? Colors.blue : Colors.red,),
                            suffixIcon: IconButton(
                              icon: Icon(
                                passwordToggle ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                                color: correctPassword ? Colors.blue : Colors.red,
                              ),
                              onPressed: () {
                                setState(() {
                                  passwordToggle = !passwordToggle;
                                });
                              },
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: correctPassword ? Colors.blue : Colors.red
                                )
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(
                                    width: 2,
                                    color: correctPassword ? Colors.blue : Colors.red
                                )
                            )
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child:
                      Row(
                        children: [
                          Visibility(
                              visible: !correctPassword,
                              child: const Icon(Icons.error_outline, color: Colors.red,)
                          ),
                          Visibility(
                            visible: !correctPassword,
                            child: const Text('The password lengths must be greater than 8 characters', style: TextStyle(color: Colors.red),),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 80),
                          child:
                          Hero(
                            tag: 'loginButton',
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.symmetric(horizontal: 120, vertical: 8)
                                  ),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(18.0),
                                          side: const BorderSide(color: Colors.blue)
                                      )
                                  )
                              ),
                              onPressed: () {
                                setState(() {
                                  if (checkInputs()) {
                                    welcomeUser();
                                    usernameController.clear();
                                    passwordController.clear();
                                  }
                                });
                              },
                              child: const Text('Login', style: TextStyle(fontSize: 20.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Padding(padding: EdgeInsets.only(top: 80.0)),
                        Visibility(
                          visible: pressed,
                          child:
                          Text('Welcome $username'),
                        ),
                        Visibility(
                          visible: pressed,
                          child:
                          Text('Password: $password'),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}