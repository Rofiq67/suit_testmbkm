import 'package:flutter/material.dart';

import 'model.dart';
import 'third_screen.dart';

class SecondScreen extends StatefulWidget {
  final String name;
  final User? selectedUser;

  const SecondScreen({Key? key, required this.name, this.selectedUser})
      : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String selectedUserName = '';

  @override
  void didUpdateWidget(covariant SecondScreen oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Periksa apakah terjadi perubahan di widget (misalnya, dari Layar Ketiga)
    if (oldWidget.selectedUser != widget.selectedUser) {
      // Terapkan pembaruan sesuai kebutuhan
      setState(() {
        selectedUserName = widget.selectedUser != null
            ? '${widget.selectedUser!.firstName} ${widget.selectedUser!.lastName}'
            : '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TextEditingController _name = TextEditingController(text: name);

    return Scaffold(
      backgroundColor: Colors.white,
      //flutter v3.16 not working on elevation(shadow)
      appBar: PreferredSize(
          preferredSize: const Size(double.maxFinite, 48),
          child: Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 5,
                offset: const Offset(0, 0.5),
              )
            ]),
            child: AppBar(
              foregroundColor: Colors.white,
              title: const Text(
                'Second Screen',
                style: TextStyle(
                  color: Color(0xFF04021D),
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 0.08,
                ),
              ),
              centerTitle: true,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Color(0xff554AF0),
                  )),
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome',
                style: TextStyle(
                  color: Color(0xFF04021D),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0.25,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(widget.name),
              const SizedBox(
                height: 222,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.selectedUser != null
                        ? '${widget.selectedUser!.firstName} ${widget.selectedUser!.lastName}'
                        : 'Choose User Name',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF04021D),
                      fontSize: 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0.06,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
              //chose user
              const SizedBox(
                height: 205,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    final selectedUser = await Navigator.push<User?>(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ThirdScreen(name: widget.name),
                      ),
                    );
                    if (selectedUser != null) {
                      setState(() {
                        selectedUserName =
                            '${selectedUser.firstName} ${selectedUser.lastName}';
                      });
                    }
                  },

                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2B637B),
                      maximumSize: const Size(310, 41),
                      minimumSize: const Size(310, 41),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  child: const Text(
                    'Choose a User',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
