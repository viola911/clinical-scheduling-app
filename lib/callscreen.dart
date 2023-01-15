import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scheduling_app/constants.dart';

import 'model/model.dart';

class Callscreen extends StatefulWidget {
  final Product product;
  const Callscreen({Key? key, required this.product}) : super(key: key);

  @override
  State<Callscreen> createState() => _CallscreenState();
}

class _CallscreenState extends State<Callscreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: size.height * 0.9,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40)),
                    child: Image.asset(widget.product.image, fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 10),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_outlined),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 40,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: kSecondaryColor,
                          minimumSize: const Size(60, 60)),
                      onPressed: () => context.push('/AdminScreen'),
                      child: const Icon(Icons.call, color: Colors.white)),
                ),
                Positioned(
                  bottom: 20,
                  right: 40,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.grey,
                          backgroundColor: kSecondaryColor,
                          minimumSize: const Size(60, 60)),
                      onPressed: () {},
                      child: const Icon(Icons.video_call, color: Colors.white)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      height: 80,
                      decoration: const BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15))),
                      child: const Text(
                        "Keep me updated if there's anything you need",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: SizedBox(
                      height: 60,
                      width: 60,
                      child: Image.asset("assets/images/images.png"),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Enter message",
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      focusedBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                IconButton(
                  color: Colors.black38,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.emoji_emotions_outlined,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
