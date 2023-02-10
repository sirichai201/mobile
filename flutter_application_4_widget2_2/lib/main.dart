import 'package:flutter/material.dart';
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

enum ButtonState { int, loading, done }

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoading = false;
  bool isAnimating = true;
  ButtonState state = ButtonState.init;
  @override
  Widget build(BuildContext context) {
    /*isLoading */
    //?LoadingPage()
    final Width = MediaQuery.of(context).size.width;
    final isDone = state == ButtonState.done;
    bool isStretched = isAnimating || state == ButtonState.init;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(32),
          child:AnimatedContainer(
            
          )
        child: Center(
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
            ),
      ),
    );
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
