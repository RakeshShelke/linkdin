import 'dart:async';

import 'package:nerdmine/export.dart';
import 'package:nerdmine/generated/assets.dart';
import 'package:nerdmine/model/forget_password_response.dart';
import 'package:nerdmine/utils/Session.dart';
import 'package:nerdmine/utils/colors.dart';
import 'package:nerdmine/utils/common.dart';
import 'package:nerdmine/utils/constant.dart';
import 'package:nerdmine/utils/widget.dart';
import 'package:sizer/sizer.dart';

import '../utils/ApiBaseHelper.dart';
class ForgetScreen extends StatefulWidget {
  const ForgetScreen({Key? key}) : super(key: key);

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  bool obscure = true;

  TextEditingController newPasswordController = new TextEditingController();
  TextEditingController otpTextController = new TextEditingController();
  TextEditingController emailIdController = new TextEditingController();
  String? userType;
  ApiBaseHelper apiBase = new ApiBaseHelper();
  bool isNetwork = false;
  bool loading = false;

  num? otp;

  bool otpVerified = false;

  resetPass() async {
    await App.init();
    isNetwork = await isNetworkAvailable();

    // e.g. "Moto G (4)"

    setState(() {
      loading = true;
    });
    if (isNetwork) {
      try {
        Map data;
        data = {
          "user_id": curUserId,
          "password": newPasswordController.text,
        };
        Map response = await apiBase.postAPICall(Uri.parse(baseUrl + "updateForgetPassword"), data);
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

  sendOTP(String emailID) async {
    await App.init();
    isNetwork = await isNetworkAvailable();

    if (isNetwork) {
      try {
        Map data;
        data = {"email": emailID};
        Map response = await apiBase.postAPICall(Uri.parse(baseUrl + "forgotPassword"), data);
        ForgetPasswordResponse forgetPasswordResponse = ForgetPasswordResponse.fromJson(response);
        print(response);

        setState(() => loading = false);
        if (forgetPasswordResponse.status ?? false) {
          otp = forgetPasswordResponse.info?.otp;
          curUserId = forgetPasswordResponse.info?.userId;
          // Navigator.pop(context);
        } else {
          setSnackbar(forgetPasswordResponse.msg ?? "", context);
        }
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
        title: text("Forget password".toString(), textColor: MyColorName.primaryDark, fontFamily: fontMedium, fontSize: 14.sp),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: getWidth(47)),
          child: Column(
            children: [
              boxHeight(20),
              text("Enter Your Registered Mobile Number Associated With Your Account".toString(), textColor: MyColorName.primaryDark, fontFamily: fontMedium, fontSize: 10.sp),
              boxHeight(20),
              TextField(
                controller: emailIdController,
                // obscureText: obscure,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(48.sp),
                    borderSide: BorderSide(color: MyColorName.colorTextSecondary.withOpacity(0.2)),
                  ),
                  fillColor: MyColorName.colorBg1,
                  filled: true,
                  contentPadding: EdgeInsets.all(getWidth(30)),
                  counterText: '',
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        obscure = !obscure;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(getWidth(20)),
                      child: Image.asset(
                        Assets.imagesPassword,
                        height: getWidth(29),
                        width: getWidth(40),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  hintText: " Enter Email Id",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(48.sp),
                    borderSide: BorderSide(color: MyColorName.colorTextSecondary.withOpacity(0.2)),
                  ),
                ),
              ),
              boxHeight(47),
              if (otpVerified == false && otp != null)
                TextField(
                  keyboardType: TextInputType.text,
                  controller: otpTextController,
                  obscureText: obscure,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(48.sp),
                      borderSide: BorderSide(color: MyColorName.colorTextSecondary.withOpacity(0.2)),
                    ),
                    fillColor: MyColorName.colorBg1,
                    filled: true,
                    counterText: '',
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          obscure = !obscure;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(getWidth(20)),
                        child: Image.asset(
                          Assets.imagesPassword,
                          height: getWidth(29),
                          width: getWidth(29),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    contentPadding: EdgeInsets.all(getWidth(30)),
                    hintText: "Enter Your OTP",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(48.sp),
                      borderSide: BorderSide(color: MyColorName.colorTextSecondary.withOpacity(0.2)),
                    ),
                  ),
                ),
              if (otpVerified)
                TextField(
                  keyboardType: TextInputType.text,
                  controller: newPasswordController,
                  obscureText: obscure,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(48.sp),
                      borderSide: BorderSide(color: MyColorName.colorTextSecondary.withOpacity(0.2)),
                    ),
                    fillColor: MyColorName.colorBg1,
                    filled: true,
                    counterText: '',
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          obscure = !obscure;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(getWidth(20)),
                        child: Image.asset(
                          Assets.imagesPassword,
                          height: getWidth(29),
                          width: getWidth(29),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    contentPadding: EdgeInsets.all(getWidth(30)),
                    hintText: "Enter new password",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(48.sp),
                      borderSide: BorderSide(color: MyColorName.colorTextSecondary.withOpacity(0.2)),
                    ),
                  ),
                ),
              boxHeight(50),
              InkWell(
                onTap: () {
                  if (otp != null) {
                    if (otp.toString() == otpTextController.text.toString()) {
                      if (otpVerified == false) {
                        otpVerified = true;
                        setState(() {});
                        return;
                      }

                      if (newPasswordController.text.toString().isEmpty) {
                        FlutterToastX.showErrorToastCenter(context, "Please enter password");
                        return;
                      }

                      if (newPasswordController.text.toString().length < 6) {
                        FlutterToastX.showErrorToastCenter(context, "Please enter valid password");
                        return;
                      }

                      resetPass();
                    } else {
                      FlutterToastX.showErrorToastCenter(context, "Please enter correct otp");
                    }

                    return;
                  }

                  setState(() {
                    loading = true;
                  });
                  sendOTP(emailIdController.text.toString());
                },
                child: Container(
                  width: getWidth(625),
                  height: getHeight(90),
                  decoration: boxDecoration(
                    bgColor: MyColorName.primaryLite,
                    radius: 48.sp,
                  ),
                  child: Center(
                    child: !loading
                        ? text(
                            otp != null
                                ? otpVerified
                                    ? "Change Password"
                                    : "Verify"
                                : "Send OTP",
                            textColor: MyColorName.colorTextPrimary,
                            fontFamily: fontRegular,
                            isLongText: true,
                            fontSize: 12.sp)
                        : CircularProgressIndicator(color: MyColorName.colorTextPrimary),
                  ),
                ),
              ),
              boxHeight(93),
            ],
          ),
        ),
      ),
    );
  }
}
