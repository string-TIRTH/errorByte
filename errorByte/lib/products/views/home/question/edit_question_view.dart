import 'package:animate_do/animate_do.dart';
import 'package:async_button/async_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/base/base_singleton.dart';
import '../../../../core/extensions/ui_extensions.dart';
import '../../../models/user_model.dart';

import '../../../../uikit/button/special_async_button.dart';
import '../../../../uikit/decoration/special_container_decoration.dart';
import '../../../../features/components/textformfield/default_text_form_field.dart';
import '../../../viewmodels/question_view_model.dart';

class EditQuestionView extends StatelessWidget with BaseSingleton {
  final Question question;
  final _formKey = GlobalKey<FormState>();

  EditQuestionView({super.key, required this.question});

  Future<void> _editQuestion(AsyncButtonStateController btnStateController,
      BuildContext context) async {
    btnStateController.update(ButtonState.loading);
    _formKey.currentState!.save();
    if (_formKey.currentState!.validate()) {
      final pv = Provider.of<QuestionViewModel>(context, listen: false);
      int statusCode = await pv.updateQuestion(
        title: "${question.title}",
        subtitle: "${question.subtitle}",
        id: "${question.sId}",
      );
      statusCode == 200
          ? btnStateController.update(ButtonState.success)
          : btnStateController.update(ButtonState.failure);
    } else {
      btnStateController.update(ButtonState.failure);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _body(context),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: FadeInDown(
        child: Text("Edit Question"),
      ),
    );
  }

  FadeInUp _body(BuildContext context) {
    return FadeInUp(
      child: Form(
        key: _formKey,
        child: ListView(
          padding: context.padding2x,
          children: [
            context.emptySizedHeightBox2x,
            _description(context),
            context.emptySizedHeightBox3x,
            _titleSection(context),
            context.emptySizedHeightBox3x,
            _contentSection(context),
            context.emptySizedHeightBox3x,
            _editButton(context),
          ],
        ),
      ),
    );
  }

  Text _description(BuildContext context) {
    return Text(
      "Edit Question",
      style: context.textTheme.headline6,
    );
  }

  Container _titleSection(BuildContext context) {
    return Container(
      padding: context.padding2x,
      decoration: SpecialContainerDecoration(context: context),
      child: Column(
        crossAxisAlignment: context.crossAxisAStart,
        children: [
          context.emptySizedHeightBox2x,
          _titleTitle(context),
          _titleSubtitle(context),
          context.emptySizedHeightBox2x,
          _titleField(context),
          context.emptySizedHeightBox2x,
        ],
      ),
    );
  }

  Text _titleTitle(BuildContext context) {
    return Text(
      "Title",
      style: context.textTheme.subtitle1!.copyWith(
        fontWeight: context.fw700,
      ),
    );
  }

  Text _titleSubtitle(BuildContext context) {
    return Text(
      "Be specific and imagine you’re asking a question to another person.",
      style: context.textTheme.subtitle2,
    );
  }

  DefaultTextFormField _titleField(BuildContext context) {
    int minLines = 2;
    int maxLines = 2;
    return DefaultTextFormField(
      context: context,
      labelText: "Title",
      hintText: "How to center a div ? XP",
      validator: (title) => validators.titleCheck(title),
      minLines: minLines,
      maxLines: maxLines,
      initialValue: question.title,
      onChanged: (title) {
        question.title = title;
      },
    );
  }

  Container _contentSection(BuildContext context) {
    return Container(
      padding: context.padding2x,
      decoration: SpecialContainerDecoration(context: context),
      child: Column(
        crossAxisAlignment: context.crossAxisAStart,
        children: [
          context.emptySizedHeightBox2x,
          _contentTitle(context),
          _contentSubtitle(context),
          context.emptySizedHeightBox2x,
          _contentField(context),
          context.emptySizedHeightBox2x,
        ],
      ),
    );
  }

  Text _contentTitle(BuildContext context) {
    return Text(
      "Content",
      style: context.textTheme.subtitle1!.copyWith(
        fontWeight: context.fw700,
      ),
    );
  }

  Text _contentSubtitle(BuildContext context) {
    return Text(
      "Introduce the problem and expand on what you put in the title. Minimum 20 characters.",
      style: context.textTheme.subtitle2,
    );
  }

  DefaultTextFormField _contentField(BuildContext context) {
    int minLines = 1;
    int maxLines = 5;
    return DefaultTextFormField(
      context: context,
      labelText: "Content",
      validator: (content) => validators.contentCheck(content),
      minLines: minLines,
      maxLines: maxLines,
      initialValue: question.subtitle,
      onChanged: (subtitle) {
        question.subtitle = subtitle;
      },
    );
  }

  SpecialAsyncButton _editButton(BuildContext context) {
    return SpecialAsyncButton(
      borderRadius: context.borderRadius2x,
      onTap: (btnStateController) async =>
          await _editQuestion(btnStateController, context),
      buttonLabel: "Save edit your question",
    );
  }
}
