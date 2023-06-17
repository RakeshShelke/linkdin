import 'package:nerdmine/export.dart';
import 'package:nerdmine/model/add_coach_response.dart';
import 'package:nerdmine/utils/extension.dart';
import 'package:sizer/sizer.dart';

import '../generated/assets.dart';
import '../utils/colors.dart';
import '../utils/common.dart';
import '../utils/constant.dart';
import '../utils/widget.dart';

class AddCoachScreen extends StatefulWidget {
  const AddCoachScreen({Key? key}) : super(key: key);

  @override
  State<AddCoachScreen> createState() => _AddCoachScreenState();
}

class _AddCoachScreenState extends State<AddCoachScreen> {
  TextEditingController coursesNameController = TextEditingController();
  TextEditingController professionController = TextEditingController();
  TextEditingController elegibilityController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController entranceExamController = TextEditingController();
  TextEditingController feeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  bool checkValue = false;
  String? startDate;
  String? endDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
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
          backgroundColor: Colors.white,
          title: text('Add Course', textColor: MyColorName.primaryDark, fontFamily: fontMedium, fontSize: 14.sp)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            boxHeight(44),
            TextField(
              controller: coursesNameController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(48.sp),
                  borderSide: BorderSide(color: MyColorName.colorTextSecondary.withOpacity(0.2)),
                ),
                fillColor: MyColorName.colorBg1,
                filled: true,
                counterText: '',
                contentPadding: EdgeInsets.all(getWidth(30)),
                hintText: "Course Name",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(48.sp),
                  borderSide: BorderSide(color: MyColorName.colorTextSecondary.withOpacity(0.2)),
                ),
              ),
            ),
            boxHeight(54),
            TextField(
              controller: professionController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(48.sp),
                  borderSide: BorderSide(color: MyColorName.colorTextSecondary.withOpacity(0.2)),
                ),
                fillColor: MyColorName.colorBg1,
                filled: true,
                counterText: '',
                contentPadding: EdgeInsets.all(getWidth(30)),
                hintText: "Profession",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(48.sp),
                  borderSide: BorderSide(color: MyColorName.colorTextSecondary.withOpacity(0.2)),
                ),
              ),
            ),
            boxHeight(54),
            TextField(
              controller: elegibilityController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(48.sp),
                  borderSide: BorderSide(color: MyColorName.colorTextSecondary.withOpacity(0.2)),
                ),
                fillColor: MyColorName.colorBg1,
                filled: true,
                counterText: '',
                contentPadding: EdgeInsets.all(getWidth(30)),
                hintText: "Eligibility",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(48.sp),
                  borderSide: BorderSide(color: MyColorName.colorTextSecondary.withOpacity(0.2)),
                ),
              ),
            ),
            boxHeight(34),

            TextField(
              controller: durationController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(48.sp),
                  borderSide: BorderSide(color: MyColorName.colorTextSecondary.withOpacity(0.2)),
                ),
                fillColor: MyColorName.colorBg1,
                filled: true,
                counterText: '',
                contentPadding: EdgeInsets.all(getWidth(30)),
                hintText: "Duration",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(48.sp),
                  borderSide: BorderSide(color: MyColorName.colorTextSecondary.withOpacity(0.2)),
                ),
              ),
            ),
            boxHeight(33),
            TextField(
              controller: feeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(48.sp),
                  borderSide: BorderSide(color: MyColorName.colorTextSecondary.withOpacity(0.2)),
                ),
                fillColor: MyColorName.colorBg1,
                filled: true,
                counterText: '',
                contentPadding: EdgeInsets.all(getWidth(30)),
                hintText: "Fees",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(48.sp),
                  borderSide: BorderSide(color: MyColorName.colorTextSecondary.withOpacity(0.2)),
                ),
              ),
            ),
            boxHeight(33),
            TextField(
              controller: entranceExamController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(48.sp),
                  borderSide: BorderSide(color: MyColorName.colorTextSecondary.withOpacity(0.2)),
                ),
                fillColor: MyColorName.colorBg1,
                filled: true,
                counterText: '',
                contentPadding: EdgeInsets.all(getWidth(30)),
                hintText: "Entrance Exam",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(48.sp),
                  borderSide: BorderSide(color: MyColorName.colorTextSecondary.withOpacity(0.2)),
                ),
              ),
            ),
            boxHeight(33),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(48.sp),
                  borderSide: BorderSide(color: MyColorName.colorTextSecondary.withOpacity(0.2)),
                ),
                fillColor: MyColorName.colorBg1,
                filled: true,
                counterText: '',
                contentPadding: EdgeInsets.all(getWidth(30)),
                hintText: "Description",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(48.sp),
                  borderSide: BorderSide(color: MyColorName.colorTextSecondary.withOpacity(0.2)),
                ),
              ),
            ),
            boxHeight(33),
            Container(
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow.shade800, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999))),
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    callExperienceApi();
                  },
                  child: Text(
                    "Save",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  )),
            ),
            boxHeight(54),
          ],
        ),
      ),
    );
  }

  callExperienceApi() async {
    if (coursesNameController.text.toString().isEmpty) {
      FlutterToastX.showErrorToastBottom(context, "Please enter job Title".capitalize());
      return;
    }

    if (professionController.text.toString().isEmpty) {
      FlutterToastX.showErrorToastBottom(context, "Please enter profession".capitalize());
      return;
    }

    if (elegibilityController.text.toString().isEmpty) {
      FlutterToastX.showErrorToastBottom(context, "Please enter eligibility".capitalize());
      return;
    }

    if (durationController.text.toString().isEmpty) {
      FlutterToastX.showErrorToastBottom(context, "Please enter duration".capitalize());
      return;
    }

    if (entranceExamController.text.toString().isEmpty) {
      FlutterToastX.showErrorToastBottom(context, "Please enter entrance exam".capitalize());
      return;
    }

    if (feeController.text.toString().isEmpty) {
      FlutterToastX.showErrorToastBottom(context, "Please enter fee".capitalize());
      return;
    }

    if (descriptionController.text.toString().isEmpty) {
      FlutterToastX.showErrorToastBottom(context, "Please enter description".capitalize());
      return;
    }

    Map<String, dynamic> body = {
      "user_id": App.localStorage.getString("user_id"),
      "courses_name": coursesNameController.text.toString(),
      "profession": professionController.text.toString(),
      "elegibility": elegibilityController.text.toString(),
      "duration": durationController.text.toString(),
      "fees": feeController.text.toString(),
      "entrance_exam": entranceExamController.text.toString(),
      "description": descriptionController.text.toString(),
    };

    var formData = FormData.fromMap(body);

    Dialogs.showLoader(context, "Adding coach ...");
    AddCoachResponse response = await apiController.post<AddCoachResponse>('https://developmentalphawizz.com/Nerdmine/webService/addCourse', body: formData);
    await Dialogs.hideLoader(context);
    // Future.delayed(Duration(milliseconds: 600));
    if (response.status == "sucess") {
      print(response.toJson());
      Navigator.pop(context);
      FlutterToastX.showSuccessToastBottom(context, "Coach Added to your profile");
    } else {
      Common().toast(response.msg ?? "");
    }
  }
}

class AddExperienceReponse {
  AddExperienceReponse({
    bool? status,
    String? msg,
  }) {
    _status = status;
    _msg = msg;
  }

  AddExperienceReponse.fromJson(dynamic json) {
    _status = json['status'];
    _msg = json['msg'];
  }

  bool? _status;
  String? _msg;

  AddExperienceReponse copyWith({
    bool? status,
    String? msg,
  }) =>
      AddExperienceReponse(
        status: status ?? _status,
        msg: msg ?? _msg,
      );

  bool? get status => _status;

  String? get msg => _msg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['msg'] = _msg;
    return map;
  }
}