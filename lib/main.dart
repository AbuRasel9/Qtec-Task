
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/bloc/login_bloc/auth_bloc.dart';

import 'configs/routes/routes.dart';
import 'configs/routes/routes_name.dart';
import 'configs/theme/app_theme_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp()); // Running the application
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}); // Constructor for MyApp widget

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(

      providers: [
        BlocProvider(create: (context) => AuthBloc(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light, // Setting theme mode to dark
        theme: AppThemeData.lightThemeData, // Setting light theme
        darkTheme: AppThemeData.darkThemeData, // Setting dark theme      title: 'task',

        initialRoute: RoutesName.splash, // Initial route
        onGenerateRoute: Routes.generateRoute, // Generating routes
      ),
    );
  }
}


