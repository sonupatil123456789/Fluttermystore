import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mystore/controllers/auth_controller.dart';
import 'package:mystore/controllers/brand_controller.dart';
import 'package:mystore/controllers/cart_controller.dart';
import 'package:mystore/controllers/category_controller.dart';
import 'package:mystore/controllers/connectiviety_controller.dart';
import 'package:mystore/controllers/order_controller.dart';
import 'package:mystore/controllers/product_controller.dart';
import 'package:mystore/utils/constants/colorpallets.dart';
import 'package:mystore/utils/routes/routes.dart';
import 'package:mystore/utils/routes/routes_name.dart';
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
        ChangeNotifierProvider(create: (context) => CategoryController()),
        ChangeNotifierProvider(create: (context) => BrandController()),
        ChangeNotifierProvider(create: (context) => OrderController()),
        ChangeNotifierProvider(create: (context) => TheamColors())
      ],
      child: MaterialApp(
        theme: ThemeData(),
        // title: 'My store',
        // darkTheme: ThemeData.dark(),
        initialRoute: RoutesName.app,
        onGenerateRoute: Routes.generateRoutes,
      ),
    );
  }
}
