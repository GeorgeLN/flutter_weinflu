//..........................................................................................
// ███████╗██╗   ██╗███╗   ███╗ █████╗ ██████╗ ██╗   ██╗     ██████╗ █████╗ ██████╗ ██████╗ 
// ██╔════╝██║   ██║████╗ ████║██╔══██╗██╔══██╗╚██╗ ██╔╝    ██╔════╝██╔══██╗██╔══██╗██╔══██╗
// ███████╗██║   ██║██╔████╔██║███████║██████╔╝ ╚████╔╝     ██║     ███████║██████╔╝██║  ██║
// ╚════██║██║   ██║██║╚██╔╝██║██╔══██║██╔══██╗  ╚██╔╝      ██║     ██╔══██║██╔══██╗██║  ██║
// ███████║╚██████╔╝██║ ╚═╝ ██║██║  ██║██║  ██║   ██║       ╚██████╗██║  ██║██║  ██║██████╔╝
// ╚══════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝        ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ 
//..........................................................................................

import 'package:flutter/material.dart';
import 'package:weinflu/design/design.dart';
import 'package:weinflu/widgets/widgets.dart';

//Tipos de SumaryCard
enum TypeSumaryCard { incomes, spending }

class SumaryCard extends StatelessWidget {

  final TypeSumaryCard typeSumaryCard;
  final double amount;
  final String period;
  final void Function()? action;
   
  const SumaryCard({
    Key? key,
    required this.typeSumaryCard,
    required this.amount,
    required this.period,
    this.action
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    var incomesIcon = const Icon(
      Icons.arrow_upward_rounded,
      color: WeinFluColors.brandOnSuccessColor,
    );

    var spendingIcon = const Icon(
      Icons.arrow_downward_rounded,
      color: WeinFluColors.brandOnErrorColor,
    );

    return Container(
      height: 92,
      margin: const EdgeInsets.only( top: 8 ),
      padding: const EdgeInsets.all( 16 ),

      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        color: WeinFluColors.brandLightColorOpacity,
        borderRadius: BorderRadius.all( Radius.circular( 16 ) ),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,

        children: [
          Row(
            children: [
              Container( //Flechas Verdes y Rojas
                height: 40,
                width: 40,
                margin: const EdgeInsets.only( right: 10 ),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all( Radius.circular( 12 ) ),
                  border: Border.all( color: WeinFluColors.brandPrimaryColor ),
                ),

                child: typeSumaryCard == TypeSumaryCard.incomes
                        ? incomesIcon
                        : spendingIcon
              ),
            ],
          ),

          // Expanded(
          //   child: Text(
          //     typeSumaryCard == TypeSumaryCard.incomes
          //       ? 'Ingresos'
          //       : 'Gastos',

          //     style: const TextStyle(
          //       color: Colors.white,
          //       fontWeight:FontWeight.bold,
          //     ),
          //     //style: Theme.of(context).textTheme.labelSmall,
          //   ),
          // ),

          Container(
            //margin: const EdgeInsets.only( right: 20 ),

            child: Column( // Valor ingresos y retiros
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                MoneyDisplay( 
                  amount: amount,
                  amountStyle: Theme.of(context).textTheme.displayMedium!,

                  // amountStyleSmall: const TextStyle(
                  //   fontSize: 16,
                  //   fontWeight: FontWeight.bold,
                  //   color: WeinFluColors.brandLightColor,
                  // ),
                ),

                Padding(
                  padding: const EdgeInsets.all( 2 ),

                  child: Text(
                    period,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  
                    style: const TextStyle(
                      color: WeinFluColors.brandLightColor,
                      fontFamily: 'RoboMoto',
                      fontSize: 10,
                    ),
                  ),
                ),
              ], //Children[]
            ),
          ),

          Container(
            height: 40,
            width: 40,

            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all( Radius.circular( 12 ) ),
              border: Border.all( color: WeinFluColors.brandLightColorBorder ),
            ),

            child: IconButton(
              icon: const Icon(
                Icons.chevron_right_rounded,
                color: Colors.white,
              ),

              onPressed: action,
            ),
          ),
        ], //Children[]
      ),
    );
  }
}