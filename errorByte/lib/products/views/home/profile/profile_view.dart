import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../../features/components/row/profile_items.dart';
import '../../../../core/base/base_singleton.dart';
import '../../../../core/extensions/ui_extensions.dart';
import '../../../../uikit/button/special_button.dart';
import '../../../../uikit/decoration/special_container_decoration.dart';
import '../../../models/user_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../core/enums/alert_enum.dart';
import '../../../../core/helpers/token.dart';
import '../../../viewmodels/user_view_model.dart';
import '../../auth/login_view.dart';
import '../answer/my_answers_view.dart';
import '../question/my_questions_view.dart';
import 'edit_profile_view.dart';

class ProfileView extends StatelessWidget with BaseSingleton {
  const ProfileView({super.key});

  void _goToProfileEdit(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfileView(),
      ),
    );
  }

  void _goToWebsite(UserModel user) {
    String baseUrl = "https://";
    String website = "";
    if (user.website!.contains(baseUrl)) {
      website = "${user.website}";
      launchUrlString(website);
    } else {
      website = "https://${user.website}";
      launchUrlString(website);
    }
  }

  void _logout(BuildContext context) {
    uiGlobals.showAlertDialog(
      context: context,
      alertEnum: AlertEnum.AREUSURE,
      contentTitle: "Are you sure?",
      contentSubtitle: "Logout",
      buttonLabel: "OK",
      onTap: () {
        Token.deleteAll();
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => LoginView(),
          ),
          (route) => false,
        );
      },
      secondButtonLabel: "CANCEL",
    );
  }

  void _goToMyAnswers(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyAnswersView(),
      ),
    );
  }

  void _goToMyQuestions(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyQuestionsView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _body,
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: FadeInDown(
        child: Row(
          mainAxisAlignment: context.mainAxisASpaceBetween,
          children: [_appBarTitle(context), _appBarAction(context)],
        ),
      ),
    );
  }

  Text _appBarTitle(BuildContext context) =>
      Text("Profile");

  SpecialButton _appBarAction(BuildContext context) {
    return SpecialButton(
      borderRadius: context.borderRadius2x,
      buttonLabel: "Edit Profile",
      onTap: () => _goToProfileEdit(context),
    );
  }

  FadeInUp get _body {
    return FadeInUp(
      child: Consumer<UserViewModel>(
        builder: (context, pv, _) {
          var user = pv.user;
          String memberDate = globals.formatDate(user.createdAt);
          String place = user.place ?? "null";
          String title =
              user.title ?? "No about me has been yet";
          int answerLength = user.answer?.length ?? 0;
          int questionLength = user.question?.length ?? 0;
          return ListView(
            padding: context.padding2x,
            children: [
              Row(
                children: [
                  _image(context),
                  context.emptySizedWidthBox3x,
                  _userInfoSection(context, user, memberDate, place)
                ],
              ),
              context.emptySizedHeightBox3x,
              _aboutAndLogoutSection(context, title),
              context.emptySizedHeightBox3x,
              _answerSection(context, answerLength),
              context.emptySizedHeightBox3x,
              _questionsSection(context, questionLength),
            ],
          );
        },
      ),
    );
  }

  Expanded _image(BuildContext context) {
    return Expanded(
      child: Container(
        height: context.dynamicHeight(0.1),
        padding: context.padding2x,
        decoration: SpecialContainerDecoration(context: context),
        child: Image.asset('assets/images/icon3.png'),
      ),
    );
  }

  Expanded _userInfoSection(
      BuildContext context, UserModel user, String memberDate, String place) {
    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: context.crossAxisAStart,
        children: [
          _usernameSection(user, context),
          context.emptySizedHeightBox1x,
          _memberDate(context, memberDate),
          context.emptySizedHeightBox1x,
          _placeAndWebsiteSection(place, context, user),
          context.emptySizedHeightBox1x,
        ],
      ),
    );
  }

  Text _usernameSection(UserModel user, BuildContext context) {
    String fullname = "${user.name} ${user.lastname}";
    return Text(
      fullname,
      style: context.textTheme.headline6,
    );
  }

  Row _memberDate(BuildContext context, String memberDate) {
    String date = "Member since $memberDate";
    return Row(
      children: [
        Icon(
          Icons.date_range,
          color: Colors.grey,
          size: 16,
        ),
        context.emptySizedWidthBox2x,
        Text(date)
      ],
    );
  }

  Row _placeAndWebsiteSection(
      String place, BuildContext context, UserModel user) {
    return Row(
      children: [
        place != "null"
            ? _placeField(context, place)
            : context.emptySizedHeightBox2x,
        user.website != null
            ? _websiteField(user, context)
            : context.emptySizedHeightBox1x,
      ],
    );
  }

  Row _placeField(BuildContext context, String place) {
    return Row(
      children: [
        Icon(
          Icons.place,
          color: Colors.grey,
          size: 16,
        ),
        context.emptySizedWidthBox2x,
        Text(place),
        context.emptySizedWidthBox2x,
      ],
    );
  }

  GestureDetector _websiteField(UserModel user, BuildContext context) {
    return GestureDetector(
      onTap: () => _goToWebsite(user),
      child: Row(
        children: [
          Icon(
            Icons.language,
            color: Colors.grey,
            size: 16,
          ),
          context.emptySizedWidthBox2x,
          Text("Website"),
        ],
      ),
    );
  }

  ProfileItems _aboutAndLogoutSection(BuildContext context, String title) {
    return ProfileItems(
      title: "About",
      action: "Log out",
      acitonOnTap: () => _logout(context),
      description: title,
    );
  }

  ProfileItems _answerSection(BuildContext context, int answerLength) {
    String description = answerLength != 0
        ? "You have answered $answerLength question."
        : "You have not answered any questions.";
    return ProfileItems(
      title: "Answers",
      action: "See All",
      acitonOnTap: () => _goToMyAnswers(context),
      description: description,
    );
  }

  ProfileItems _questionsSection(BuildContext context, int questionLength) {
    String description = questionLength != 0
        ? "You have asked $questionLength question."
        : "You have not asked any questions.";
    return ProfileItems(
      title: "Questions",
      action: "See All",
      acitonOnTap: () => _goToMyQuestions(context),
      description: description,
    );
  }
}
