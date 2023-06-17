import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nerdmine/api/api_controller_expo.dart';
import 'package:nerdmine/generated/assets.dart';
import 'package:nerdmine/model/InstitutueResponse.dart';
import 'package:nerdmine/model/all_search_response.dart';
import 'package:nerdmine/model/feed_model.dart';
import 'package:nerdmine/model/search_response.dart';
import 'package:nerdmine/res/AppColors.dart';
import 'package:nerdmine/res/Fonts.dart';
import 'package:nerdmine/screen/job_detail.dart';
import 'package:nerdmine/screen/post_detail.dart';
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
import 'package:url_launcher/url_launcher.dart';

import 'home_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> with TickerProviderStateMixin {
  TextEditingController industryContr = TextEditingController();
  late TabController _tabController = TabController(length: 6, vsync: this);

  List<FeedModel> listOfFeedSearch = [];
  List<JobList> listOfJobs = [];
  List<ListX> listOfUsers = [];
  List<InstitutueResponse> listOfCourseInstitute = [];

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
          title: text("Search".toString(), textColor: MyColorName.primaryDark, fontFamily: fontMedium, fontSize: 14.sp),
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

              //  posts, people, companies, jobs
              TabBar(
                controller: _tabController,
                labelPadding: EdgeInsets.symmetric(horizontal: 5.0),
                unselectedLabelStyle: textStyle12px400w,
                unselectedLabelColor: AppColors.textColorSubText,
                labelStyle: textStyle12px400w,
                indicatorColor: MyColorName.primaryDark,
                labelColor: AppColors.textColor,
                isScrollable: true,
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                onTap: (int index) async {
                  listOfFeedSearch.clear();
                  listOfJobs.clear();
                  listOfUsers.clear();
                  // industryContr.clear();
                  setState(() {});

                  searchApi(industryContr.text.toString());
                  // String otpyId = listOfOpportunity[index].opportunityId ?? "";
                  // getReceiptList(otpyId);
                  // setState(() {});
                },
                tabs: [
                  Container(padding: EdgeInsets.symmetric(horizontal: 16.0),child: Tab(text: "Post")),
                  Container(padding: EdgeInsets.symmetric(horizontal: 16.0),child: Tab(text: "People")),
                  Container(padding: EdgeInsets.symmetric(horizontal: 16.0),child: Tab(text: "Jobs")),
                  Container(padding: EdgeInsets.symmetric(horizontal: 16.0),child: Tab(text: "Companies")),
                  Container(padding: EdgeInsets.symmetric(horizontal: 16.0),child: Tab(text: "Courses")),
                  Container(padding: EdgeInsets.symmetric(horizontal: 16.0),child: Tab(text: "Institutes")),

                ],
              ),
              Expanded(
                child: ListView(
                  children: [
                    // if (listOfUser.isNotEmpty) ...[
                    //   Text("People", style: textStyle14px500w),
                    //   verticalSpace(10.0),
                    // ],

                    ...listOfFeedSearch.map((model) {

                      return InkWell(
                        onTap: () async {

                          var result = await Navigator.push(context, MaterialPageRoute(builder: (context) => PostDetail(model, [])));
                          // if (result != null) {
                          //   setState(() {
                          //     feedList[selectedIndex] = result;
                          //   });
                          // }
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: getWidth(20), bottom: getWidth(20)),
                          padding: EdgeInsets.all(getWidth(20)),
                          decoration: boxDecoration(radius: 30, bgColor: Colors.white, showShadow: true),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                contentPadding: EdgeInsets.all(1),
                                leading: InkWell(
                                  onTap: () {
                                    String userId = App.localStorage.getString("user_id") ?? "";

                                    if (userId == model.userId) {
                                      navigateScreen(context, ProfileScreen());
                                    } else {
                                      navigateScreen(context, UserProfileScreen(model.userId ?? ""));
                                    }
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: commonImage(model.userProfileImage, 100.0, 100.0, "", context, ""),
                                  ),
                                ),
                                trailing: InkWell(
                                  onTap: () {
                                    // showPostBottomSheet(model.feedId ?? "", model.sharedLink ?? "");
                                  },
                                  child: Container(
                                    width: 40.0,
                                    height: 40.0,
                                    padding: EdgeInsets.all(10),
                                    child: Image.asset(
                                      "images/menu.png",
                                      width: getWidth(30),
                                      height: getHeight(30),
                                    ),
                                  ),
                                ),
                                title: Row(
                                  children: [
                                    Expanded(child: text(getString(model.userName ?? ""), textColor: MyColorName.primaryDark, fontFamily: fontMedium, fontSize: 10.sp)),
                                    boxWidth(10),
                                    text(getDuration(model.postDate ?? ""), textColor: Colors.black, fontFamily: fontMedium, fontSize: 7.sp),
                                  ],
                                ),
                                subtitle: text(getString(model?.userType??""), textColor: Color(0xff6D6D6D), fontFamily: fontMedium, fontSize: 10.sp),
                              ),
                              ReadMore(model: model),
                              if (model.addContentType == "4")
                                InkWell(
                                  onTap: () {
                                    launchUrl(Uri.parse("${model?.contentAttachedFilePath ?? ""}"), mode: LaunchMode.externalApplication);
                                  },
                                  child: Container(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Spacer(),
                                        Text('Attachment', style: textStyle14px500w),
                                        horizontalSpace(5.0),
                                        Icon(Icons.download_for_offline, color: Colors.black.withOpacity(0.6)),
                                      ],
                                    ),
                                  ),
                                ),
                              boxHeight(10),
                              if (model.feedCategoryId == "3" && (model.contentAttachedFile?.isNotEmpty ?? false) && model.addContentType != "4")
                                Container(height: 250.0, child: VideoApp(model.contentAttachedFilePath ?? "")),
                              boxHeight(10),
                              Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  model.contentAttachedFilePath != null && model.contentAttachedFilePath != ""
                                      ? commonHWImage2(model.contentAttachedFilePath, "", context, "")
                                      : SizedBox(),
                                  Container(
                                    height: getHeight(82),
                                    width: getWidth(720),
                                    padding: EdgeInsets.all(getWidth(30)),
                                    decoration: BoxDecoration(
                                        color: MyColorName.primaryDark.withOpacity(0.6),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(30),
                                          bottomRight: Radius.circular(30),
                                        )),
                                    child: Row(
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              // if (!(model.likedStatus != null && model.likedStatus == "1"))
                                              //   likeFeed(model.feedId, index);
                                              // else
                                              //   dislikeFeed(model.feedId, index);
                                            },
                                            child: Image.asset(
                                              "images/like.png",
                                              color: model.likedStatus != null && model.likedStatus == "1" ? Colors.red : Colors.white,
                                            )),
                                        boxWidth(10),
                                        text(model.totalLikes ?? "", textColor: MyColorName.colorBg1, fontFamily: fontMedium, fontSize: 10.sp),
                                        boxWidth(10),
                                        InkWell(onTap: () {}, child: Image.asset("images/comment.png")),
                                        boxWidth(10),
                                        text(model.totalComments ?? "", textColor: MyColorName.colorBg1, fontFamily: fontMedium, fontSize: 10.sp),
                                        boxWidth(10),
                                        /*     Image.asset("images/share.png"),
                                          boxWidth(10),*/
                                        // text(model.totalShared!, textColor: MyColorName.colorBg1, fontFamily: fontMedium, fontSize: 10.sp),
                                        // Spacer(),
                                        // InkWell(
                                        //     onTap: () async {
                                        //       await FlutterShare.share(title: 'Example share', text: 'Share', linkUrl: feedList[selectedIndex].sharedLink,
                                        //           chooserTitle: 'Share');
                                        //     },
                                        //     child: Image.asset("images/send.png")),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),

                    ...listOfUsers
                        .map((e) => InkWell(
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
                                leading: ClipRRect(borderRadius: BorderRadius.circular(100), child: commonImage(e.profileImage, 100.0, 100.0, "", context, "images/name.png")),
                                title: text(getString(e.name.toString()), textColor: MyColorName.primaryDark, fontFamily: fontMedium, fontSize: 10.sp),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    text(e.userType ?? "", textColor: Color(0xff6D6D6D), fontFamily: fontRegular, fontSize: 7.5.sp),
                                    /*     Row(
                            children: [
                              Image.asset("images/mutual.png",width: getWidth(30),height: getHeight(30),),
                              text(" 7 Mutual connections",textColor: Color(0xff6D6D6D),fontFamily: fontRegular,fontSize: 7.5.sp),
                            ],
                          ),*/
                                  ],
                                ),
                              ),
                            ))
                        .toList(),

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
                                      InkWell(
                                          onTap: () {
                                            setState(() {
                                              e.addWishlistStatus = e.addWishlistStatus == "1" ? "0" : "1";
                                            });
                                            savedJob(e.jobId);
                                          },
                                          child: Image.asset(
                                            "images/bookmark.png",
                                            height: getHeight(40),
                                            width: getHeight(30),
                                            fit: BoxFit.fill,
                                            color: e.addWishlistStatus == "1" ? Colors.red : Colors.grey,
                                          )),
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

    Map<String, dynamic> body = {"search_type": _tabController.index + 1, "search_keyword": keyword};

    print("body $body");
    var formData = FormData.fromMap(body);

    Response response = await apiController.postV2("https://developmentalphawizz.com/Nerdmine/webService/allSearch", body: formData);

    listOfFeedSearch.clear();
    listOfJobs.clear();
    listOfUsers.clear();

    AllSearchResponse allSearchResponse = AllSearchResponse.fromJson(response.data);

    if (_tabController.index == 0) {
      allSearchResponse.searchData?.forEach((element) => listOfFeedSearch.add(FeedModel.fromJson(element)));
    }

    if (_tabController.index == 1) {
      allSearchResponse.searchData?.forEach((element) => listOfUsers.add(ListX.fromJson(element)));
    }

    if (_tabController.index == 2) {
      allSearchResponse.searchData?.forEach((element) => listOfJobs.add(JobList.fromJson(element)));
    }

    if (_tabController.index == 3) {
      allSearchResponse.searchData?.forEach((element) => listOfUsers.add(ListX.fromJson(element)));
    }

    if (_tabController.index == 5) {
      allSearchResponse.searchData?.forEach((element) => listOfCourseInstitute.add(InstitutueResponse.fromJson(element)));
    }

    print("Search result job -> ${listOfJobs.length}");

    setState(() {});
  }
}
