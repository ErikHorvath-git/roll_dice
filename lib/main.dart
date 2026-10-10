import 'dart:math';

import 'package:flutter/material.dart';

final _random = Random();

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: GradientBackground(child: DiceRoller())),
    ),
  );
}

class GradientBackground extends StatelessWidget {
  const GradientBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF3A0CA3), Color(0xFF7209B7)],
        ),
      ),
      child: Center(child: child),
    );
  }
}

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  int _currentRoll = 1;

  void _rollDice() {
    setState(() {
      // nextInt(6) vráti 0–5, preto pripočítame 1 => rozsah 1–6
      _currentRoll = _random.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('assets/images/dice-$_currentRoll.png', width: 200),
        const SizedBox(height: 32),
        ElevatedButton(
          onPressed: _rollDice,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            textStyle: const TextStyle(fontSize: 22),
          ),
          child: const Text('Hoď kockou'),
        ),
      ],
    );
  }
}
