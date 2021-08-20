import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'mock.dart';
import 'ext.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool tabN = true;
  bool check = false;
  String gstin = "";

  late GstData gstData;
  // GstData gstData = new GstData(
  //   gstin: 'gstin',
  //   name: 'name',
  //   status: 'status',
  //   address: 'address',
  //   taxtype: 'taxtype',
  //   biztype: 'biztype',
  //   dor: 'dor',
  //   userId: 'userId',
  // );

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> getData() async {
    await fetchGstData(gstin).then((value) {
      gstData = value;
      check = true;
    });
    //await Future.delayed(Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Icon(Icons.view_module),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(30)),
                  color: Colors.green,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Search the type for",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                    Text(
                      "GST Number Search Tool",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                tabN = true;
                              });
                            },
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)))),
                            child: Text("Search GST Number"),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                tabN = false;
                              });
                            },
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)))),
                            child: Text("GST Return Status"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10)
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30),
                child: Container(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            labelStyle:
                                TextStyle(fontSize: 24, color: Colors.green),
                            labelText: "Enter GST number",
                            hintText: "Ex 06AFQPJ1959L1ZV",
                            hintStyle: TextStyle(color: Colors.grey),
                            fillColor: Colors.white10,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter some text";
                            }
                            setState(
                              () {
                                gstin = value;
                              },
                            );
                            return null;
                          },
                        ),
                        SizedBox(height: 25),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              padding: EdgeInsets.symmetric(vertical: 16)),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              getData().then(
                                (value) {
                                  check
                                      ? Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Page2(
                                              gstin: gstin,
                                              gstData: gstData,
                                            ),
                                          ),
                                        )
                                      : tabN = true;
                                },
                              );
                            }
                          },
                          child: Center(
                            child: Text(
                              'Search',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                    "Sample code to test...\nActive - 73137\nDisabled - 28738\n\nPlease check the mockapi data to get the url and see the raw json data\n\nI took a lot of time doing other import stuff and learned few things along the way. I didnt got to make the Switchable_Text ^Above. As shown in the email mock design."),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Page2 extends StatefulWidget {
  final String gstin;
  final GstData gstData;
  // ignore: non_constant_identifier_names
  const Page2({Key? key, required this.gstin, required this.gstData})
      : super(key: key);

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  bool tabN = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GST Profile"),
        backgroundColor: widget.gstData.status ? Colors.green : Colors.red,
        elevation: 0,
        actions: [],
      ),
      bottomNavigationBar: widget.gstData.status ?GestureDetector(
        onTap: () {
          final snackbar =
              SnackBar(content: Text("Button Pressed.... Demo function!!"));
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        },
        child: Container(
            color: widget.gstData.status ? Colors.green : Colors.red,
            width: double.infinity,
            height: 75,
            child: Center(
                child: Text(
              "Get Return Filling Status",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ))),
      ):Container(
        height: 0,
        color:Colors.white
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(30)),
                color: widget.gstData.status ? Colors.green : Colors.red,
              ),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "GSTIN of the tax payer",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                    Text(
                      '${widget.gstData.gstin}', //##@@ gstin Number info
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Text(
                      widget.gstData.name
                          .toUpperCase(), //##@@ gstin Number info
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Icon(
                              Icons.wb_sunny,
                              color: widget.gstData.status
                                  ? Colors.green
                                  : Colors.red,
                            ),
                            SizedBox(width: 8),
                            Text(
                              widget.gstData.status
                                  ? "active".toUpperCase()
                                  : "disabled"
                                      .toUpperCase(), //##@@ gstin Number info
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Card(
                elevation: 1,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                color: Colors.white,
                child: Row(children: [
                  Container(
                    width: 25,
                    color: widget.gstData.status ? Colors.green : Colors.red,
                    child: Text(""),
                  ),
                  SizedBox(width: 18),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(height: 10),
                        Text("Principle Place of Bussiness"),
                        SizedBox(height: 10),
                        Text(widget.gstData.address,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            )),
                        SizedBox(height: 25),
                        Text("Additional Place of Bussiness"),
                        SizedBox(height: 10),
                        Text(
                          "Floor",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 10),
                      ]),
                ]),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "State Jurisdiction",
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            "Ward ${widget.gstData.ward}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Corner Jurisdiction",
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            "Range - ${widget.gstData.range}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "TaxPayer Type",
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            widget.gstData.taxtype ? "Regular" : "Composite",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Card(
                elevation: 1,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                color: Colors.white,
                child: Row(children: [
                  SizedBox(width: 8),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          "Condition of Bussiness",
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          widget.gstData.biztype
                              ? "Private Limited Company"
                              : "Incorporation",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                      ]),
                ]),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Card(
                elevation: 1,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(height: 10),
                              Text(
                                "Date of Registration",
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                              Text(
                                "01/07/2017",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                            ]),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(height: 10),
                              Text(
                                "Date of Cancellation",
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                              Text(
                                widget.gstData.status
                                    ? "--"
                                    : widget.gstData.cancel.capitalize(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                            ]),
                      ]),
                ),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
