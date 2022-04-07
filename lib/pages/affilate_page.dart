import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skilled_tasker/widgets/drawer.dart';

class AffilatePage extends StatefulWidget {
  const AffilatePage({Key? key}) : super(key: key);

  @override
  _AffilatePageState createState() => _AffilatePageState();
}

class _AffilatePageState extends State<AffilatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        elevation: 0.0,
        title: const Text("Affilate"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0))),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Image.asset(
                  "assets/images/Afflilate.png",
                  height: 150,
                  width: 200,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Center(
                  child: Text(
                      "Refer to your friends to Download the SkilledTaskerApp and Earn 5 points"),
                ),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: "zdfzdfz"));
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog();
                        });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 2),
                    height: 50,
                    alignment: Alignment.center,
                    child: const Text(
                      "sjdgdsfds32",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.blue[900],
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () async {
                        //   await Share.share(
                        //       'Hi! I am using Skilled Tasker application for earning vouchers by completing the tasks uploaded by many companies. So, use my refer code to earn some exciting vouchers. Its safe and secure app http://www.w3school.com');
                        // },
                      },
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 2),
                        height: 50,
                        alignment: Alignment.center,
                        child: const Text(
                          "SHARE",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                )
              ],
            ),
          ),
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
