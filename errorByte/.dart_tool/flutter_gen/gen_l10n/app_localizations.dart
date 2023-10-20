import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en')
  ];

  /// No description provided for @logoSvg.
  ///
  /// In en, this message translates to:
  /// **'assets/images/logo.svg'**
  String get logoSvg;

  /// No description provided for @iconSvg.
  ///
  /// In en, this message translates to:
  /// **'assets/images/icon.svg'**
  String get iconSvg;

  /// No description provided for @emailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailLabel;

  /// No description provided for @passwordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordLabel;

  /// No description provided for @passwordLabelV2.
  ///
  /// In en, this message translates to:
  /// **'Again password'**
  String get passwordLabelV2;

  /// No description provided for @loginButton.
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get loginButton;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get forgotPassword;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signUp;

  /// No description provided for @signUpDesc.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account'**
  String get signUpDesc;

  /// No description provided for @loginFail.
  ///
  /// In en, this message translates to:
  /// **'Login Failed'**
  String get loginFail;

  /// No description provided for @loginSuccess.
  ///
  /// In en, this message translates to:
  /// **'Login Success'**
  String get loginSuccess;

  /// No description provided for @okButton.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get okButton;

  /// No description provided for @registerAppbarTitle.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get registerAppbarTitle;

  /// No description provided for @registerTitle.
  ///
  /// In en, this message translates to:
  /// **'Join the Stack Overflow community'**
  String get registerTitle;

  /// No description provided for @nameLabel.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get nameLabel;

  /// No description provided for @lastnameLabel.
  ///
  /// In en, this message translates to:
  /// **'Lastname'**
  String get lastnameLabel;

  /// No description provided for @registerFail.
  ///
  /// In en, this message translates to:
  /// **'Register Failed'**
  String get registerFail;

  /// No description provided for @registerSuccess.
  ///
  /// In en, this message translates to:
  /// **'Register Success'**
  String get registerSuccess;

  /// No description provided for @questionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Questions'**
  String get questionsTitle;

  /// No description provided for @askQuestion.
  ///
  /// In en, this message translates to:
  /// **'Ask Question'**
  String get askQuestion;

  /// No description provided for @questionDetail.
  ///
  /// In en, this message translates to:
  /// **'Question Detail'**
  String get questionDetail;

  /// No description provided for @asked.
  ///
  /// In en, this message translates to:
  /// **'Asked'**
  String get asked;

  /// No description provided for @modified.
  ///
  /// In en, this message translates to:
  /// **'Modified'**
  String get modified;

  /// No description provided for @addAnswer.
  ///
  /// In en, this message translates to:
  /// **'Add Answer'**
  String get addAnswer;

  /// No description provided for @searchLabel.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get searchLabel;

  /// No description provided for @askAPublicQuestion.
  ///
  /// In en, this message translates to:
  /// **'Ask a public question'**
  String get askAPublicQuestion;

  /// No description provided for @titleLabel.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get titleLabel;

  /// No description provided for @titleDesc.
  ///
  /// In en, this message translates to:
  /// **'Be specific and imagine you’re asking a question to another person.'**
  String get titleDesc;

  /// No description provided for @titleHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Is there an R function for finding the index of an element in vector'**
  String get titleHint;

  /// No description provided for @contentLabel.
  ///
  /// In en, this message translates to:
  /// **'Content'**
  String get contentLabel;

  /// No description provided for @contentTitle.
  ///
  /// In en, this message translates to:
  /// **'What are the details of your problem?'**
  String get contentTitle;

  /// No description provided for @contentDesc.
  ///
  /// In en, this message translates to:
  /// **'Introduce the problem and expand on what you put in the title. Minimum 20 characters.'**
  String get contentDesc;

  /// No description provided for @reviewYourQuestion.
  ///
  /// In en, this message translates to:
  /// **'Review your question'**
  String get reviewYourQuestion;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Successful!'**
  String get success;

  /// No description provided for @fail.
  ///
  /// In en, this message translates to:
  /// **'Error!'**
  String get fail;

  /// No description provided for @yourAnswer.
  ///
  /// In en, this message translates to:
  /// **'Your Answer'**
  String get yourAnswer;

  /// No description provided for @addAnswerInfo.
  ///
  /// In en, this message translates to:
  /// **'Thanks for contributing an answer to Stack Overflow!\n\nPlease be sure to answer the question. Provide details and share your research!\n\nBut avoid …\n\nAsking for help, clarification, or responding to other answers.\nMaking statements based on opinion; back them up with references or personal experience.\n\nTo learn more, see our tips on writing great answers.'**
  String get addAnswerInfo;

  /// No description provided for @answerLabel.
  ///
  /// In en, this message translates to:
  /// **'Answer'**
  String get answerLabel;

  /// No description provided for @postYourAnswer.
  ///
  /// In en, this message translates to:
  /// **'Post your answer'**
  String get postYourAnswer;

  /// No description provided for @questionFavSuccess.
  ///
  /// In en, this message translates to:
  /// **'The question was successfully liked!'**
  String get questionFavSuccess;

  /// No description provided for @questionFavUnsuccess.
  ///
  /// In en, this message translates to:
  /// **'The question was already liked!'**
  String get questionFavUnsuccess;

  /// No description provided for @unsuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'There is a problem. Please try again later.'**
  String get unsuccessMessage;

  /// No description provided for @questionUnfavSuccess.
  ///
  /// In en, this message translates to:
  /// **'The question was successfully uncommented!'**
  String get questionUnfavSuccess;

  /// No description provided for @questionUnfavUnsuccess.
  ///
  /// In en, this message translates to:
  /// **'The question was already uncommented!'**
  String get questionUnfavUnsuccess;

  /// No description provided for @answerFavSuccess.
  ///
  /// In en, this message translates to:
  /// **'The answer was successfully liked!'**
  String get answerFavSuccess;

  /// No description provided for @answerFavUnsuccess.
  ///
  /// In en, this message translates to:
  /// **'The answer was already liked!'**
  String get answerFavUnsuccess;

  /// No description provided for @answerUnfavSuccess.
  ///
  /// In en, this message translates to:
  /// **'The answer was successfully uncommented!'**
  String get answerUnfavSuccess;

  /// No description provided for @answerUnfavUnsuccess.
  ///
  /// In en, this message translates to:
  /// **'The answer was already uncommented!'**
  String get answerUnfavUnsuccess;

  /// No description provided for @profileAppBarTitle.
  ///
  /// In en, this message translates to:
  /// **'My Profile'**
  String get profileAppBarTitle;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit profile'**
  String get editProfile;

  /// No description provided for @website.
  ///
  /// In en, this message translates to:
  /// **'Website'**
  String get website;

  /// No description provided for @answers.
  ///
  /// In en, this message translates to:
  /// **'Answers'**
  String get answers;

  /// No description provided for @noAnswered.
  ///
  /// In en, this message translates to:
  /// **'You have not answered any questions.'**
  String get noAnswered;

  /// No description provided for @noAsked.
  ///
  /// In en, this message translates to:
  /// **'You have not asked any questions.'**
  String get noAsked;

  /// No description provided for @seeAll.
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get seeAll;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @place.
  ///
  /// In en, this message translates to:
  /// **'Place'**
  String get place;

  /// No description provided for @saveProfile.
  ///
  /// In en, this message translates to:
  /// **'Save Profile'**
  String get saveProfile;

  /// No description provided for @successEdit.
  ///
  /// In en, this message translates to:
  /// **'Your information has been successfully updated!'**
  String get successEdit;

  /// No description provided for @unsuccessEdit.
  ///
  /// In en, this message translates to:
  /// **'Your information could not be successfully updated!'**
  String get unsuccessEdit;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get logout;

  /// No description provided for @emptyQuestion.
  ///
  /// In en, this message translates to:
  /// **'The questions has not asked yet!'**
  String get emptyQuestion;

  /// No description provided for @cancelButton.
  ///
  /// In en, this message translates to:
  /// **'CANCEL'**
  String get cancelButton;

  /// No description provided for @areYouSure.
  ///
  /// In en, this message translates to:
  /// **'Are you sure?'**
  String get areYouSure;

  /// No description provided for @logoutContent.
  ///
  /// In en, this message translates to:
  /// **'Your account will be logged out. \nAre you sure?'**
  String get logoutContent;

  /// No description provided for @myQuestions.
  ///
  /// In en, this message translates to:
  /// **'My Questions'**
  String get myQuestions;

  /// No description provided for @noAboutMeHasBeenYet.
  ///
  /// In en, this message translates to:
  /// **'No about me has been yet'**
  String get noAboutMeHasBeenYet;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @editQuestion.
  ///
  /// In en, this message translates to:
  /// **'Edit Question'**
  String get editQuestion;

  /// No description provided for @editYourQuestion.
  ///
  /// In en, this message translates to:
  /// **'Edit your question'**
  String get editYourQuestion;

  /// No description provided for @saveEdit.
  ///
  /// In en, this message translates to:
  /// **'Save edit your question'**
  String get saveEdit;

  /// No description provided for @deleteQuestionContent.
  ///
  /// In en, this message translates to:
  /// **'Your question and the answers given to the question will be deleted.\nAre you sure?'**
  String get deleteQuestionContent;

  /// No description provided for @deleteQuestionSuccess.
  ///
  /// In en, this message translates to:
  /// **'This answer was successfully deleted!'**
  String get deleteQuestionSuccess;

  /// No description provided for @myAnswers.
  ///
  /// In en, this message translates to:
  /// **'My Answers'**
  String get myAnswers;

  /// No description provided for @editAnswer.
  ///
  /// In en, this message translates to:
  /// **'Edit Answer'**
  String get editAnswer;

  /// No description provided for @editYourAnswer.
  ///
  /// In en, this message translates to:
  /// **'Edit your answer'**
  String get editYourAnswer;

  /// No description provided for @deleteAnswerContent.
  ///
  /// In en, this message translates to:
  /// **'Your answer will be deleted this question.\nAre you sure?'**
  String get deleteAnswerContent;

  /// No description provided for @forgotPasswordDesc.
  ///
  /// In en, this message translates to:
  /// **'Forgot your account’s password or having trouble logging into your Team? Enter your email address and we’ll send you a recovery link.'**
  String get forgotPasswordDesc;

  /// No description provided for @sendRecoveryMail.
  ///
  /// In en, this message translates to:
  /// **'Send Recovery Mail'**
  String get sendRecoveryMail;

  /// No description provided for @sendMailSuccess.
  ///
  /// In en, this message translates to:
  /// **'Password reset successful.'**
  String get sendMailSuccess;

  /// No description provided for @resendNewCode.
  ///
  /// In en, this message translates to:
  /// **'Resend New Code'**
  String get resendNewCode;

  /// No description provided for @verification.
  ///
  /// In en, this message translates to:
  /// **'Verification'**
  String get verification;

  /// No description provided for @otpDesc.
  ///
  /// In en, this message translates to:
  /// **'Enter your OTP code number.'**
  String get otpDesc;

  /// No description provided for @receiveCode.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t you receive any code?'**
  String get receiveCode;

  /// No description provided for @invalidResetPassToken.
  ///
  /// In en, this message translates to:
  /// **'Invalid OTP code.\nPlease check email and try again.'**
  String get invalidResetPassToken;

  /// No description provided for @validResetPassToken.
  ///
  /// In en, this message translates to:
  /// **'You have entered the correct code and you will be redirected to the password change page.'**
  String get validResetPassToken;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPassword;

  /// No description provided for @youCanChangePasswordThisPage.
  ///
  /// In en, this message translates to:
  /// **'You can change password this page.'**
  String get youCanChangePasswordThisPage;

  /// No description provided for @changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change password'**
  String get changePassword;

  /// No description provided for @resetPasswordSuccess.
  ///
  /// In en, this message translates to:
  /// **'Your password has been successfully changed.\nYou are taken to the login screen.'**
  String get resetPasswordSuccess;

  /// No description provided for @verifyYourToken.
  ///
  /// In en, this message translates to:
  /// **'Verify Your Token'**
  String get verifyYourToken;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
