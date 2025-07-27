import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/data/models/company_model.dart';
import '../pages/connection_detail_page.dart';
import 'company_card_widget.dart';

class CompaniesGrid extends StatelessWidget {
  CompaniesGrid({super.key});

  final List<CompanyData> companies = [
    CompanyData(
      name: 'Google Inc',
      logoColor: Colors.amber,
      logoIcon: 'G',
      followers: '1M',
    ),
    CompanyData(
      name: 'Dribbble Inc',
      logoColor: Colors.pink,
      logoIcon: '🏀',
      followers: '1M',
    ),
    CompanyData(
      name: 'Twitter Inc',
      logoColor: Colors.blue,
      logoIcon: '🐦',
      followers: '1M',
    ),
    CompanyData(
      name: 'Apple Inc',
      logoColor: Colors.grey[800]!,
      logoIcon: '🍎',
      followers: '1M',
    ),
    CompanyData(
      name: 'Facebook Inc',
      logoColor: Colors.indigo,
      logoIcon: 'f',
      followers: '1M',
    ),
    CompanyData(
      name: 'Microsoft Inc',
      logoColor: Colors.transparent,
      logoIcon: '🪟',
      followers: '1M',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 10.h,
      ),
      itemCount: companies.length,
      itemBuilder: (context, index) {
        return CompanyCard(
          company: companies[index],
          onTap: () {
            Get.to(
              DetailPage(
                companyLogo: 'https://cdn4.iconfinder.com/data/icons/logos-brands-7/512/google_logo-google_icongoogle-512.png',
                jobTitle: 'UX/UI Designer',
                companyName: 'Google',
                location: 'California',
                postedTime: '1 day ago',
                aboutCompany:
                    'Build a consistent, cohesive interaction and visual design as an essential member of our versatile design team. Evolve the company identity as our company expands to address new markets and challenges.',
                responsibilities:
                    'Design beautiful, usable interfaces for mobile, web and desktop. Create coherent user journeys and solve UX problems.',
                website: 'www.kun.uz',
                industry: 'Internet product',
                employeeSize: '10,000+',
                headOffice: 'New York, California, Zurich, Berlin',
                type: 'Multinational company',
                specialization: 'Search, Email, Maps, Shopping, Software and Cloud computing services.',
                imageGallery: [
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpqJeMMJKQ0KzoJGDcVUbSP2PvBd8Ik85tiA&s',
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSblZ9YNv6gwVyunqGwUw2mrZq9G1Gu8FhRfQ&s'
                ],
              ),
            );
          },
        );
      },
    );
  }
}
