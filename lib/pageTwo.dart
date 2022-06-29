import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextEditingController textFieldController = TextEditingController();

class PageTwo extends StatefulWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  //String _string = 'hai';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(244, 247, 252, 1),
        appBar: AppBar(
            title: const Text("Setting"),
            backgroundColor: Colors.teal,
            leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  _sendDataBack(context);
                })),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                namaDokter: 'Dr. Bruno Rodrigues',
                spesialis: 'Orthopedic Specialist',
                review: '470 Review',
                bintang: '4.9/5',
                isStatus: false,
              ),
            ],
          ),
        ));
  }
}

class Card extends StatelessWidget {
  Card(
      {Key? key,
      required this.namaDokter,
      required this.spesialis,
      required this.bintang,
      required this.review,
      required this.isStatus})
      : super(key: key);
  String namaDokter;
  String spesialis;
  String bintang;
  String review;
  bool isStatus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        margin: const EdgeInsets.only(top: 110),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 350,
                  height: 230,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.only(top: 20, left: 25),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                namaDokter,
                                style: const TextStyle(
                                    fontSize: 17,
                                    //fontWeight: FontWeight.w100,
                                    fontFamily: "Poppins",
                                    color: Color.fromRGBO(55, 67, 103, 1)),
                              ),
                              // ignore: prefer_const_constructors
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                spesialis,
                                // ignore: prefer_const_constructors
                                style: TextStyle(
                                  fontSize: 13,
                                  //fontWeight: FontWeight.w100,
                                  fontFamily: "Poppins",
                                  color: Colors.teal,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 35),
                            //onPressed: () {},
                            width: 130,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: const Color.fromRGBO(255, 56, 52, 1),
                            ),
                            child: Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.star_sharp,
                                  color: Colors.yellow,
                                  size: 20,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  bintang,
                                  style: TextStyle(
                                    fontSize: 13,
                                    //fontWeight: FontWeight.w100,
                                    fontFamily: "Poppins",
                                    color: Colors.white,
                                  ),
                                ),
                                // SizedBox(
                                //   width: 1,
                                // ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 0),
                            //onPressed: () {},
                            width: 145,
                            height: 30,
                            // decoration: BoxDecoration(
                            //   // borderRadius: BorderRadius.circular(50),
                            //   color: Colors.grey[300],
                            // ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: cardStatus(isStatus: isStatus),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 20),
                            //onPressed: () {},
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.teal,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text(
                                  "View Review",
                                  style: TextStyle(
                                      fontSize: 16,
                                      //fontWeight: FontWeight.w400,
                                      fontFamily: "Poppins",
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextField(
                  controller: textFieldController,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );

    throw UnimplementedError();
  }
}

class cardStatus extends StatefulWidget {
  cardStatus({Key? key, required this.isStatus}) : super(key: key);
  bool isStatus;

  @override
  State<cardStatus> createState() => cardStatusState();
}

class cardStatusState extends State<cardStatus> {
  String status = 'Online';
  Color colBackground = Color.fromRGBO(39, 174, 96, 1);

  Color colText = Colors.white;

  void getStatus() {
    if (!widget.isStatus) {
      status = "Offline";
      colBackground = Color.fromRGBO(245, 245, 245, 1);
      colText = Color.fromRGBO(180, 180, 180, 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool sen = widget.isStatus;
    getStatus();
    return GestureDetector(
      onTap: () {
        if (!sen) {
          setState(() {
            widget.isStatus = true;
            status = "Online";
            colBackground = Color.fromRGBO(39, 174, 96, 1);
            colText = Colors.white;
          });
        } else if (sen) {
          setState(() {
            widget.isStatus = false;
            status = "Not yet";
            colBackground = Color.fromRGBO(245, 245, 245, 1);
            colText = Color.fromRGBO(180, 180, 180, 1);
          });
        }
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: colBackground),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            status,
            style: TextStyle(color: colText),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

void _sendDataBack(BuildContext context) {
  String textToSendBack = textFieldController.text;
  Navigator.pop(context, textToSendBack);
}
