//.....................................
// ██╗  ██╗ ██████╗ ███╗   ███╗███████╗
// ██║  ██║██╔═══██╗████╗ ████║██╔════╝
// ███████║██║   ██║██╔████╔██║█████╗  
// ██╔══██║██║   ██║██║╚██╔╝██║██╔══╝  
// ██║  ██║╚██████╔╝██║ ╚═╝ ██║███████╗
// ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝
//.....................................

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:weinflu/design/design.dart';
import 'package:weinflu/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,  //Altura del AppBar.
        backgroundColor: WeinFluColors.brandLightColor, //Color de fondo para el AppBar.

        shape: const RoundedRectangleBorder( //Bordeado del AppBar.
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular( 16 ),
            bottomRight: Radius.circular( 16 ),
          ),
        ),

        title: const Padding(
          padding: EdgeInsets.fromLTRB( 16, 45, 16, 12 ),

          child: AppBarTittle(), //Diseño general del AppBar.
        ),

        centerTitle: true,
      ),
      
      body: Column(
        children: [
          const TopHomePageBody(),

          MidHomePageBody(
            categoryButton: ButtonStyle( backgroundColor: MaterialStateProperty.all( Colors.white54 ) ),
            recentTransactionButton: ButtonStyle( backgroundColor: MaterialStateProperty.all( Colors.white54 ) ),
          ),
        ], //Children[]
      ),
    );
  }
}

class TopHomePageBody extends StatelessWidget {

  const TopHomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all( 16 ),
      width: MediaQuery.of(context).size.width,
      transform: Matrix4.translationValues( 0, -12, 0 ),

      decoration: const BoxDecoration(
        //color: WeinFluColors.brandPrimaryColor,
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO( 21, 67, 96, 1 ),
            WeinFluColors.brandPrimaryColor,
            //Color.fromRGBO( 52, 73, 94, 1 ),
          ], //Colors[]

          // begin: Corresponde a la orientación de los colores de manera horizontal.
          begin: Alignment.topLeft,

          // end: Corresponde a la orientación de los colores de manera vertical.
          end: Alignment.bottomRight,
          //stops: [ 0.3, 0.3 ],
        ),

        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular( 16 ),
          bottomRight: Radius.circular( 16 ),
        ),
      ),

      height: 380,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Container(
            //color: Colors.red,
            margin: const EdgeInsets.only( top: 56 ),

            child: Text(
              'Mi Saldo',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),

          MoneyDisplay(
            amount: 3500000.00,
            amountStyle: Theme.of(context).textTheme.displayLarge!,

            amountStyleSmall: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: WeinFluColors.brandLightColor,
            ),
          ),

          const SumaryCard(
            typeSumaryCard: TypeSumaryCard.incomes,
            amount: 700000,
            period: 'Último ingreso: 04/03/2023',
          ),

          const SumaryCard(
            typeSumaryCard: TypeSumaryCard.spending,
            amount: 20000,
            period: 'Último retiro: 04/03/2023',
          ),
        ], //Children[]
      ),
    );
  }
}

class MidHomePageBody extends StatelessWidget {

  final ButtonStyle categoryButton;
  final ButtonStyle recentTransactionButton;

  const MidHomePageBody({super.key, required this.categoryButton, required this.recentTransactionButton, });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only( left: 16, right: 16 ),
      height: 104,
      width: MediaQuery.of(context).size.width,

      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        color: WeinFluColors.brandLightColor,

        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular( 16 ),
          bottomRight: Radius.circular( 16 ),
        ),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          ElevatedButton(
            onPressed: () {
              print( 'Categorías ');
            },

            style: categoryButton,

            child: const Padding(
              padding: EdgeInsets.symmetric( vertical: 16, horizontal: 30 ),

              child: Text( 'Categorías', style: TextStyle( color: WeinFluColors.brandDarkColor ) ),
            ),
          ),

          const SizedBox( width: 10 ),

          ElevatedButton(
            onPressed: () {
              print( 'Reciente ');
            },

            style: recentTransactionButton,

            child: const Padding(
              padding: EdgeInsets.symmetric( vertical: 16, horizontal: 30 ),

              child: Text( 'Recientes', style: TextStyle( color: WeinFluColors.brandDarkColor ) ),
            ),
          ),
        ], //Children[]
      ),
    );
  }
}