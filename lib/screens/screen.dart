// ignore: must_be_immutable
import 'package:fibonacci_tem/service/service.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  TextEditingController numberNontroller = TextEditingController();
  ValueNotifier<int> fibonacciNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Fibonacci",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(right: 16.0, left: 16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(children: [
            SizedBox(
              height: h * 0.2,
            ),
            NumberTextField(numberNontroller: numberNontroller),
            SizedBox(
              child: Center(
                child: ValueListenableBuilder(
                  valueListenable: fibonacciNotifier,
                  builder: (context, value, child) {
                    return Text(
                      value == 0 ? "0" : "$value",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    );
                  },
                ),
              ),
            ),
            InkWell(
              onTap: () {
                fibonacciNotifier.value = FibonacciConverter()
                    .calculateFibonacci(int.parse(numberNontroller.text));
              },
              child: Container(
                width: w,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.purple.shade200,
                    borderRadius: const BorderRadius.all(Radius.circular(15))),
                child: const Center(
                  child: Text(
                    "Convert",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ),
            )
          ]),
        ),
      )),
    );
  }
}

class NumberTextField extends StatefulWidget {
  const NumberTextField({
    super.key,
    required this.numberNontroller,
  });

  final TextEditingController numberNontroller;

  @override
  State<NumberTextField> createState() => _NumberTextFieldState();
}

class _NumberTextFieldState extends State<NumberTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.numberNontroller,
      keyboardType: TextInputType.number,
      // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: const InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        labelText: "Enter number",
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        hintStyle: TextStyle(color: Colors.grey),
      ),
    );
  }
}
