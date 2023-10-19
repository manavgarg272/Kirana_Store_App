import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderSummaryWidget extends StatefulWidget {
  const OrderSummaryWidget({super.key});

  @override
  State<OrderSummaryWidget> createState() => _OrderSummaryWidgetState();
}

class _OrderSummaryWidgetState extends State<OrderSummaryWidget>with SingleTickerProviderStateMixin {
  /* final items = List<String>.generate(20, (i) => 'Item ${i + 1}');

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(1.5, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticIn,
  )); */
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
        title:  Text("Order Summary List",   style: GoogleFonts.roboto(fontWeight: FontWeight.w600,
        fontSize: size.height / 40)
        
        ,),
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
                      child: Text("Products",
                          style: GoogleFonts.roboto( fontWeight: FontWeight.bold,
                          fontSize: size.height / 50),
                 
                          textAlign: TextAlign.center
                    
                    )
                             
                  ),
                  Expanded(
                      child: Text("Quantity",
                          style: GoogleFonts.roboto( fontWeight: FontWeight.bold,
                          fontSize: size.height / 50),
                          textAlign: TextAlign.center)),
                  Expanded(
                      child: Text("Price",
                          style: GoogleFonts.roboto( fontWeight: FontWeight.bold,
                          fontSize: size.height / 50),
                          textAlign: TextAlign.center)),
                  Expanded(
                      child: Text("Total",
                          style:GoogleFonts.roboto( fontWeight: FontWeight.bold,
                          fontSize: size.height / 50),
                          textAlign: TextAlign.center)),
                ],
              ),
            ),
            Divider(indent: size.height/30,endIndent: size.height/30,),
            ListView.builder(
                itemCount: 20,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                
                  return Container(
                    padding: EdgeInsets.all(size.height/50),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.grey.shade300)),
                    margin: EdgeInsets.symmetric(
                        vertical: size.height / 80,
                        horizontal: size.height / 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Text("Gold Marrie Biscuit",
                                textAlign: TextAlign.center,
                              
                              style: GoogleFonts.roboto(
                              fontSize: size.height / 70,fontWeight: FontWeight.w500),
                              )
                              
                              ),
                        Expanded(
                            child: Text(
                          "x 3",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            fontSize: size.height / 70,fontWeight: FontWeight.w500),
                            
                        )),
                        Expanded(
                            child: Text("Rs 200", textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              fontSize: size.height / 70,fontWeight: FontWeight.w500),
                              
                          )),
                        Expanded(
                            child: Text("Rs 600", textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              fontSize: size.height / 70,fontWeight: FontWeight.w500),
                              
                          )),
                      ],
                    ),
                  );
                }),
                SizedBox(height: size.height/30),
                Divider(indent: size.height/30,endIndent: size.height/30,),
                Text("Total Order Amount is Rs 200", style: GoogleFonts.roboto(
                    fontSize: size.height / 50,fontWeight: FontWeight.w500),
                    ),
                    Divider(indent: size.height/30,endIndent: size.height/30,),
          ],
        ),
      ),
    );
  }
}
