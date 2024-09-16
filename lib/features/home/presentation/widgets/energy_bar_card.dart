import 'package:flutter/material.dart';

class EnergyBarCard extends StatelessWidget {
  final double power; // Valor entre 0 e 100 para o progresso

  const EnergyBarCard({
    Key? key,
    required this.power,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double powerValue = power / 100.0;

    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 12.0),
              child: Center(
                child: Text(
                    'Seu nivel de poder é seu nivel de bateria',
                    style: const TextStyle(
                        fontSize: 18
                    )
                ),
              ),
            ),
            Container(
              height: 20.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey[300],
              ),
              child: LinearProgressIndicator(
                value: powerValue,
                backgroundColor: Colors.transparent,
                color: Colors.green,
                minHeight: 20.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              '${power.toStringAsFixed(0)}%',
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}