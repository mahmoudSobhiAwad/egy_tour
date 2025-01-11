import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
// import 'package:textfield_shadow/custom_textfield.dart';
// import 'package:url_launcher/url_launcher.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en', 'US'), Locale('ar', 'EG')],
        path: 'lang', // <-- change the path of the translation files
        fallbackLocale: Locale('en', 'US'),
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool hidden_pass = true;
  TextEditingController username_controller = TextEditingController();
  TextEditingController pass_controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 5,
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GradientText(tr('egy'),
                      style: const TextStyle(
                        fontSize: 40,
                      ),
                      colors: const [
                        Color(0xFFFF6FD8),
                        Color(0xFF3813C2),
                      ]),
                ),
                const SizedBox(
                  width: 147,
                ),
                IconButton(

                    //color: Color(0xFF3813C2),
                    onPressed: () {
                      changeLang();
                    },
                    icon: const Icon(
                      Icons.blur_circular_sharp,
                      color: Color(0xFF3813C2),
                    )),
              ],
            ),
          ),
          // const SizedBox(
          //   height: 40,
          // ),
          Padding(
            padding: const EdgeInsets.only(
              top: 40,
            ),
            child: Center(
              child: Text(
                tr('welcome_message'),
                style: const TextStyle(fontSize: 30),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              textAlign: TextAlign.center,
              tr('descrption'),
              style: const TextStyle(
                fontSize: 10,
                color: Color(0xFF9A9A9A),
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: username_controller,
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 6) {
                        return tr('warning_user');
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 2, //<-- SEE HERE
                            color: Color.fromARGB(255, 208, 215, 212),
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            width: 1, //<-- SEE HERE
                            color: Color.fromARGB(255, 208, 215, 212),
                          ),
                        ),
                        prefixIcon: const Icon(
                          color: Color.fromARGB(255, 129, 128, 128),
                          Icons.person,
                        ),
                        labelText: tr('user'),
                        labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 172, 179, 176),
                        )),

                    // onChanged: (value) {
                    //   user_name = value;
                    // },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: pass_controller,
                    obscureText: hidden_pass,
                    validator: (value) {
                      // if (value == null || value.isEmpty) {
                      //   return 'please enter your password';
                      // } else
                      if (value != null && value.length < 6) {
                        return tr('warning_pass');
                      }
                      return null;
                    },
                    // onChanged: (value) {
                    //   pass = value;
                    // },

                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 2, //<-- SEE HERE
                            color: Color.fromARGB(255, 208, 215, 212),
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            width: 1, //<-- SEE HERE
                            color: Color.fromARGB(255, 208, 215, 212),
                          ),
                        ),
                        labelText: tr('pass'),
                        labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 172, 179, 176),
                        ),
                        prefixIcon: const Icon(
                          color: Color.fromARGB(255, 129, 128, 128),
                          Icons.lock,
                        ),
                        suffixIcon: IconButton(
                            color: Colors.grey,
                            onPressed: () {
                              togglePassword();
                            },
                            icon: Icon(hidden_pass
                                ? Icons.visibility
                                : Icons.visibility_off))),
                  ),
                ),
                // const SizedBox(
                //   height: 75,
                // ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 75,
                  ),
                  child: SizedBox(
                      width: 300,
                      height: 60,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            // styling the button

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.all(20),
                            backgroundColor:
                                const Color(0xFF3813C2), // Button color
                          ),
                          onPressed: () {
                            debugPrint(username_controller.text);
                            debugPrint(pass_controller.text);
                            if (_formKey.currentState!.validate()) {
                              //debugPrint('you are logged');
                              SnackBar snackBar = SnackBar(
                                content: Text(tr('logged')),
                                backgroundColor: Colors.green,
                                duration: const Duration(seconds: 2),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => SecondScreen()),
                              // );
                            } else {
                              SnackBar snackBar = SnackBar(
                                content: Text(tr('not_logged')),
                                backgroundColor: Colors.red,
                                duration: const Duration(seconds: 2),
                                action: SnackBarAction(
                                    label: "ok", onPressed: () {}),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          },
                          child: Text(tr('log'),
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              )))),
                ),
                // const SizedBox(
                //   height: 20,
                // ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: Center(
                    child: Text(
                      tr('no_account'),
                      //textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Center(
                  child: InkWell(
                      child: Text(
                        tr('acc'),
                        //textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      onTap: ()
                          // {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(builder: (context) => SecondScreen()),
                          //   );
                          // }
                          =>
                          ('https://www.youtube.com/')),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  togglePassword() {
    hidden_pass = !hidden_pass;
    setState(() {});
  }

  changeLang() {
    if (context.locale == const Locale('en', 'US')) {
      context.setLocale(const Locale('ar', 'EG'));
    } else {
      context.setLocale(const Locale('en', 'US'));
    }
  }
}
