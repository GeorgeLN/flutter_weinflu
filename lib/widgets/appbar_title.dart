//.................................................
//  █████╗ ██████╗ ██████╗ ██████╗  █████╗ ██████╗ 
// ██╔══██╗██╔══██╗██╔══██╗██╔══██╗██╔══██╗██╔══██╗
// ███████║██████╔╝██████╔╝██████╔╝███████║██████╔╝
// ██╔══██║██╔═══╝ ██╔═══╝ ██╔══██╗██╔══██║██╔══██╗
// ██║  ██║██║     ██║     ██████╔╝██║  ██║██║  ██║
// ╚═╝  ╚═╝╚═╝     ╚═╝     ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝
//.................................................

import 'package:flutter/material.dart';

import 'package:weinflu/design/design.dart';

class AppBarTittle extends StatelessWidget {
  const AppBarTittle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        Container(
          width: 40,
          height: 40,
          
          decoration: const BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.all( Radius.circular( 12 ) ), //BorderRadius.all, aplica el redondeado de los bordes en todos los lados.
            image: DecorationImage( image: AssetImage( 'assets/images/user-profile.png' ) ),
          ),

          margin: const EdgeInsets.only( right: 12 ),
        ),

        Expanded(
          child: Text(
            'Jorge López',
            style: Theme.of(context).textTheme.headlineLarge, //Se toma de la clase "WeinfluThemes" con la extensión *of(context)*
          ),
        ),

        ContainerIcon(
          iconButton: IconButton(
            icon: const Icon(
              Icons.notifications_active,
              color: WeinFluColors.brandPrimaryColor
            ),

            onPressed: () {
              print( 'Hola, han presionado el botón de notificaciones.' );
            },
          ),
        ),
        
        const SizedBox( width: 5 ),

        ContainerIcon(
          iconButton: IconButton(
            icon: const Icon(
              Icons.more_vert,
              color: WeinFluColors.brandPrimaryColor
            ),

            onPressed: () {
              print( 'Hola, han presionado el botón de opciones.' );  
            },
          ),
        ),
      ],
    );
  }
}

//Clase para los botónes con íconos.
class ContainerIcon extends StatelessWidget {

  final IconButton iconButton;
  const ContainerIcon({super.key, required this.iconButton});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,

      decoration: BoxDecoration(
        border: Border.all( color: WeinFluColors.brandLightColorBorder ),
        borderRadius: const BorderRadius.all( Radius.circular( 12 ) ), //BorderRadius.all, aplica el redondeado de los bordes en todos los lados.
      ),

      child: iconButton,
    );
  }
}