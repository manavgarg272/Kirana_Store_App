import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kirna_store_app/feature/authentication/presentation/choose_auth_screen.dart';
import 'package:kirna_store_app/feature/authentication/presentation/manager/phone_authentication_notifier.dart';
import 'package:kirna_store_app/feature/home_screen/presentation/home_screen.dart';
import 'package:kirna_store_app/feature/home_screen/presentation/manager/product_category.dart';
import 'package:kirna_store_app/feature/home_screen/presentation/widget/checkout_button.dart';
import 'package:kirna_store_app/feature/product_subcategory/presentation/manager/product_sub_category.dart';
import 'package:kirna_store_app/feature/product_view/presentation/manager/product_list_notifier.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PhoneAuthenticationNotifier>(
            create: (context) => PhoneAuthenticationNotifier()),
        ChangeNotifierProvider<ProductCategoryNotifier>(
            create: (context) => ProductCategoryNotifier()),

            ChangeNotifierProvider<SubCategoryNotifier>(
              create: (context) => SubCategoryNotifier()),

              
            ChangeNotifierProvider<ProductListNotifier>(
              create: (context) => ProductListNotifier()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: FirebaseAuth.instance.currentUser != null
            ? const MyHomePage(title: 'Kirana Store App')
            : const PhoneNumberVerification(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
          widget.title,
          style: GoogleFonts.lobster(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const PhoneNumberVerification()));
            },
          ),
        ],
      ),

      floatingActionButton: CheckOutFloatingButton(),

      body: const HomeScreen(),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
