import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:weinflu/design/weinflu_colors.dart';
import 'package:weinflu/models/user.dart';

class GraphicScreen extends StatelessWidget {
   
  final User userData;
  const GraphicScreen({Key? key, required this.userData}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox( // O Container
              width: MediaQuery.of(context).size.width,
              height: 30,

              child: const Padding(
                padding: EdgeInsets.only( top: 15 ),

                child: Text(
                  'DIAGRAMAS DE COMPARACIÓN',
                  textAlign: TextAlign.center,
                  style: TextStyle( fontSize: 15, fontWeight: FontWeight.bold ),
                ),
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only( left: 15, right: 20, bottom: 20, top: 5 ),

              child: AspectRatio(
                aspectRatio: 1,
                  
                child: LineChart(

                  LineChartData(
                    lineBarsData: [
                      LineChartBarData(
                        spots: const [ //Puntos que se dibujarán en la función.
                        //FlSpot( x   , y   ),
                          FlSpot( 0   , 3   ),
                          FlSpot( 2.6 , 2.6 ),
                          FlSpot( 4.9 , 5   ),
                          FlSpot( 6.8 , 2.5 ),
                          FlSpot( 8   , 4   ),
                          FlSpot( 9.5 , 3   ),
                          FlSpot( 11  , 4   ),
                        ], //spots[]
                  
                        isCurved: true, // Evita las líneas rectas y las hace curvas.
                        dotData: const FlDotData( show: true ),
                        color: WeinFluColors.brandPrimaryColor,
                        barWidth: 2, // 2 es el valor por defecto.
                  
                        belowBarData: BarAreaData( //Sombreado por debajo de la función.
                          show: true,
                          color: WeinFluColors.brandLightColorBorder,
                          //color: Colors.green.withOpacity( 0.6 ),
                        ),
                      ),
                    ], //lineBarsData[]
                  
                    backgroundColor: Colors.grey.withOpacity( 0.3 ), //Color de fondo para el gráfico
                    
                    titlesData: FlTitlesData( //Opción para dar título cada parte del gráfico (arriba, abajo, izquierda y derecha).
                      show: true, // Si se coloca "false", eliminará todos los datos de la gráfica y sólo se dejará el diagrama.

                      bottomTitles: AxisTitles( //Bottom = Abajo - Asigna título y propiedades a la parte baja del diagrama.
                        axisNameWidget: const Text( 'Día de la semana' ),
                        
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 20,
                          interval: 5, //Número de intervalos en la parte inferior
                  
                          getTitlesWidget: (value, meta) { //Asignación de los títulos para los intervalos.
                            String text = '';
                  
                            switch ( value.toInt() ) {
                              case 0:
                                text = 'Lunes';
                                break;
                  
                              case 5:
                                text = 'Jueves';
                                break;
                  
                              case 11:
                                text = 'Domingo';
                                break;
                            }
                  
                            return Text( text );
                          },
                        ),
                      ),
                  
                      leftTitles: const AxisTitles( //Left = Izquierda - Asigna título y propiedades a la parte izquierda del diagrama.
                        axisNameWidget: Text( 'Mes del año' ),
                  
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 30,
                        ),
                      ),
                  
                      topTitles: const AxisTitles(
                        axisNameWidget: Text( '' ),
            
                        sideTitles: SideTitles(
                          showTitles: false,
                        ),
                      ),
            
                      rightTitles: const AxisTitles(
                        axisNameWidget: Text( '' ),
            
                        sideTitles: SideTitles(
                          showTitles: false,
                        ),
                      ),
                    ),
                  
                    //Darle diseño a las líneas del gráfico.
                    // gridData: FlGridData(
                    //   show: true,
                    //   drawHorizontalLine: true,
                  
                    //   getDrawingHorizontalLine: (value) => const FlLine(
                    //     color: Colors.greenAccent,
                    //     strokeWidth: 0.5,
                    //   ),
                    // ),
                  ),
                ),
              ),
            ),

            const SizedBox( height: 10 ),

            Row(
              //mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Container(
                  width: 220,
                  height: 240,
                  //padding: const EdgeInsets.only( right: 20 ),
                
                  child: PieChart( //Diagrama circular (Diagrama de Pizza).
                    PieChartData(
                      centerSpaceRadius: 20,
                      borderData: FlBorderData( show: false ),
                      sectionsSpace: 0,
                
                      sections: [
                        PieChartSectionData( value: 35, color: Colors.purpleAccent, radius: 80 ),
                        PieChartSectionData( value: 40, color: Colors.yellow, radius: 80 ),
                        PieChartSectionData( value: 55, color: Colors.green, radius: 80 ),
                        PieChartSectionData( value: 70, color: Colors.orange, radius: 80 ),
                        PieChartSectionData( value: 30, color: Colors.blueAccent, radius: 80 ),
                      ], // sections[]
                    )
                  ),
                ),

                const SizedBox( width: 5 ),

                Container(
                  width: 125,
                  height: 240,

                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    
                    children: [
                      ItemPieChart( colors: Colors.blueAccent, text: 'PORCENTAJE 1' ),
                      SizedBox( height: 10 ),
                      ItemPieChart( colors: Colors.purpleAccent, text: 'PORCENTAJE 2' ),
                      SizedBox( height: 10 ),
                      ItemPieChart( colors: Colors.yellow, text: 'PORCENTAJE 3' ),
                      SizedBox( height: 10 ),
                      ItemPieChart( colors: Colors.green, text: 'PORCENTAJE 4' ),
                      SizedBox( height: 10 ),
                      ItemPieChart( colors: Colors.orange, text: 'PORCENTAJE 5' ),
                    ], //Children[]
                  ),
                )
              ], //Children[]
            ),

            const SizedBox( height: 10)
          ], // Children[]
        ),
      ),
    );
  }
}

class ItemPieChart extends StatelessWidget {
  final Color colors;
  final String text;

  const ItemPieChart({
    super.key, required this.colors, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.circle,
          color: colors,
        ),

        Text( text ),
      ],
    );
  }
}