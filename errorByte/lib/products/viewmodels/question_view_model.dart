// ignore_for_file: avoid_print, use_build_context_synchronously, curly_braces_in_flow_control_structures

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stack_overflow_clone/core/base/base_singleton.dart';
import 'package:stack_overflow_clone/products/models/question_model.dart';
import 'package:stack_overflow_clone/products/viewmodels/user_view_model.dart';

import '../../core/helpers/api.dart';

class QuestionViewModel extends ChangeNotifier with BaseSingleton {
  List<QuestionModel> _questions = [];
  List<QuestionModel> get questions => _questions;
  List<QuestionModel> _searchList = [];
  List<QuestionModel> get searchList => _searchList;
  QuestionModel _question = QuestionModel();
  QuestionModel get question => _question;
  final String baseUrl = "/questions";
  final _api = Api();

  Future<void> get getAllQuestions async {
    String url = "$baseUrl/allQuestions";
    final result = await _api.dioGet(url: url);

    if (result?.statusCode == HttpStatus.ok) {
      try {
        var datasBest = <QuestionModel>[];
        Iterable listBest = result?.data["questions"];
        datasBest =
            listBest.map((model) => QuestionModel.fromJson(model)).toList();
        _questions = datasBest;
      } catch (e) {
        print(e);
      }
    } else {
      _questions = [];
    }
    notifyListeners();
  }

  Future<void> getQuestionById({required String id}) async {
    String url = "$baseUrl/getQuestion/$id";
    final result = await _api.dioGet(url: url);
    if (result?.statusCode == HttpStatus.ok) {
      try {
        _question = QuestionModel.fromJson(result?.data["question"]);
      } catch (e) {
        print(e);
      }
    } else {
      _question = QuestionModel();
    }
    notifyListeners();
  }

  Future<void> addNewQuestion({
    required String title,
    required String content,
  }) async {
    final BuildContext context = _api.currentContext;

    String url = "$baseUrl/ask";
    final result = await _api.dioPost(
      url: url,
      obj: {
        "title": title,
        "subtitle": content,
      },
    );

    globals.getAlertDialog(
      context: _api.currentContext,
      result: result,
      successTitle: "SuccessFul!",
      fail400Title: "Error!",
      fail500Title: "Error!",
      onTap: () {
        Navigator.pop(context);
        Navigator.pop(context);
      },
    );
    final upv = Provider.of<UserViewModel>(context, listen: false);
    await Future.wait(
      [
        getAllQuestions,
        upv.getMyDetails,
      ],
    );
  }

  Future<int> updateQuestion({
    required String title,
    required String subtitle,
    required String id,
  }) async {
    final BuildContext context = _api.currentContext;
    String url = "$baseUrl/updateQuestion/$id";
    final result = await _api.dioPost(
      url: url,
      post: false,
      obj: {
        "title": title,
        "subtitle": subtitle,
      },
    );
    globals.getSnackBar(
      result: result,
      successContent: "Your information has been successfully updated!",
      error404Content: "Something Went Wrong!",
      error500Content: "Something Went Wrong!",
      context: context,
    );
    final upv = Provider.of<UserViewModel>(context, listen: false);

    await Future.wait(
      [
        upv.getMyDetails,
        getAllQuestions,
      ],
    );

    return result?.statusCode ?? 500;
  }

  Future<void> deleteQuestion({required String id}) async {
    final BuildContext context = _api.currentContext;
    String url = "$baseUrl/deleteQuestion/$id";
    final result = await _api.dioGet(
      url: url,
      get: false,
    );

    final upv = Provider.of<UserViewModel>(context, listen: false);

    await Future.wait(
      [
        upv.getMyDetails,
        getAllQuestions,
      ],
    ).then((value) {
      globals.getSnackBar(
        result: result,
        successContent: "Deleted Successfully",
        error404Content: "Error",
        error500Content: "Delete Failed",
        context: context,
      );
    });

  }

  Future<void> favUnFavQuestion({
    required String id,
    bool isFav = true,
  }) async {
    final BuildContext context = _api.currentContext;
    String url =
        isFav ? "$baseUrl/favQuestion/$id" : "$baseUrl/unFavQuestion/$id";
    final result = await _api.dioGet(url: url);

    globals.getSnackBar(
      result: result,
      successContent: isFav
          ? "The question was successfully liked!"
          : "The question was already liked!",
      error404Content: isFav
          ? "The question was successfully uncommented!"
          : "The question was already successfully uncommented!",
      error500Content: "Something Went Wrong!",
      context: context,
    );

    final upv = Provider.of<UserViewModel>(context, listen: false);
    await Future.wait(
      [
        getQuestionById(id: id),
        getAllQuestions,
        upv.getMyDetails,
      ],
    );
  }

  Color isFavQuestion(QuestionModel model, BuildContext context) {
    final upv = Provider.of<UserViewModel>(context, listen: false);
    if (model.fav != null) {
      for (var e in model.fav!) {
        if (upv.user.sId == e.sId)
          return Colors.redAccent;
        else
          return Colors.grey;
      }
    } else
      return Colors.grey;
    return Colors.grey;
  }

  Future<void> questionFavOperation({
    required QuestionModel model,
    required String id,
  }) async {
    final Color color = isFavQuestion(model, _api.currentContext);
    if (color == Colors.redAccent) {
      await favUnFavQuestion(
        id: id,
        isFav: false,
      );
    } else {
      await favUnFavQuestion(id: id);
    }
  }

  void searchQuestion(String query) {
    if (query.isNotEmpty) {
      final suggestions = questions.where((question) {
        final questionTitle = question.title?.toLowerCase();
        final input = query.toLowerCase();
        return questionTitle?.contains(input) ?? false;
      }).toList();
      _searchList = suggestions;
    }
    notifyListeners();
  }
}
