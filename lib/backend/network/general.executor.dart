import 'package:wrg3/backend/network/post.executor.dart';

class GeneralExecutor with PostExecutor {}

GeneralExecutor _generalExecutor = GeneralExecutor();
GeneralExecutor get GE => _generalExecutor;
