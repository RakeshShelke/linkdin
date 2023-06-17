import 'package:nerdmine/export.dart';
import 'package:nerdmine/model/add_coach_response.dart';
import 'package:nerdmine/utils/extension.dart';
import 'package:sizer/sizer.dart';

import '../generated/assets.dart';
import '../utils/colors.dart';
import '../utils/common.dart';
import '../utils/constant.dart';
import '../utils/widget.dart';

class ExpertiseScreen extends StatefulWidget {
  const ExpertiseScreen({Key? key}) : super(key: key);

  @override
  State<ExpertiseScreen> createState() => _ExpertiseScreenState();
}

class _ExpertiseScreenState extends State<ExpertiseScreen> {
  TextEditingController expertiseController = TextEditingController();

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
          title: text('Add Expertise', textColor: MyColorName.primaryDark, fontFamily: fontMedium, fontSize: 14.sp)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            boxHeight(44),
            TextField(
              controller: expertiseController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(48.sp),
                  borderSide: BorderSide(color: MyColorName.colorTextSecondary.withOpacity(0.2)),
                ),
                fillColor: MyColorName.colorBg1,
                filled: true,
                counterText: '',
                contentPadding: EdgeInsets.all(getWidth(30)),
                hintText: "Add Expertise",
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
    if (expertiseController.text.toString().isEmpty) {
      FlutterToastX.showErrorToastBottom(context, "Please enter expertise".capitalize());
      return;
    }

    Map<String, dynamic> body = {
      "user_id": App.localStorage.getString("user_id"),
      "experties_title": expertiseController.text.toString(),
    };

    print(body);
    var formData = FormData.fromMap(body);

    Dialogs.showLoader(context, "Adding expertise ...");
    AddCoachResponse response = await apiController.post<AddCoachResponse>('https://developmentalphawizz.com/Nerdmine/webService/addExperties', body: formData);
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
