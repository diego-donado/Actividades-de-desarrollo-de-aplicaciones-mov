import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Unitecnar App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$counter',
              style: const TextStyle(
                fontSize: 160,
                fontWeight: FontWeight.w100,
              ),
            ),
            Text(
              'Click${counter == 1 ? '' : 's'}',
              style: const TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(
            icon: Icons.plus_one_outlined,
            onPressed: () {
              setState(() {
                counter++;
              });
            },
          ),
          const SizedBox(height: 20),
          CustomButton(
            icon: Icons.exposure_minus_1_outlined,
            onPressed: () {
              setState(() {
                if (counter == 0) return;
                counter--;
              });
            },
          ),
          const SizedBox(height: 20),
          CustomButton(
            icon: Icons.refresh,
            onPressed: () {
              setState(() {
                counter = 0;
              });
            },
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: null, // evita el error de "multiple heroes" con varios FAB
      shape: const CircleBorder(),
      elevation: 5,
      backgroundColor: const Color.fromRGBO(134, 23, 23, 1),
      foregroundColor: Colors.white,
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
