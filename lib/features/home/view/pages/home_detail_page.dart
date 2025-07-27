import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:ishla_app/features/home/view/pages/upload_cv_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

import '../../../../core/style/app_colors.dart';

class HomeDetailPage extends StatefulWidget {
  const HomeDetailPage({super.key});

  @override
  _HomeDetailPageState createState() => _HomeDetailPageState();
}

class _HomeDetailPageState extends State<HomeDetailPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _openMap() async {
    final url = 'https://www.google.com/maps/search/?api=1&query=${40.76870974463716},${72.36189067597718}';
    try {
      await launchUrl(Uri.parse(url));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not open the map')),
      );
    }
  }

  String _formatDate(DateTime date) {
    return DateFormat('MMM dd, yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: REdgeInsets.all(16.0),
                    child: const CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 30,
                      child: Icon(
                        Icons.work_outline,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  const Text(
                    "UI UX",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [],
                  ),
                  const SizedBox(height: 16),
                  TabBar(
                    controller: _tabController,
                    labelColor: AppColors.lightOrange,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: AppColors.lightOrange,
                    tabs: const [
                      Tab(text: 'Details'),
                      Tab(text: 'Company'),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildDetailsTab(),
                  _buildCompanyTab(),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              color: Colors.white,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(UploadCvPage());
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Application submitted')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.lightOrange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    'APPLY NOW',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailsTab() {
    final responsibilities = [
      'Create wireframes and prototypes.',
      'Collaborate with developers and product managers.',
    ];
    final requirements = [
      '3+ years of experience in UI/UX design.',
      'Proficiency in Figma or Adobe XD.',
    ];
    final benefits = ['Remote work', 'Flexible hours', 'Gym membership'];
    final technologies = ['Figma', 'Adobe XD', 'Sketch'];
    final postedDate = DateTime.now();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle('Job Description'),
          _sectionText("Need really experienced UI UX Designer"),
          _sectionTitle('Responsibilities'),
          ..._buildBulletList(responsibilities),
          _sectionTitle('Requirements'),
          ..._buildBulletList(requirements),
          _sectionTitle('Location'),
          const SizedBox(height: 8),
          InkWell(
            onTap: _openMap,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                      color: Colors.grey[300],
                    ),
                    child: const Center(
                      child: Icon(Icons.location_on, color: Colors.red, size: 40),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      "Andijan, Uzbekistan",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          _sectionTitle('Information'),
          _buildInfoItem('Salary', '\$2000/month'),
          _buildInfoItem('Experience', '3+ years'),
          _buildInfoItem('Job Type', 'Full-Time'),
          _buildInfoItem('Posted Date', _formatDate(postedDate)),
          _sectionTitle('Benefits and Perks'),
          ..._buildBulletList(benefits),
          _sectionTitle('Technologies and Skills'),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: technologies.map((tech) => Chip(label: Text(tech))).toList(),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildCompanyTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle('About CreativeX'),
          _sectionText('CreativeX is a fast-growing digital agency focused on delivering high-quality UI/UX solutions for businesses.'),
          const SizedBox(height: 24),
          _sectionTitle('Company Photos'),
          const SizedBox(height: 16),
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) => Container(
                width: 200,
                margin: const EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Icon(Icons.image, size: 40, color: Colors.grey),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildBulletList(List<String> items) {
    return items
        .map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: [
                  const Text('• ', style: TextStyle(fontWeight: FontWeight.bold)),
                  Expanded(child: Text(item)),
                ],
              ),
            ))
        .toList();
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _sectionText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        text,
        style: TextStyle(color: Colors.grey[700]),
      ),
    );
  }
}
