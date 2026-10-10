import 'package:flutter/material.dart';

void main(){
  runApp(const HomeScreen());


}

class HomeScreen extends StatefulWidget {
  const new({super.key});

  @override
  State <HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color.fromARGB(255, 1, 19, 34)
      ),
      home: Scaffold(
        appBar: AppBar(
        title: const Text('Unitecnar App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$counter', style: TextStyle(fontSize: 160, fontWeight: FontWeight(100)),),
              Text('Click${counter == 1 ? '': 's'}', style: TextStyle(fontSize: 25),)
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _CustomBotton(icon: Icons.plus_one_outlined, onpressed: () {
              setState(() {
                counter ++;
              });
              }),

              SizedBox(height: 20,),
              _CustomBotton(icon: Icons.exposure_minus_1_outlined, onpressed: () {
              setState(() {
                if(counter == 0) return;
                counter --;
              });

            },),
              SizedBox(height: 20,),
              _CustomBotton(icon: Icons.refresh, onpressed: (){

                  setState(() {
                    counter = 0;
                    
                  });
                },
              )
          ],
        ),
      )
    );
  }
}

class _CustomBotton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onpressed;

  const _CustomBotton({
    required this.icon, 
    required this.onpressed
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: CircleBorder(),
      backgroundColor: Color.fromRGBO(134, 23, 23, 1),
      elevation: 5,
      onPressed: onpressed,
      child: Icon(icon),
      
      );
  }
}

