import 'package:get/get.dart';

class SavedJobsController extends GetxController {
  var jobs = [
    {
      'title': 'UX Designer',
      'company': 'Google Inc.',
      'location': 'California, USA',
      'type': 'Full time',
      'experience': 'Senior designer',
      'time': '25 mins ago',
      'salary': '\$15K/mo',
    },
    {
      'title': 'Lead Designer',
      'company': 'Dribbble Inc.',
      'location': 'California, USA',
      'type': 'Full time',
      'experience': 'Senior designer',
      'time': '25 mins ago',
      'salary': '\$20K/mo',
    },
    {
      'title': 'UX Researcher',
      'company': 'Twitter Inc.',
      'location': 'California, USA',
      'type': 'Full time',
      'experience': 'Senior designer',
      'time': '25 mins ago',
      'salary': '\$12K/mo',
    },
  ].obs;
}