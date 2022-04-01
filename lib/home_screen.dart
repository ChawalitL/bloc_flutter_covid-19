// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_apicovid_bloc/bloc/apicovidtoday_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    context.read<ApicovidtodayBloc>().add(GetApiEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.blueAccent],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: BlocConsumer<ApicovidtodayBloc, ApicovidtodayState>(
          builder: (context, state) {
            if (state is StateLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GetApiStateSuccess) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).padding.top + 20,
                  ),
                  Center(
                    child: Text(
                      DateFormat('dd-MM-yyyy')
                          .format((state.covids[0].datetime)),
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.white,
                      child: ListTile(
                        trailing: Text(
                          'ติดเชื้อ',
                          style: TextStyle(
                            fontSize: 16
                          ),
                        ),
                        title: Text(
                          'วันนี้  ${state.covids[0].newcase}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          'รวม  ${state.covids[0].totalcase}',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.red.shade300),
                        ),
                        leading: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.person,
                              color: Colors.blue,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.white,
                      child: ListTile(
                        trailing: Text(
                          'ไม่รวมต่างประเทศ',
                          style: TextStyle(
                            fontSize: 16
                          ),
                        ),
                        title: Text(
                          'วันนี้  ${state.covids[0].newexcludeabroad}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          'รวม  ${state.covids[0].totalexcludeabroad}',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.red.shade300),
                        ),
                        leading: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.airplanemode_on,
                              color: Colors.black87,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.white,
                      child: ListTile(
                        trailing: Text(
                          'รักษาหาย',
                          style: TextStyle(
                            fontSize: 16
                          ),
                        ),
                        title: Text(
                          'วันนี้  ${state.covids[0].newrecovered}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          'รวม  ${state.covids[0].totalrecovered}',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.green.shade300),
                        ),
                        leading: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.local_hospital,
                              color: Colors.green,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.white,
                      child: ListTile(
                        trailing: Text(
                          'เสียชีวิต',
                          style: TextStyle(
                            fontSize: 16
                          ),
                        ),
                        title: Text(
                          'วันนี้  ${state.covids[0].newdeath}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          'รวม  ${state.covids[0].totaldeath}',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.red.shade300),
                        ),
                        leading: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.disabled_by_default_sharp,
                              color: Colors.red.shade400,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
            return Text('Error');
          },
          listener: (context, state) {
            if (state is StateError) {
              print(state);
            }
          },
        ),
      ),
    );
  }
}
