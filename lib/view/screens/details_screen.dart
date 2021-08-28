import 'package:flutter/material.dart';
import 'package:gstsampleproject/model/gst.dart';
import './../utilities/ext.dart';

class DetailsPage extends StatefulWidget {
  final String gstin;
  final Gst gstData;
  // ignore: non_constant_identifier_names
  const DetailsPage({Key? key, required this.gstin, required this.gstData})
      : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
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
            SizedBox(height: 18),
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
            SizedBox(height: 18),
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
            SizedBox(height: 18),
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
            SizedBox(height: 18),
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
            SizedBox(height: 18),
          ],
        ),
      ),
    );
  }
}