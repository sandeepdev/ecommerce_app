import 'package:buy_india_app/blocs/cart/cart_bloc.dart';
import 'package:buy_india_app/blocs/category/category_bloc.dart';
import 'package:buy_india_app/blocs/checkout/checkout_bloc.dart';
import 'package:buy_india_app/blocs/product/product_bloc.dart';
import 'package:buy_india_app/blocs/whishlist/whishlist_bloc.dart';
import 'package:buy_india_app/config/app_router.dart';
import 'package:buy_india_app/config/theme.dart';
import 'package:buy_india_app/presentations/allScreens/all_screens.dart';
import 'package:buy_india_app/repositories/category/category_repository.dart';
import 'package:buy_india_app/repositories/checkout/checkout_repository.dart';
import 'package:buy_india_app/repositories/product/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => CheckoutBloc(
                cartbloc: context.read<CartBloc>(),
                checkoutrepository: CheckoutRepository())),
        BlocProvider(
          create: (_) => CartBloc()..add(CartStarted()),
        ),
        BlocProvider(
          create: (_) => WhishlistBloc()..add(StartwhisList()),
        ),
        BlocProvider(
            create: (_) => ProductBloc(productRepository: ProductRepository())
              ..add(LoadProduct())),
        BlocProvider(
          create: (_) => CategoryBloc(categoryRepository: CategoryRepository())
            ..add(LoadCategory()),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: CheckoutScreen.routeName,
        home: const HomeScreen(),
      ),
    );
  }
}
