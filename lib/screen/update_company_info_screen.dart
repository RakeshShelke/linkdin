import 'package:nerdmine/export.dart';
import 'package:nerdmine/model/add_coach_response.dart';
import 'package:nerdmine/model/update_bio_information.dart';
import 'package:nerdmine/utils/extension.dart';
import 'package:sizer/sizer.dart';

import '../generated/assets.dart';
import '../model/add_bio_response.dart';
import '../utils/colors.dart';
import '../utils/common.dart';
import '../utils/constant.dart';
import '../utils/widget.dart';

class CompanyUpdateScreen extends StatefulWidget {
  const CompanyUpdateScreen({Key? key}) : super(key: key);

  @override
  State<CompanyUpdateScreen> createState() => _CompanyUpdateScreenState();
}

class _CompanyUpdateScreenState extends State<CompanyUpdateScreen> {
  TextEditingController industryTypeController = TextEditingController();
  TextEditingController companyTypeController = TextEditingController();
  TextEditingController headTypeController = TextEditingController();

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
          title: text('Add Company Info', textColor: MyColorName.primaryDark, fontFamily: fontMedium, fontSize: 14.sp)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            boxHeight(44),
            TextField(
              controller: industryTypeController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(48.sp),
                  borderSide: BorderSide(color: MyColorName.colorTextSecondary.withOpacity(0.2)),
                ),
                fillColor: MyColorName.colorBg1,
                filled: true,
                counterText: '',
                contentPadding: EdgeInsets.all(getWidth(30)),
                hintText: "Industry Type",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(48.sp),
                  borderSide: BorderSide(color: MyColorName.colorTextSecondary.withOpacity(0.2)),
                ),
              ),
            ),
            boxHeight(33),

            TextField(
              controller: companyTypeController,
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
                hintText: "Company Size",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(48.sp),
                  borderSide: BorderSide(color: MyColorName.colorTextSecondary.withOpacity(0.2)),
                ),
              ),
            ),
            boxHeight(33),

            TextField(
              controller: headTypeController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(48.sp),
                  borderSide: BorderSide(color: MyColorName.colorTextSecondary.withOpacity(0.2)),
                ),
                fillColor: MyColorName.colorBg1,
                filled: true,
                counterText: '',
                contentPadding: EdgeInsets.all(getWidth(30)),
                hintText: "Head Office",
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
    if (industryTypeController.text.toString().isEmpty) {
      FlutterToastX.showErrorToastBottom(context, "Please enter expertise".capitalize());
      return;
    }

    Map<String, dynamic> body = {
      "user_id": App.localStorage.getString("user_id"),
      "industary_type": industryTypeController.text.toString(),
      "head_office": headTypeController.text.toString(),
      "company_size": companyTypeController.text.toString(),
    };

    print(body);
    var formData = FormData.fromMap(body);

    Dialogs.showLoader(context, "Updating company info ...");
    AddBioResponse response = await apiController.post<AddBioResponse>('https://developmentalphawizz.com/Nerdmine/webService/updateCompanyInfo', body: formData);
    await Dialogs.hideLoader(context);
    // Future.delayed(Duration(milliseconds: 600));
    if (response.status == "sucess") {
      print(response.toJson());
      Navigator.pop(context);
      FlutterToastX.showSuccessToastBottom(context, "Profile bio updated");
    } else {
      Common().toast(response.msg ?? "");
    }
  }
}
