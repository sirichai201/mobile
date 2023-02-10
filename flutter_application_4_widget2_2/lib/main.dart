import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_application_4_widget2_2/neon_button.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Home sirichai Button'),
    );
  }
}

enum ButtonState { loading, done, init }

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isAnimating = true;
  ButtonState state = ButtonState.init;
  @override
  Widget build(BuildContext context) {
    final Width = MediaQuery.of(context).size.width;
    final isDone = state == ButtonState.done;
    bool isStretched = isAnimating || state == ButtonState.init;
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(32),
            child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
                width: state == ButtonState.init ? Width : 70,
                onEnd: () => setState(() => isAnimating = !isAnimating),
                height: 70,
                child: isStretched
                    ? OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            shape: const StadiumBorder(),
                            side: const BorderSide(
                                width: 2, color: Colors.indigo)),
                        child: FittedBox(
                          child: Text(
                            'SUBMIT',
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.indigo,
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        onPressed: () async {
                          setState(() => state = ButtonState.loading);
                          await Future.delayed(Duration(seconds: 3));
                          setState(() => state = ButtonState.done);
                          await Future.delayed(Duration(seconds: 3));
                          setState(() => state = ButtonState.init);
                        })
                    : (bool isDone) {
                        final Color = isDone ? Colors.green : Colors.indigo;
                        var color;
                        return Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: color),
                          child: Center(
                            child: isDone
                                ? Icon(Icons.done,
                                    size: 52, color: Colors.white)
                                : CircularProgressIndicator(
                                    color: Colors.white),
                          ),
                        );
                      }(isDone))));

    // ignore: dead_code
    Widget buildButton() => OutlinedButton(
        style: OutlinedButton.styleFrom(
            shape: const StadiumBorder(),
            side: const BorderSide(width: 2, color: Colors.indigo)),
        child: FittedBox(
          // ignore: prefer_const_constructors
          child: Text(
            'SUBMIT',
            style: TextStyle(
                fontSize: 24,
                color: Colors.indigo,
                letterSpacing: 1.5,
                fontWeight: FontWeight.bold),
          ),
        ),
        onPressed: () async {
          setState(() => state = ButtonState.loading);
          await Future.delayed(Duration(seconds: 2));
          setState(() => state = ButtonState.done);
          await Future.delayed(Duration(seconds: 2));
          setState(() => state = ButtonState.init);
        });
    Widget buildSmallButton(bool isDone) {
      final Color = isDone ? Colors.green : Colors.indigo;
      var color;
      return Container(
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        child: Center(
          child: isDone
              ? Icon(Icons.done, size: 52, color: Colors.white)
              : CircularProgressIndicator(color: Colors.white),
        ),
      );
    }

    /*child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(fontSize: 24),
                        minimumSize: Size.fromHeight(72),
                        shape: StadiumBorder(),
                      ),
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        await Future.delayed(Duration(seconds: 3));
                        setState(() {
                          isLoading = false;
                        });
                      },
                      child: isLoading
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                CircularProgressIndicator(color: Colors.white),
                                SizedBox(width: 24),
                                Text('Please wait....'),
                              ],
                            )
                          : const Text('Login')),
                  /*NeonButton(Colors.red),
                  NeonButton(Colors.greenAccent.shade700),
                  NeonButton(Colors.blueAccent.shade700),
                  NeonButton(Colors.yellowAccent.shade700),
                  NeonButton(Colors.blue),
                  NeonButton(Colors.white),*/
                  /*SpinKitCircle(
                size: 140,
                itemBuilder: (context, index) {
                  final colors = [
                    Colors.green,
                    Colors.redAccent.shade700,
                    Colors.yellowAccent.shade400
                  ];
                  final Color = colors[index % colors.length];
                  return DecoratedBox(decoration: BoxDecoration(color: Color));
                },
              )*/
                ],
              ),
            ),*/

    /* Listener(
              onPointerDown: (event) => setState(() {
                isPressed = true;
              }),
              onPointerUp: (event) => setState(() {
                isPressed = false;
              }),
              child: Text(
                'Neon Button',
                style: TextStyle(fontSize: 30, color: Colors.white, shadows: [
                  for (double i = 1; i < (isPressed ? 8 : 4); i++)
                    Shadow(color: shadowColor, blurRadius: 3 * i),
                ]),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    for (double i = 1; i < 5; i++)
                      BoxShadow(
                          color: shadowColor,
                          blurRadius: (isPressed ? 5 : 3) * i,
                          blurStyle: BlurStyle.outer),
                  ]),
              child: TextButton(
                onHover: (hovered) => setState(() {
                  isPressed = hovered;
                }),
                style: TextButton.styleFrom(
                    side: const BorderSide(color: Colors.white, width: 4),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Neon Button',
                    style:
                        TextStyle(fontSize: 30, color: Colors.white, shadows: [
                      for (double i = 1; i < (isPressed ? 8 : 4); i++)
                        Shadow(color: shadowColor, blurRadius: 3 * i),
                    ]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    */
  }
}

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SpinKitCircle(
      size: 140,
      itemBuilder: (context, index) {
        final colors = [
          Colors.green,
          Colors.redAccent.shade700,
          Colors.yellowAccent.shade400
        ];
        final Color = colors[index % colors.length];
        return DecoratedBox(decoration: BoxDecoration(color: Color));
      },
    ));
  }
}
