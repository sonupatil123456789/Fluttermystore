import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mystore/App.dart';
import 'package:mystore/controllers/auth_controller.dart';
import 'package:mystore/controllers/cart_controller.dart';
import 'package:mystore/controllers/connectiviety_controller.dart';
import 'package:mystore/controllers/homescreen_controller.dart';
import 'package:mystore/controllers/product_controller.dart';
import 'package:mystore/utils/routes/routes.dart';
import 'package:mystore/utils/routes/routes_name.dart';
import 'package:mystore/view/onboardingscreen/onboarding_scree%20n.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider(
            create: (_) {
              return ConnectivityService().connectionStatusController.stream;
            },
            initialData: ConnectivityStatus.None),
        ChangeNotifierProvider(create: (context) => AuthController()),
        ChangeNotifierProvider(create: (context) => CartController()),
        ChangeNotifierProvider(create: (context) => ProductController()),
        ChangeNotifierProvider(create: (context) => HomeScreenController())
      ],
      child: MaterialApp(
        theme: ThemeData(primaryColor: Colors.amberAccent),
        title: 'My store',
        darkTheme: ThemeData.dark(),
        initialRoute: RoutesName.app,   
        onGenerateRoute: Routes.generateRoutes,
      ),
    );
  }
}
