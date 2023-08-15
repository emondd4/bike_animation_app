import 'package:flutter/material.dart';

import 'bike_stats_widget.dart';

class CardInfoWidget extends StatelessWidget {
  const CardInfoWidget({
    super.key, required this.name, required this.power, required this.torque, required this.dryWeight, required this.fuel, required this.consumption, required this.co2, required this.standard,
  });
  final String name;
  final String power;
  final String torque;
  final String dryWeight;
  final String fuel;
  final String consumption;
  final String co2;
  final String standard;

  @override
  Widget build(BuildContext context) {
    return Container(
      // clipBehavior: Clip.antiAlias,
      height: 180,
      margin: const EdgeInsets.all(12),
      // padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        // borderRadius: BorderRadius.circular(24),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        // boxShadow: cardShadow,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            spreadRadius: 0.5,
            blurRadius: 0.5,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                // color: Colors.red,
                border: Border(
                  right: BorderSide(color: Colors.grey.shade400),
                ),
              ),
              child: Center(
                child: Text(
                  'DUKATI $name',
                  maxLines: 1,
                  style: const TextStyle(
                    letterSpacing: 2,
                      color: Colors.black54,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Divider(height: 1, thickness: 1, color: Colors.grey.shade400),
          SizedBox(
            // height: 100,
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: BikeStatsWidget(
                    statTitle: 'HP',
                    statValue: power,
                    showBorder: true,
                  ),
                ),
                Expanded(
                  child: BikeStatsWidget(
                    statTitle: 'Torque',
                    statValue: torque,
                    showBorder: true,
                  ),
                ),
                Expanded(
                  child: BikeStatsWidget(
                    statTitle: 'Weight',
                    statValue: dryWeight,
                    showBorder: false,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4,),
          Divider(height: 1, thickness: 1, color: Colors.grey.shade400),
          SizedBox(
            // height: 100,
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: BikeStatsWidget(
                    statTitle: 'Fuel Consumption',
                    statValue: consumption,
                    showBorder: true,
                  ),
                ),
                Expanded(
                  child: BikeStatsWidget(
                    statTitle: 'CO2 Emition Level',
                    statValue: co2,
                    showBorder: true,
                  ),
                ),
                const Expanded(
                  child: BikeStatsWidget(
                    statTitle: 'TOP Speed',
                    statValue: "N/A",
                    showBorder: false,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
