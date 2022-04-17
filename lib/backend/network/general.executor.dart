import 'package:wrg3/backend/network/answer/answer.executor.dart';
import 'package:wrg3/backend/network/login.executor.dart';
import 'package:wrg3/backend/network/post/post.executor.dart';
import 'package:wrg3/backend/network/question/question.executor.dart';
import 'package:wrg3/backend/network/userInfo/userInfo.executor.dart';

class GeneralExecutor
    with
        PostExecutor,
        LoginExecutor,
        UserInfoExecutor,
        QuestionExecutor,
        AnswerExecutor {}

GeneralExecutor _generalExecutor = GeneralExecutor();
GeneralExecutor get GE => _generalExecutor;
