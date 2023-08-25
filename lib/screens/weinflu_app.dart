//.....................................................................................
// ██╗    ██╗███████╗██╗███╗   ██╗███████╗██╗     ██╗   ██╗     █████╗ ██████╗ ██████╗ 
// ██║    ██║██╔════╝██║████╗  ██║██╔════╝██║     ██║   ██║    ██╔══██╗██╔══██╗██╔══██╗
// ██║ █╗ ██║█████╗  ██║██╔██╗ ██║█████╗  ██║     ██║   ██║    ███████║██████╔╝██████╔╝
// ██║███╗██║██╔══╝  ██║██║╚██╗██║██╔══╝  ██║     ██║   ██║    ██╔══██║██╔═══╝ ██╔═══╝ 
// ╚███╔███╔╝███████╗██║██║ ╚████║██║     ███████╗╚██████╔╝    ██║  ██║██║     ██║     
//  ╚══╝╚══╝ ╚══════╝╚═╝╚═╝  ╚═══╝╚═╝     ╚══════╝ ╚═════╝     ╚═╝  ╚═╝╚═╝     ╚═╝     
//.....................................................................................

import 'package:flutter/material.dart';
import 'package:weinflu/config/app_routes.dart';
import 'package:weinflu/design/design.dart';
import 'package:weinflu/models/user.dart';
import 'package:weinflu/screens/screens.dart';

class WeinfluApp extends StatelessWidget {
   
  const WeinfluApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final User userData;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: WeinfluThemes.defaultTheme,

      routes: {
        AppRoutes.home: (context) => const HomeScreen(),
        AppRoutes.graphic: (context) => GraphicScreen( userData: User( '', 0 ) ),
      },
      
      initialRoute: '/home',
      //home: const HomeScreen(),
    );
  }
}