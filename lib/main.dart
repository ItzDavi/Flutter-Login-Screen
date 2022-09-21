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
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Text(
                  'Benvenuto',
                style: TextStyle(color: Colors.blue, fontSize: 24.0),
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
                hintText: 'Inserisci l\'username',
                hintStyle: TextStyle(color: correctUsername ? Colors.blueGrey : Colors.red),
                prefixIcon: Icon(Icons.person, color: correctUsername ? Colors.blue : Colors.red),
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
                    hintText: 'Inserisci la password',
                    hintStyle: TextStyle(color: correctPassword ? Colors.blueGrey : Colors.red),
                    prefixIcon: Icon(Icons.lock,  color: correctPassword ? Colors.blue : Colors.red,),
                    suffixIcon: IconButton(
                      icon: Icon(
                        passwordToggle ? Icons.visibility_off : Icons.visibility,
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
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: OutlinedButton.icon(
                    onPressed: () {
                      setState(() {
                        if (checkInputs()) {
                          welcomeUser();
                          usernameController.clear();
                          passwordController.clear();
                        }
                      });
                    },
                    icon: const Icon(Icons.check, size: 18,),
                    label: const Text('Login'),
                    style: OutlinedButton.styleFrom(
                      elevation: 2.0,
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Colors.blue, width: 1)
                    ),
                  ),
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
    );
  }
}
