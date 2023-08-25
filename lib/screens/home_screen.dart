//.....................................
// ██╗  ██╗ ██████╗ ███╗   ███╗███████╗
// ██║  ██║██╔═══██╗████╗ ████║██╔════╝
// ███████║██║   ██║██╔████╔██║█████╗  
// ██╔══██║██║   ██║██║╚██╔╝██║██╔══╝  
// ██║  ██║╚██████╔╝██║ ╚═╝ ██║███████╗
// ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝
//.....................................

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart'; -> Para el ítem "Hearth"

import 'package:weinflu/design/design.dart';
import 'package:weinflu/models/user.dart';
import 'package:weinflu/screens/screens.dart';
import 'package:weinflu/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
   
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final userData = User( 'Jorge López', 26 );
    int _currentPage = 0;
    PageController _pageController = PageController();

    final items = <Widget> [
      const Icon( Icons.monetization_on_outlined, color: Colors.white ),
      //const Icon( FontAwesomeIcons.heart, color: Colors.white ),
      const Icon( Icons.line_axis, color: Colors.white ),
    ];

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,  //Altura del AppBar.
        backgroundColor: WeinFluColors.brandLightColor, //Color de fondo para el AppBar.

        shape: const RoundedRectangleBorder( //Bordeado del AppBar.
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular( 16 ),
            bottomRight: Radius.circular( 16 ),
          ),
        ),

        title: const Padding(
          padding: EdgeInsets.fromLTRB( 16, 15, 16, 12 ), //Left. Tpp, Right, Bottom

          child: AppBarTittle(), //Diseño general del AppBar.
        ),

        centerTitle: true,
      ),
      
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),

        onPageChanged: (value) {
          setState(() {
            _currentPage = value;
          });
        },
        
        children: [

          //Screen principal, 
          const Column(
            children: [
              TopHomePageBody(), //Diseño del recuadro azul
      
              Expanded( child: CategoriesWidged() ),
            ], //Children[]
          ),

          GraphicScreen(userData: userData ),
        ],
      ),

      bottomNavigationBar: CurvedNavigationBar(
        index: _currentPage,
        backgroundColor: Colors.transparent,
        color: Colors.blue.shade800,
        height: 55,
        items: items,
        
        onTap: ( value ) {
          setState(() {
            _currentPage = value;

            _pageController.animateToPage(
              value,
              duration: const Duration( milliseconds: 300 ),
              curve: Curves.easeInOut,
            );
          });
        },
        //CONTINUE HERE
      ),
    );
  }
}

class TopHomePageBody extends StatelessWidget {

  const TopHomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only( right: 16, left: 16 ),
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

      height: 350,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Container(
            //color: Colors.red,
            margin: const EdgeInsets.only( top: 30 ),

            child: Text(
              'Mi Saldo',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),

          MoneyDisplay(
            amount: 3500000.00,
            amountStyle: Theme.of(context).textTheme.displayLarge!,

            // amountStyleSmall: const TextStyle(
            //   fontSize: 16,
            //   fontWeight: FontWeight.bold,
            //   color: WeinFluColors.brandLightColor,
            // ),
          ),

          const SizedBox( height: 5 ),

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
  final void Function()? categoriesBtnAction;
  final void Function()? recentBtnAction;

  const MidHomePageBody({super.key, required this.categoryButton, required this.recentTransactionButton, this.categoriesBtnAction, this.recentBtnAction, });

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
            onPressed: categoriesBtnAction,

            style: categoryButton,

            child: const Padding(
              padding: EdgeInsets.symmetric( vertical: 16, horizontal: 30 ),

              child: Text( 'Categorías', style: TextStyle( color: WeinFluColors.brandDarkColor ) ),
            ),
          ),

          const SizedBox( width: 10 ),

          ElevatedButton(
            onPressed: recentBtnAction,

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

class CategoriesWidged extends StatelessWidget {
  const CategoriesWidged({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),

      children: const [
        // TextButton(
        //   style: const ButtonStyle(
        //     //backgroundColor: MaterialStatePropertyAll( Colors.red ),
        //     alignment: Alignment.centerRight,
        //   ),
        
        //   onPressed: () {
        //     print( 'Categoría uno' );
        //   },
        
        //   child: const Text(
        //     'View all',
        
        //     style: TextStyle(
        //       fontWeight: FontWeight.bold,
        //       color: Color.fromRGBO( 53, 97, 254, 1),
        //     ),
        //   ),
        // ),

        ProductDetail(
          pathToProductImage: 'assets/images/fast-food.png',
          amount: 150000,
          productName: 'Comidas',
          currentSells: '25000',
          percentage: '1.8',
          typeProductDetailCard: TypeProductDetailCard.outcomes,
        ),

        ProductDetail(
          pathToProductImage: 'assets/images/motorbike.png',
          amount: 50000,
          productName: 'Gasolina',
          currentSells: '15000',
          percentage: '12',
          typeProductDetailCard: TypeProductDetailCard.incomes,
        ),

        ProductDetail(
          pathToProductImage: 'assets/images/game-console.png',
          amount: 50000,
          productName: 'Video Juegos',
          currentSells: '38500',
          percentage: '5',
          typeProductDetailCard: TypeProductDetailCard.incomes,
        ),

        ProductDetail(
          pathToProductImage: 'assets/images/delivery-box.png',
          amount: 200000,
          productName: 'Otras compras',
          currentSells: '0',
          percentage: '0',
          typeProductDetailCard: TypeProductDetailCard.incomes,
        ),
      ], //Children[]
    );
  }
}