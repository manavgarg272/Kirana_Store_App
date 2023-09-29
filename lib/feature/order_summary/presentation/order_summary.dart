import 'package:flutter/material.dart';

class OrderSummaryWidget extends StatefulWidget {
  const OrderSummaryWidget({super.key});

  @override
  State<OrderSummaryWidget> createState() => _OrderSummaryWidgetState();
}

class _OrderSummaryWidgetState extends State<OrderSummaryWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("Order Summary List"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: size.height / 50, horizontal: size.height / 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: Text("Product Name",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: size.height / 80),
                          textAlign: TextAlign.center)),
                  Expanded(
                      child: Text("Quantity",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: size.height / 80),
                          textAlign: TextAlign.center)),
                  Expanded(
                      child: Text("Price",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: size.height / 80),
                          textAlign: TextAlign.center)),
                  Expanded(
                      child: Text("Total",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: size.height / 80),
                          textAlign: TextAlign.center)),
                ],
              ),
            ),
            ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.symmetric(
                        vertical: size.height / 50,
                        horizontal: size.height / 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Text("${index + 1}. Gold Marrie Biscuit",
                                textAlign: TextAlign.center)),
                        Expanded(
                            child: Text(
                          "x 3",
                          textAlign: TextAlign.center,
                        )),
                        Expanded(
                            child: Text("Rs 200", textAlign: TextAlign.center)),
                        Expanded(
                            child: Text("Rs 600", textAlign: TextAlign.center)),
                      ],
                    ),
                  );
                }),
SizedBox(height: size.height/30),
                Container(
                  child: Text("Total Order Amount is Rs 200"),
                )
          ],
        ),
      ),
    );
  }
}
