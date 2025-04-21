
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/repository/movies_api/product_repository.dart';
import 'package:task/repository/movies_api/product_repository_impl.dart';

import 'bloc/productBloc/product_bloc.dart';
import 'configs/routes/routes.dart';
import 'configs/routes/routes_name.dart';
import 'configs/theme/app_theme_data.dart';
void main()async {


  runApp(const MyApp()); // Running the application
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}); // Constructor for MyApp widget

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(

      providers: [
        BlocProvider(create: (context) => ProductBloc(productRepository: ProductRepositoryImpl()),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light, // Setting theme mode to dark
        theme: AppThemeData.lightThemeData, // Setting light theme
        darkTheme: AppThemeData.darkThemeData, // Setting dark theme      title: 'task',

        initialRoute: RoutesName.home, // Initial route
        onGenerateRoute: Routes.generateRoute, // Generating routes
      ),
    );
  }
}


