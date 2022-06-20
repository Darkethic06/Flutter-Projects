import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int tipPercentage = 0;
  int personCount = 1;
  double billAmount = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tip Calculator"),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        alignment: Alignment.center,
        //  color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.blue[300],
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Total Per Person",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  Text(
                    "₹" +
                        totalPerPerson(billAmount, tipPercentage, personCount),
                    style: TextStyle(color: Colors.white, fontSize: 19),
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 15),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.black54),
                      decoration: InputDecoration(
                        hintText: "Bill Amount",
                      ),
                      onChanged: (String value) {
                        try {
                          billAmount = double.parse(value);
                        } catch (e) {
                          billAmount = 0.0;
                        }
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Person Count :",
                        style: TextStyle(color: Colors.black87, fontSize: 18),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                personCount--;
                                if (personCount < 1) {
                                  personCount = 1;
                                }
                              });
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.blue[300],
                                  borderRadius: BorderRadius.circular(300)),
                              child: Center(
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 35,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Text("$personCount"),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                personCount++;
                              });
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.blue[300],
                                  borderRadius: BorderRadius.circular(300)),
                              child: Center(
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 35,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Tip :",
                          style: TextStyle(color: Colors.black87, fontSize: 18),
                        ),
                        Text(
                          "₹ ${CalcTotalTip(billAmount, tipPercentage)}",
                          style: TextStyle(color: Colors.black87, fontSize: 18),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "$tipPercentage%",
                        style: TextStyle(color: Colors.black87, fontSize: 18),
                      ),
                      Slider(
                          min: 0,
                          max: 100,
                          divisions: 20,
                          value: tipPercentage.toDouble(),
                          activeColor: Colors.blue,
                          inactiveColor: Colors.black54,
                          onChanged: (double newValue) {
                            setState(() {
                              tipPercentage = newValue.round();
                            });
                          })
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  CalcTotalTip(double billAmount, int tipPercentage) {
    double totalTip = 0.0;
    if (billAmount < 0 || billAmount.toString().isEmpty || billAmount == null) {
    } else {
      totalTip = (billAmount * tipPercentage / 100);
    }
    return totalTip.toStringAsFixed(2);
  }

  totalPerPerson(double billAmount, int tipPercentage, int person) {
    var totalPerPerson =
        (CalcTotalTip(billAmount, tipPercentage) + billAmount) / person;
    return totalPerPerson;
  }
  //
}

//  person , billAmount , tip
