import 'package:flutter/material.dart';

import 'color_model.dart';
import 'custom_clip_path.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
      );
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  ColorModel firstColor = colors.first;
  ColorModel lastColor = colors.last;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Stack(
                children: [
                  Container(
                    color: lastColor.color,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * .6,
                  ),
                  AnimatedBuilder(
                    animation: animationController,
                    builder: (context, _) {
                      return ClipPath(
                        clipper: CustomClipPath(animationController.value,firstColor.alignment),
                        child: Container(
                          color: firstColor.color,
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * .6,
                        ),
                      );
                    },
                  ),
                ],
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
                  itemCount: colors.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        firstColor = colors[index];
                        animationController.forward(from: 0).whenComplete(
                              () => setState(() => lastColor = firstColor),
                            );
                      },
                      child:
                          CircleAvatar(backgroundColor: colors[index].color)),
                ),
              ),
            ],
          ),
        ),
      );
}
