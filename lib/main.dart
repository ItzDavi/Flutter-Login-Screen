import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Login Screen'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  String username = '';
  String password = '';

  bool pressed = false;

  bool passwordToggle = false;

  bool correctUsername = true;
  bool correctPassword = true;

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
      body: GestureDetector(
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
              const Padding(
                padding: EdgeInsets.only(top: 120.0),
                child: Text(
                    'Welcome back',
                  style: TextStyle(color: Colors.blue, fontSize: 40.0),
                ),
              ),
              const Padding(
                  padding: EdgeInsets.only(top: 80)
              ),
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
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 80),
                        child:
                        ElevatedButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(horizontal: 80, vertical: 7)
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
    );
  }
}
