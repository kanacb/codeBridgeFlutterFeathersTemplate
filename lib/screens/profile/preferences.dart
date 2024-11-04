import 'package:flutter/material.dart';
import '../../components/profiles/profile.dart';
import '../../components/profiles/profileService.dart';
import '../../components/users/users.dart';
import '../../global.dart';
import '../../services/projectServices.dart';
import '../../services/utils.dart';
import '../../validators.dart';
import '../widgets/drop_down.dart';

class Preferences extends StatefulWidget {
  const Preferences({super.key, required this.user});
  final Users user;
  @override
  State<Preferences> createState() => _PreferencesState();
}

class _PreferencesState extends State<Preferences> {
  ProfileService profilesService = ProfileService();
  late Profiles profileData;
  late LabeledGlobalKey<FormState> key =
      LabeledGlobalKey<FormState>("ChangeEmail");
  final mobileTypes = ["home", "work"];

  getProfile() async {
    final user = Utils.getUserFromLocalStorage()["user"];
    // final response = await profilesService.find({"userId": user.id});
    // if (response.errorMessage == "") {
    //   logger.i(response.data!.toString());
    //   profileData = response.data?.first as Profiles;
    // } else {
    print("getProfile");
    profileData = Profiles(
        id: "",
        userId: user.id,
        nickName: "",
        mobile: "",
        mobileType: "",
        location: "",
        locationType: "",
        trader: "",
        photo: "",
        language: "",
        createdBy: user.id,
        currency: "",
        dateFormat: "",
        timeFormat: "",
        timeZone: "");
    showSnackBar("");
    // }
  }

  setDropdown(String field, String value) {
    setState(() {
      Map<String, dynamic> temp = profileData.toJson();
      temp[field] = value;
      // profileData = Profiles.fromMap(temp);
    });
  }

  showSnackBar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        elevation: 2,
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(5),
      ),
    );
  }

  @override
  void initState() {
    getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            "${widget.user.name}'s preferences",
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w200),
          ),
        ),
        body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              key: key,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'My Preferences',
                      style: TextStyle(fontSize: 50.0),
                    ),
                    TextFormField(
                      initialValue: profileData.nickName,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (Validators.isStringNotEmpty(value)) {
                          return "";
                        }
                        return "Please enter nick name";
                      },
                      onSaved: (value) {
                        profileData.nickName = value!;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Enter your nick name',
                        labelText: 'Nick name',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DropdownWidget(
                        label: "Mobile Type",
                        value: profileData.mobileType ?? mobileTypes[0],
                        onSelected: () => setDropdown("mobileType", ""),
                        list: mobileTypes
                            .map((e) => {
                                  "label": e,
                                  "value": e,
                                  "enabled": true,
                                })
                            .toList()),
                    TextFormField(
                      initialValue: profileData.mobile,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (Validators.isStringNotEmpty(value)) {
                          return "";
                        }
                        return "Please enter mobile";
                      },
                      onSaved: (value) {
                        profileData.mobile = value!;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Enter your mobile number',
                        labelText: 'Mobile',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DropdownWidget(
                        label: "Location Type",
                        value: profileData.mobileType ?? mobileTypes[0],
                        onSelected: () => setDropdown("locationType", ""),
                        list: mobileTypes
                            .map((e) => {
                                  "label": e,
                                  "value": e,
                                  "enabled": true,
                                })
                            .toList()),
                    TextFormField(
                      maxLines: 5,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (Validators.isStringNotEmpty(value)) {
                          return "";
                        }
                        return "Please enter location";
                      },
                      onSaved: (value) {
                        profileData.mobile = value!;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Enter your address',
                        labelText: 'Address',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DropdownWidget(
                        label: "Trader",
                        value: profileData.trader ?? tradeBinary[0]['name'],
                        onSelected: () => setDropdown("trader", ""),
                        list: tradeBinary
                            .map((e) => {
                                  "label": e['name'],
                                  "value": e['name'],
                                  "enabled": true,
                                })
                            .toList()),
                    DropdownWidget(
                        label: "Language",
                        value: profileData.language ?? languages[0]['name'],
                        onSelected: () => setDropdown("language", ""),
                        list: languages
                            .map((e) => {
                                  "label": e['name'],
                                  "value": e['name'],
                                  "enabled": true,
                                })
                            .toList()),
                    DropdownWidget(
                        label: "Currency",
                        value: profileData.currency ?? currency[0]['name'],
                        onSelected: () => setDropdown("currency", ""),
                        list: currency
                            .map((e) => {
                                  "label": e['name'],
                                  "value": e['name'],
                                  "enabled": true,
                                })
                            .toList()),
                    DropdownWidget(
                        label: "Date Format",
                        value: profileData.dateFormat ?? dateFormat[0]['name'],
                        onSelected: () => ("dateFormat", ""),
                        list: dateFormat
                            .map((e) => {
                                  "label": e['name'],
                                  "value": e['name'],
                                  "enabled": true,
                                })
                            .toList()),
                    DropdownWidget(
                        label: "Time Format",
                        value: profileData.timeFormat ?? timeFormat[0]['name'],
                        onSelected: () => setDropdown("timeFormat", ""),
                        list: timeFormat
                            .map((e) => {
                                  "label": e['name'],
                                  "value": e['name'],
                                  "enabled": true,
                                })
                            .toList()),
                    DropdownWidget(
                        label: "Time Zone",
                        value: profileData.timeZone ?? timeZone[0]['name'],
                        onSelected: () => setDropdown("timeZone", ""),
                        list: timeZone
                            .map((e) => {
                                  "label": e['name'],
                                  "value": e['name'],
                                  "enabled": true,
                                })
                            .toList()),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              backgroundColor: colorPrimary,
                            ),
                            onPressed: () async {
                              if (key.currentState!.validate()) {
                                key.currentState!.save();
                                final patchResponse = await profilesService
                                    .patch(profileData.id, profileData);
                                if (context.mounted) {
                                  String msg = "";
                                  if (patchResponse.errorMessage == "") {
                                    msg = "Update profile";
                                  } else {
                                    msg = patchResponse.errorMessage!;
                                  }
                                  showSnackBar(msg);
                                }
                              }
                            },
                            child: const Text(
                              'Save preferences',
                              style: TextStyle(
                                  fontSize: 25.0, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )));
  }
}
