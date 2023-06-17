import 'dart:async';

import 'package:nerdmine/export.dart';
import 'package:nerdmine/generated/assets.dart';
import 'package:nerdmine/model/get_courses_response.dart';
import 'package:nerdmine/model/job_and_applicants_response.dart';
import 'package:nerdmine/model/job_model.dart';
import 'package:nerdmine/screen/profile_screen.dart';
import 'package:nerdmine/screen/user_info_screen.dart';
import 'package:nerdmine/utils/Session.dart';
import 'package:nerdmine/utils/colors.dart';
import 'package:nerdmine/utils/common.dart';
import 'package:nerdmine/utils/constant.dart';
import 'package:nerdmine/utils/utility_helper.dart';
import 'package:nerdmine/utils/widget.dart';
import 'package:sizer/sizer.dart';

import '../utils/ApiBaseHelper.dart';

class CoursesDetailScreen extends StatefulWidget {
  CourseList? courseList;

  CoursesDetailScreen(this.courseList);

  @override
  State<CoursesDetailScreen> createState() => _CoursesDetailScreenState();
}

class _CoursesDetailScreenState extends State<CoursesDetailScreen> {
  bool obscure = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  ApiBaseHelper apiBaseHelper = new ApiBaseHelper();
  bool loading = true;

  Widget applicants(TotalApplicant e) {
    return InkWell(
      onTap: () {
        String userId = App.localStorage.getString("user_id") ?? "";
        if (userId == e.userId) {
          navigateScreen(context, ProfileScreen());
        } else {
          navigateScreen(context, UserProfileScreen(e.userId ?? ""));
        }
      },
      child: ListTile(
        contentPadding: EdgeInsets.all(10),
        leading: ClipRRect(borderRadius: BorderRadius.circular(100), child: commonImage("e.profileImage", 100.0, 100.0, "", context, "images/name.png")),
        title: text(getString("${e.name}"), textColor: MyColorName.colorTextPrimary, fontFamily: fontMedium, fontSize: 10.sp),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            text("${e.email}", textColor: Color(0xff6D6D6D), fontFamily: fontRegular, fontSize: 7.5.sp),
            text("${e.phoneNo}", textColor: Color(0xff6D6D6D), fontFamily: fontRegular, fontSize: 7.5.sp),
            /*     Row(
                            children: [
                              Image.asset("images/mutual.png",width: getWidth(30),height: getHeight(30),),
                              text(" 7 Mutual connections",textColor: Color(0xff6D6D6D),fontFamily: fontRegular,fontSize: 7.5.sp),
                            ],
                          ),*/
          ],
        ),
      ),
    );
  }

  int length = 0;
  JobDetailModel? jobDetailModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F4F8),
      appBar: AppBar(
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            back(context);
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
        title: text("Course Details".toString(), textColor: MyColorName.primaryDark, fontFamily: fontMedium, fontSize: 14.sp),
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                  width: getWidth(720),
                  decoration: boxDecoration(radius: 10, bgColor: MyColorName.colorBg1),
                  padding: EdgeInsets.all(getWidth(30)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          text("Courses Name: ", textColor: Color(0xff5e5e5e), fontFamily: fontRegular, fontSize: 10.sp),
                          Expanded(child: text(widget.courseList?.coursesName ??"", textColor: MyColorName.colorTextPrimary, fontFamily: fontRegular, fontSize: 10.sp))
                        ],
                      ),
                      verticalSpace(24.0),
                      text("Profession", textColor: MyColorName.primaryDark, fontFamily: fontMedium, fontSize: 10.sp),
                      boxHeight(10),
                      text(parseString(widget.courseList?.profession??""),
                          textColor: MyColorName.colorTextPrimary, fontFamily: fontMedium, fontSize: 10.sp, isLongText: true),
                      boxHeight(10),
                      text("Eligibility", textColor: MyColorName.primaryDark, fontFamily: fontMedium, fontSize: 10.sp),
                      text(parseString(widget.courseList?.elegibility??""),
                          textColor: MyColorName.colorTextPrimary, fontFamily: fontMedium, fontSize: 10.sp, isLongText: true),
                      boxHeight(10),
                      text("Duration", textColor: MyColorName.primaryDark, fontFamily: fontMedium, fontSize: 10.sp),
                      text(parseString(widget.courseList?.duration??""),
                          textColor: MyColorName.colorTextPrimary, fontFamily: fontMedium, fontSize: 10.sp, isLongText: true),
                      boxHeight(10),
                      text("Fees", textColor: MyColorName.primaryDark, fontFamily: fontMedium, fontSize: 10.sp),
                      text(parseString(widget.courseList?.fees??""),
                          textColor: MyColorName.colorTextPrimary, fontFamily: fontMedium, fontSize: 10.sp, isLongText: true),
                      boxHeight(10),
                      text("entrance exam", textColor: MyColorName.primaryDark, fontFamily: fontMedium, fontSize: 10.sp),
                      text(parseString(widget.courseList?.entranceExam??""),
                          textColor: MyColorName.colorTextPrimary, fontFamily: fontMedium, fontSize: 10.sp, isLongText: true),
                      boxHeight(10),
                      text("Description", textColor: MyColorName.primaryDark, fontFamily: fontMedium, fontSize: 10.sp),
                      text(parseString(widget.courseList?.description??""),
                          textColor: MyColorName.colorTextPrimary, fontFamily: fontMedium, fontSize: 10.sp, isLongText: true),
                      boxHeight(10),
                    ],
                  )),
              boxHeight(30),
            ],
          ),
        ),
      ),
    );
  }

  TextEditingController passCon = new TextEditingController();
  TextEditingController oldCon = new TextEditingController();
  TextEditingController passConFirmCon = new TextEditingController();
  String? userType;
  ApiBaseHelper apiBase = new ApiBaseHelper();
  bool isNetwork = false;

  likeFeed(id, index) async {
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
        Map response = await apiBase.postAPICall(Uri.parse(baseUrl + "addItemInWishlist"), data);
        print(response);
        bool status = true;
        setState(() {
          loading = false;
        });
        if (response['status']) {
        } else {}
        String msg = response['msg'];
        setSnackbar(msg, context);
      } on TimeoutException catch (_) {
        setSnackbar("Something Went Wrong", context);
        setState(() {
          loading = false;
        });
      }
    } else {
      setSnackbar("No Internet Connection", context);
      setState(() {
        loading = false;
      });
    }
  }

  applyNow(id, index) async {
    await App.init();
    isNetwork = await isNetworkAvailable();

    // e.g. "Moto G (4)"

    if (isNetwork) {
      try {
        Map data;
        data = {
          "user_id": curUserId,
          "job_id": id,
        };
        Map response = await apiBase.postAPICall(Uri.parse(baseUrl + "userApplyOnJobs"), data);
        print(response);
        bool status = true;
        setState(() {
          loading = false;
        });
        if (response['status']) {
        } else {}
        String msg = response['msg'];
        setSnackbar(msg, context);
        jobDetailModel?.applyJobStatus = "1";
        setState(() {});
      } on TimeoutException catch (_) {
        setSnackbar("Something Went Wrong", context);
        setState(() {
          loading = false;
        });
      }
    } else {
      setSnackbar("No Internet Connection", context);
      setState(() {
        loading = false;
      });
    }
  }

  resetPass() async {
    await App.init();
    isNetwork = await isNetworkAvailable();

    // e.g. "Moto G (4)"

    if (isNetwork) {
      try {
        Map data;
        data = {
          "user_id": curUserId,
          "old_password": oldCon.text,
          "new_password": passCon.text,
        };
        Map response = await apiBase.postAPICall(Uri.parse(baseUrl + "updatePassword"), data);
        print(response);
        bool status = true;
        setState(() {
          loading = false;
        });
        if (response['status']) {
          Navigator.pop(context);
        } else {}
        String msg = response['msg'];
        setSnackbar(msg, context);
      } on TimeoutException catch (_) {
        setSnackbar("Something Went Wrong", context);
        setState(() {
          loading = false;
        });
      }
    } else {
      setSnackbar("No Internet Connection", context);
      setState(() {
        loading = false;
      });
    }
  }
}
