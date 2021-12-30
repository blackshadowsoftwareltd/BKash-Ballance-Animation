import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool _isAnimated = false;
  bool _isBallanceShown = false;
  bool _isBallance = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 80,
        color: Colors.pink,
        // alignment: Alignment.center,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              userLogo(),
              const SizedBox(width: 10),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// userName
                    const Text('Remon Ahammad',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w300)),
                    const SizedBox(height: 5),

                    /// Button
                    InkWell(
                        onTap: changeState,
                        child: Container(
                            width: 160,
                            height: 28,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)),
                            child:
                                Stack(alignment: Alignment.center, children: [
                              /// ৳ 50.00
                              AnimatedOpacity(
                                  opacity: _isBallanceShown ? 1 : 0,
                                  duration: const Duration(milliseconds: 500),
                                  child: const Text('৳ 50.00',
                                      style: TextStyle(
                                          color: Colors.pink, fontSize: 14))),

                              /// ব্যালেন্স দেখুন
                              AnimatedOpacity(
                                  opacity: _isBallance ? 1 : 0,
                                  duration: const Duration(milliseconds: 300),
                                  child: const Text('ব্যালেন্স দেখুন',
                                      style: TextStyle(
                                          color: Colors.pink, fontSize: 14))),

                              /// Circle
                              AnimatedPositioned(
                                  duration: const Duration(milliseconds: 1100),
                                  left: _isAnimated == false ? 5 : 135,
                                  curve: Curves.fastOutSlowIn,
                                  child: Container(
                                      height: 20,
                                      width: 20,
                                      // padding: const EdgeInsets.only(bottom: 4),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.pink,
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: const FittedBox(
                                          child: Text('৳',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 17)))))
                            ])))
                  ]),
              const SizedBox(width: 10),

              /// bKash logo
              bKashLogo()
            ]));
  }

  void changeState() async {
    _isAnimated = true;
    _isBallance = false;
    setState(() {});
    await Future.delayed(const Duration(milliseconds: 800),
        () => setState(() => _isBallanceShown = true));
    await Future.delayed(const Duration(seconds: 3),
        () => setState(() => _isBallanceShown = false));
    await Future.delayed(const Duration(milliseconds: 200),
        () => setState(() => _isAnimated = false));
    await Future.delayed(const Duration(milliseconds: 800),
        () => setState(() => _isBallance = true));
  }

  Widget userLogo() => CircleAvatar(
      radius: 20,
      backgroundColor: Colors.green.shade50,
      child: const Icon(Icons.person, color: Colors.pink, size: 28));

  Widget bKashLogo() =>
      SizedBox(width: 45, child: Image.asset('assets/bKash.png'));
}
