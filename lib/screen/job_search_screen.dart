import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nerdmine/api/api_controller_expo.dart';
import 'package:nerdmine/generated/assets.dart';
import 'package:nerdmine/model/job_search_screen.dart';
import 'package:nerdmine/res/Fonts.dart';
import 'package:nerdmine/screen/job_detail.dart';
import 'package:nerdmine/screen/profile_screen.dart';
import 'package:nerdmine/screen/user_info_screen.dart';
import 'package:nerdmine/utils/ApiBaseHelper.dart';
import 'package:nerdmine/utils/Session.dart';
import 'package:nerdmine/utils/colors.dart';
import 'package:nerdmine/utils/common.dart';
import 'package:nerdmine/utils/constant.dart';
import 'package:nerdmine/utils/flutter_toast.dart';
import 'package:nerdmine/utils/utility_helper.dart';
import 'package:nerdmine/utils/widget.dart';
import 'package:sizer/sizer.dart';

class JobSearchScreen extends StatefulWidget {
  const JobSearchScreen({Key? key}) : super(key: key);

  @override
  State<JobSearchScreen> createState() => _JobSearchScreenState();
}

class _JobSearchScreenState extends State<JobSearchScreen> {
  TextEditingController industryContr = TextEditingController();

  List<JobList>  listOfJobs = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
                decoration: boxDecoration(
                  bgColor: MyColorName.colorTextThird,
                  radius: 5.sp,
                ),
                height: getWidth(50),
                width: getWidth(50),
                margin: EdgeInsets.all(getWidth(10)),
                padding: EdgeInsets.all(getWidth(20)),
                child: Image.asset(
                  Assets.imagesBack,
                  fit: BoxFit.fill,
                )),
          ),
          backgroundColor: Color(0xffF2F4F8),
          elevation: 1,
          title: text("Job Search".toString(), textColor: MyColorName.primaryDark, fontFamily: fontMedium, fontSize: 14.sp),
          actions: [],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              boxHeight(54),
              TextField(
                controller: industryContr,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(48.sp),
                    borderSide: BorderSide(color: MyColorName.colorTextSecondary.withOpacity(0.2)),
                  ),
                  fillColor: MyColorName.colorBg1,
                  filled: true,
                  counterText: '',
                  contentPadding: EdgeInsets.all(getWidth(30)),
                  hintText: "Search here ...",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(48.sp),
                    borderSide: BorderSide(color: MyColorName.colorTextSecondary.withOpacity(0.2)),
                  ),
                ),
                onChanged: (s) {
                  searchApi(s);
                },
              ),
              boxHeight(54),
              Expanded(
                child: ListView(
                  children: [
                    if (listOfJobs.isNotEmpty) ...[
                      Text("Jobs", style: textStyle14px500w),
                      verticalSpace(10.0),
                    ],
                    if (listOfJobs.isNotEmpty)
                      ...listOfJobs
                          .map((e) => InkWell(
                                onTap: () {
                                  navigateScreen(context, JobDetailScreen(e.jobId.toString()));
                                },
                                child: Container(
                                  decoration: boxDecoration(radius: 10, bgColor: MyColorName.colorBg1),
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(borderRadius: BorderRadius.circular(8.0), child: commonImage(e.companyLogo, 136.0, 136.0, "", context, "")),
                                      boxWidth(10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            text(getString(e.jobTitle!), textColor: MyColorName.colorTextPrimary, fontFamily: fontMedium, fontSize: 10.sp),
                                            boxHeight(5),
                                            text(getString(e.companyName!), textColor: Color(0xff6D6D6D), fontFamily: fontRegular, fontSize: 7.5.sp),
                                            boxHeight(5),
                                            text(getString(e.location!), textColor: Color(0xff6D6D6D), fontFamily: fontRegular, fontSize: 7.5.sp),
                                            boxHeight(5),
                                            /*    Row(
                                    children: [
                                      Image.asset("images/user.png",width: getWidth(30),height: getHeight(30),),
                                      boxWidth(5),
                                      text("Your profile match this job",textColor: Color(0xff5e5e5e),fontFamily: fontRegular,fontSize: 7.5.sp),
                                    ],
                                  ),*/
                                            boxHeight(10),
                                            text(getDuration(e.createDate!), textColor: MyColorName.primaryDark, fontFamily: fontMedium, fontSize: 7.sp),
                                          ],
                                        ),
                                      ),
                                      boxWidth(10),
                                      // InkWell(
                                      //     onTap: () {
                                      //       setState(() {
                                      //         // e.addWishlistStatus = e.addWishlistStatus == "1" ? "0" : "1";
                                      //       });
                                      //       savedJob(e.jobId);
                                      //     },
                                      //     child: Image.asset(
                                      //       "images/bookmark.png",
                                      //       height: getHeight(40),
                                      //       width: getHeight(30),
                                      //       fit: BoxFit.fill,
                                      //       color: e.addWishlistStatus == "1" ? Colors.red : Colors.grey,
                                      //     )),
                                    ],
                                  ),
                                ),
                              ))
                          .toList(),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  bool isNetwork = false;
  bool saved = false;
  ApiBaseHelper apiBaseHelper = new ApiBaseHelper();

  savedJob(id) async {
    await App.init();
    isNetwork = await isNetworkAvailable();

    // e.g. "Moto G (4)"

    if (isNetwork) {
      try {
        Map data;
        data = {
          "user_id": curUserId,
          "item_id": id,
          "item_type": "1",
        };
        Map response = await apiBaseHelper.postAPICall(Uri.parse(baseUrl + "addItemInWishlist"), data);
        print(response);
        bool status = true;
        setState(() {
          saved = false;
        });
        if (response['status']) {
        } else {}
        String msg = response['msg'];
        setSnackbar(msg, context);
      } on TimeoutException catch (_) {
        setSnackbar("Something Went Wrong", context);
        setState(() {
          // loading = false;
        });
      }
    } else {
      setSnackbar("No Internet Connection", context);
      setState(() {
        // loading = false;
      });
    }
  }

  Future<void> searchApi(String keyword) async {
    // // remove input focus
    // FocusScope.of(context).unfocus();

    //delay prevent loader stuck
    await Future.delayed(Duration(milliseconds: 600));

    Map<String, dynamic> body = {"job_title": keyword};

    var formData = FormData.fromMap(body);

    JobSearchResponse response = await apiController.post<JobSearchResponse>("https://developmentalphawizz.com/Nerdmine/webService/searchJob", body: formData);

    if (response.status ?? false) {
      listOfJobs.addAll(response.jobList ?? []);
    } else {
      FlutterToastX.showErrorToastBottom(context, "Failed: ${response ?? ""}");
    }

    setState(() {});
  }
}
