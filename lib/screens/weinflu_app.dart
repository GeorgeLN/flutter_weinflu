//.....................................................................................
// ██╗    ██╗███████╗██╗███╗   ██╗███████╗██╗     ██╗   ██╗     █████╗ ██████╗ ██████╗ 
// ██║    ██║██╔════╝██║████╗  ██║██╔════╝██║     ██║   ██║    ██╔══██╗██╔══██╗██╔══██╗
// ██║ █╗ ██║█████╗  ██║██╔██╗ ██║█████╗  ██║     ██║   ██║    ███████║██████╔╝██████╔╝
// ██║███╗██║██╔══╝  ██║██║╚██╗██║██╔══╝  ██║     ██║   ██║    ██╔══██║██╔═══╝ ██╔═══╝ 
// ╚███╔███╔╝███████╗██║██║ ╚████║██║     ███████╗╚██████╔╝    ██║  ██║██║     ██║     
//  ╚══╝╚══╝ ╚══════╝╚═╝╚═╝  ╚═══╝╚═╝     ╚══════╝ ╚═════╝     ╚═╝  ╚═╝╚═╝     ╚═╝     
//.....................................................................................

import 'package:flutter/material.dart';
import 'package:weinflu/design/design.dart';
import 'package:weinflu/screens/home_screen.dart';

class WeinfluApp extends StatelessWidget {
   
  const WeinfluApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: WeinfluThemes.defaultTheme,

      home: const HomeScreen(),
    );
  }
}