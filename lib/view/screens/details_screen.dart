import 'package:flutter/material.dart';
import 'package:gstin_check/model/apis/api_response.dart';
import 'package:gstin_check/model/gst.dart';
import 'package:gstin_check/view_model/gst_view_model.dart';
import 'package:provider/provider.dart';
import 'package:timelines/timelines.dart';
import './../utilities/ext.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    ApiResponse? apiResponse = Provider.of<GstViewModel>(context).apiResponse;
    switch (apiResponse?.status) {
      case Status.INITIAL:
        return Scaffold(
          body: Center(
            child: Text("Empty Data"),
          ),
        );
      case Status.LOADING:
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      case Status.COMPLETED:
        Gst gst = apiResponse?.data;
        return Scaffold(
          appBar: AppBar(
            title: Text("GST Profile"),
            backgroundColor: gst.status ? Colors.green : Colors.red,
            elevation: 0,
            actions: [],
          ),
          bottomNavigationBar: gst.status
              ? GestureDetector(
                  onTap: () {
                    final snackbar = SnackBar(
                      content: Text("Button Pressed.... Demo function!!"),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  },
                  child: Container(
                    color: gst.status ? Colors.green : Colors.red,
                    width: double.infinity,
                    height: 75,
                    child: Center(
                      child: Text(
                        "Get Return Filling Status",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              : Container(height: 0, color: Colors.white),
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
                    color: gst.status ? Colors.green : Colors.red,
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
                          '${gst.gstin}', //##@@ gstin Number info
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20),
                        Text(
                          gst.name.toUpperCase(), //##@@ gstin Number info
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
                                  color: gst.status ? Colors.green : Colors.red,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  gst.status
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
                    shape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                    color: Colors.white,
                    child: FixedTimeline(
                      children: [
                        TimelineTile(
                          nodePosition: 0.1,
                          node: SizedBox(
                            height: 75,
                            child: TimelineNode.simple(color: gst.status ? Colors.green: Colors.red),
                          ),
                          contents: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10),
                                Text("Principle Place of Bussiness"),
                                SizedBox(height: 10),
                                Text(
                                  gst.address,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        TimelineTile(
                          nodePosition: 0.1,
                          node: SizedBox(
                            height: 75,
                            child: TimelineNode.simple(color: gst.status ? Colors.green: Colors.red),
                          ),
                          contents: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10),
                                Text("Additional Place of Bussiness"),
                                SizedBox(height: 10),
                                Text(
                                  'Floor',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
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
                                "Ward ${gst.ward}",
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
                                "Range - ${gst.range}",
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
                                gst.taxtype ? "Regular" : "Composite",
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
                    shape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.zero),
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
                              gst.biztype
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
                    shape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(height: 10),
                                  Text(
                                    "Date of Cancellation",
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                  Text(
                                    gst.status ? "--" : gst.cancel.capitalize(),
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
      case Status.ERROR:
        return Scaffold(
          body: Center(
            child: Text("Error while fetching data : Details not found."),
          ),
        );
      default:
        return Scaffold(
          body: Text(
              "Default Mode, Api Status not working : Error while fetching data"),
        );
    }
  }
}
