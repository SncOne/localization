import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

class Language {
  Locale locale;
  String langName;
  Language({
    required this.locale,
    required this.langName,
  });
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Language> languageList = [
    Language(
      langName: 'English - UK',
      locale: const Locale('en'),
    ),
    Language(
      langName: 'French - FR',
      locale: const Locale('fr'),
    )
  ];

  Language? selectedLang;

  @override
  Widget build(BuildContext context) {
    selectedLang = languageList.singleWhere((e) => e.locale == context.locale);
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(20.0),
          child: Container(
            height: 40,
            padding: const EdgeInsets.only(left: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              border: Border.all(color: Colors.black, width: .9),
            ),
            child: Container(
              padding: const EdgeInsets.only(left: 4, right: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  DropdownButton<Language>(
                    iconSize: 18,
                    elevation: 16,
                    value: selectedLang,
                    style: const TextStyle(color: Colors.black),
                    underline: Container(
                      padding: const EdgeInsets.only(left: 4, right: 4),
                      color: Colors.transparent,
                    ),
                    onChanged: (newValue) {
                      setState(() {
                        selectedLang = newValue!;
                      });
                      if (newValue!.langName == 'English - UK') {
                        context.setLocale(const Locale('en'));
                      } else if (newValue.langName == 'French - FR') {
                        context.setLocale(const Locale('fr'));
                      }
                    },
                    items: languageList
                        .map<DropdownMenuItem<Language>>((Language value) {
                      return DropdownMenuItem<Language>(
                        value: value,
                        child: Text(
                          value.langName,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Row(
              children: [
                Text(
                  'title'.tr() + ":",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Expanded(
                    child: Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Text(
                    'app_local_demo'.tr(),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                )),
              ],
            ),
          ),
          Container(
            width: width,
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Row(
              children: [
                Text(
                  'details'.tr() + ":",
                  style: const TextStyle(fontSize: 15),
                ),
                Expanded(
                    child: Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Text('demo_details'.tr(),
                      style: const TextStyle(fontSize: 15)),
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
