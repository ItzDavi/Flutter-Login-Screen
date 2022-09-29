import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key, required this.title});

  final String title;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmUsernameController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool correctUsername = true;
  bool correctConfirmUsername = true;

  bool correctPassword = true;
  bool correctConfirmPassword = true;

  bool passwordToggle = false;
  bool passwordConfirmToggle = false;

  bool registered = false;

  bool backVisible = true;
  bool pressedBack = false;

  bool checkEmails() {
    bool flag = true;
    correctUsername = true;
    correctConfirmUsername = true;

    //Check first email
    if (usernameController.text.isEmpty) {
      flag = false;
      correctUsername = false;

    } else if (usernameController.text.length < 4) {
      flag = false;
      correctUsername = false;
    }

    //Check second email
    if (confirmUsernameController.text.isEmpty) {
      flag = false;
      correctConfirmUsername = false;

    } else if (confirmUsernameController.text.length < 4) {
      flag = false;
      correctConfirmUsername = false;
    }

    //Check first and second emails
    if (usernameController.text != confirmUsernameController.text) {
      flag = false;
      correctConfirmUsername = false;
    }

    return flag;
  }

  void setPressedBack() {
    pressedBack = true;
  }

  bool checkPasswords() {
    bool flag = true;
    correctPassword = true;
    correctConfirmPassword = true;

    //Check first password
    if (passwordController.text.isEmpty) {
      flag = false;
      correctPassword = false;

    }
    if (passwordController.text.length < 8) {
      flag = false;
      correctPassword = false;
    } else

      //Check second password
    if (confirmPasswordController.text.isEmpty) {
      flag = false;
      correctConfirmPassword = false;

    }
    if (confirmPasswordController.text.length < 8) {
      flag = false;
      correctConfirmPassword = false;
    }

    //Check first and second passwords
    if (confirmPasswordController.text.isEmpty) {
      flag = false;
      correctConfirmPassword = false;

    }

    return flag;
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
                  padding: const EdgeInsets.only(top: 110.0),
                  child: Hero(
                    tag: 'welcomeText',
                    child: Material(
                      child: AnimatedOpacity(
                        opacity: backVisible ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 500),
                        child: const Text(
                          'Welcome',
                          style: TextStyle(color: Colors.blue, fontSize: 40.0),
                        ),
                      ),
                    ),
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.only(top: 30)
                ),
                Column(
                    children: [
                      TextField(
                        controller: usernameController,
                        keyboardType: TextInputType.name,
                        style: TextStyle(
                            color: correctUsername ? Colors.blue : Colors.red
                        ),
                        decoration: InputDecoration(
                            hintText: 'Email',
                            hintStyle: TextStyle(
                                color: correctUsername ? Colors.blueGrey : Colors.red
                            ),
                            prefixIcon: Icon(
                                Icons.email_outlined,
                                color: correctUsername ? Colors.blue : Colors.red
                            ),
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
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: TextField(
                          controller: confirmUsernameController,
                          keyboardType: TextInputType.name,
                          style: TextStyle(
                              color: correctConfirmUsername ? Colors.blue : Colors.red
                          ),
                          decoration: InputDecoration(
                              hintText: 'Confirm email',
                              hintStyle: TextStyle(
                                  color: correctConfirmUsername ? Colors.blueGrey : Colors.red
                              ),
                              prefixIcon: Icon(
                                  Icons.email_outlined,
                                  color: correctConfirmUsername ? Colors.blue : Colors.red
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: correctConfirmUsername ? Colors.blue : Colors.red
                                  )
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: correctConfirmUsername ? Colors.blue : Colors.red
                                  )
                              )
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child:
                        Column(
                          children: [
                            Row(
                              children: [
                                Visibility(
                                    visible: !correctUsername,
                                    child: const Icon(Icons.error_outline, color: Colors.red,)
                                ),
                                Visibility(
                                  visible: !correctUsername,
                                  child: const Text(
                                    'Your email is not valid',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Visibility(
                                    visible: !correctConfirmUsername,
                                    child: const Icon(Icons.error_outline, color: Colors.red,)
                                ),
                                Visibility(
                                  visible: !correctConfirmUsername,
                                  child: const Text(
                                    'Check the confirmation email, something is wrong',
                                    style: TextStyle(color: Colors.red),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 40.0),
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
                                  hintStyle: TextStyle(
                                      color: correctPassword ? Colors.blueGrey : Colors.red
                                  ),
                                  prefixIcon: Icon(
                                    Icons.lock_outlined,
                                    color: correctPassword ? Colors.blue : Colors.red,
                                  ),
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
                            padding: const EdgeInsets.only(top: 12.0),
                            child: TextField(
                              controller: confirmPasswordController,
                              keyboardType: TextInputType.text,
                              textCapitalization: TextCapitalization.sentences,
                              obscureText: !passwordConfirmToggle,
                              style: TextStyle(
                                  color: correctConfirmPassword ? Colors.blue : Colors.red
                              ),
                              decoration: InputDecoration(
                                  hintText: 'Confirm password',
                                  hintStyle: TextStyle(
                                      color: correctConfirmPassword ? Colors.blueGrey : Colors.red
                                  ),
                                  prefixIcon: Icon(
                                    Icons.lock_outlined,
                                    color: correctConfirmPassword ? Colors.blue : Colors.red,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      passwordConfirmToggle ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                                      color: correctConfirmPassword ? Colors.blue : Colors.red,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        passwordConfirmToggle = !passwordConfirmToggle;
                                      });
                                    },
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: correctConfirmPassword ? Colors.blue : Colors.red
                                      )
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      borderSide: BorderSide(
                                          width: 2,
                                          color: correctConfirmPassword ? Colors.blue : Colors.red
                                      )
                                  )
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child:
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Visibility(
                                        visible: !correctPassword,
                                        child: const Icon(Icons.error_outline, color: Colors.red,)
                                    ),
                                    Visibility(
                                      visible: !correctPassword,
                                      child: const Text(
                                        'Your password is not valid, min. 8 characters',
                                        style: TextStyle(color: Colors.red),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Visibility(
                                        visible: !correctConfirmPassword,
                                        child: const Icon(Icons.error_outline, color: Colors.red,)
                                    ),
                                    Visibility(
                                      visible: !correctConfirmPassword,
                                      child: const Expanded(
                                        child: Text(
                                          'Check the confirmation password, something is wrong',
                                          style: TextStyle(color: Colors.red),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 40.0),
                            child: Hero(
                              tag: 'registerButton',
                              child: OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    bool emailsOkay = checkEmails();
                                    bool passwordsOkay = checkPasswords();

                                    if (emailsOkay && passwordsOkay) {
                                      registered = true;
                                    }
                                  });
                                },
                                style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                        const EdgeInsets.symmetric(horizontal: 111, vertical: 12)
                                    ),
                                    side: MaterialStateProperty.all(
                                        BorderSide(
                                          width: 1,
                                          color: registered ? Colors.green : Colors.blue,
                                          style: BorderStyle.solid,
                                        )
                                    ),
                                    backgroundColor: MaterialStateProperty.all<Color>(
                                        registered ? Colors.green : Colors.white
                                    ),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(18.0)
                                        )
                                    )
                                ),
                                child: Text(
                                  registered ? 'Open app' : 'Register',
                                  style: TextStyle(
                                      fontSize: 19.0,
                                      color: registered ? Colors.white : Colors.blue),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ]
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}