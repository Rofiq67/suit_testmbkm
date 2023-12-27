import 'package:flutter/material.dart';
import 'package:test_mbkm/repository.dart';
import 'model.dart';
import 'second_screen.dart';

class ThirdScreen extends StatefulWidget {
  final String name;

  const ThirdScreen({Key? key, required this.name}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  late List<User> listUser;
  Repository repository = Repository();
  bool isLoading = false;

  Future<void> refresh() async {
    await getData();
  }

  Future<void> getData() async {
    try {
      final response = await repository.getData();
      if (response != null) {
        setState(() {
          listUser = response;
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    listUser = [];
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("List User Length: ${listUser.length}");
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
                'Third Screen',
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
      body: RefreshIndicator(
        onRefresh: refresh,
        child: ListView.separated(
          itemBuilder: (context, index) {
            return Container(
              height: 80,
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () async {
                  final selectedUser = await Navigator.push<User?>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondScreen(
                        name: widget.name,
                        selectedUser: listUser[index],
                      ),
                    ),
                  );
                  if (selectedUser != null) {
                    Navigator.pop(context, selectedUser);
                  }
                },
                style: ElevatedButton.styleFrom(
                  surfaceTintColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                  backgroundColor: Colors.white,
                  shadowColor: Colors.black.withOpacity(0.1),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 49,
                      height: 49,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(listUser[index].avatar),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              listUser[index].firstName,
                              style: const TextStyle(
                                color: Color(0xFF04021D),
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              listUser[index].lastName,
                              style: const TextStyle(
                                color: Color(0xFF04021D),
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          listUser[index].email,
                          style: const TextStyle(
                            color: Color(0xFF686777),
                            fontSize: 10,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: listUser.length,
        ),
      ),
    );
  }
}
