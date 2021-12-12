import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

const String baseRoute = 'https://api.bastin.dev/apiv1';

class GetData {
  static dynamic aboutPageData;
  static dynamic introductionCardData;
  static dynamic contactData;
  static dynamic experienceData;
  static dynamic volunteerData;

  static Future<void> getAboutPageData() async {
    await http
        .get(Uri.parse(baseRoute + "/about/"))
        .then((value) => aboutPageData = jsonDecode(value.body)[0])
        .catchError((e) {
      log(e);
    });
  }

  static Future<void> getTitleData() async {
    await http.get(Uri.parse(baseRoute + "/title/")).then((value) {
      introductionCardData = jsonDecode(value.body);
    }).catchError((e) {
      log(e);
    });
  }

  static Future<void> getExperienceData() async {
    await http.get(Uri.parse(baseRoute + "/experience/")).then((value) {
      experienceData = jsonDecode(value.body)[0]["experience"];
      volunteerData = jsonDecode(value.body)[0]["volunteer"];
      // print(experienceData);
    }).catchError((e) {
      log(e);
    });
  }

  static Future<void> getAllData() async {
    await getAboutPageData();
    await getTitleData();
    await getExperienceData();
  }
}
