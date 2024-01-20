import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kirna_store_app/core/services/firebase_service/firebase_auth_service.dart';
import 'package:kirna_store_app/core/services/pakage_info/pakage_info_service.dart';
import 'package:kirna_store_app/feature/authentication/presentation/choose_auth_screen.dart';
import 'package:kirna_store_app/feature/authentication/presentation/manager/phone_authentication_notifier.dart';
import 'package:kirna_store_app/feature/home_screen/presentation/home_screen.dart';
import 'package:kirna_store_app/feature/home_screen/presentation/manager/product_category.dart';
import 'package:kirna_store_app/feature/home_screen/presentation/widget/checkout_button.dart';
import 'package:kirna_store_app/feature/order_summary/presentation/manager/order_history_manager.dart';
import 'package:kirna_store_app/feature/order_summary/presentation/manager/order_summary_manager.dart';
import 'package:kirna_store_app/feature/product_subcategory/presentation/manager/product_sub_category.dart';
import 'package:kirna_store_app/feature/product_view/presentation/manager/product_list_notifier.dart';
import 'package:kirna_store_app/feature/profile/presentation/profile.dart';
import 'package:kirna_store_app/feature/user_details/presentation/manager/location_manager.dart';
import 'package:kirna_store_app/feature/user_details/presentation/manager/user_manager.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseAuthenticationService.initializeValue();
  await FirebaseAuthenticationService.fetchRemoteConfigDetails();
  await dotenv.load(fileName: ".env");
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
        ChangeNotifierProvider<OrderSummaryNotifier>(
            create: (context) => OrderSummaryNotifier()),
        ChangeNotifierProvider<ProductListNotifier>(
            create: (context) => ProductListNotifier()),
        ChangeNotifierProvider<LocationManagerNotifer>(
            create: (context) => LocationManagerNotifer()),
        ChangeNotifierProvider<GetUserLocationNotifier>(
            create: (context) => GetUserLocationNotifier()),
        ChangeNotifierProvider<OrderHistoryNoitifier>(
            create: (context) => OrderHistoryNoitifier()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          }),
          useMaterial3: true,
        ),
        home: StreamBuilder<User?>(
          stream: FirebaseAuthenticationService.auth?.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const MyHomePage();
            }
            return PhoneNumberVerification();
          },
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PakageInfoService _pakageInfoService = new PakageInfoService();
  @override
  void initState() {
    initilaizePakageInfo();
    super.initState();
  }

  void initilaizePakageInfo() async {
    await _pakageInfoService.initializePakageValue();
    _pakageInfoService.showDialogBox(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      /* appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.blue.shade300,
        title: Text(
         'SHRI SHYAM STORE',
          style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.account_circle,
              size: 32,
              color: Colors.white,
            ),
            onPressed: () {
          
              Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>  const MyProfilePageScreen()));
            },
          ),
        ],
      ), */

      floatingActionButton: const CheckOutFloatingButton(),

      body: const HomeScreen(),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
