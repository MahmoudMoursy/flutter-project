import 'package:flutter/material.dart';
import 'package:task/consts/app_color.dart';
import 'package:task/firebase/services.dart';
import 'package:task/models/company_model.dart';
import 'package:task/review/custom_widget.dart/home_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({required this.email, super.key});
  final String email;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            children: [
              const Text(
                "Choose Company",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: StreamBuilder<List<CompanyModel>?>(
                  stream: Services.getAllCompanies(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(color: AppColor.primary),
                      );
                    }
                    final data = snapshot.data;
                    if (data == null || data.isEmpty) {
                      return const Center(child: Text("No Companies Available"));
                    }

                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: HomeCard(
                            img: data[index].companyImage ?? '',
                            title: data[index].title ?? '',
                            subTitle: data[index].subtitle ?? '',
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                'add review',
                                arguments: {
                                  "email": widget.email,
                                  "img": data[index].companyImage ?? '',
                                  "title": data[index].title ?? '',
                                },
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
