// providers/goal_provider.dart

import 'package:flutter/foundation.dart';
import 'package:todo_with_alarm/models/goal.dart';
import 'package:todo_with_alarm/models/todo.dart';
import 'package:todo_with_alarm/services/goal_service.dart';
import 'package:todo_with_alarm/services/todo_service.dart';

class GoalProvider with ChangeNotifier {
  List<Goal> _goals = [];

  List<Goal> get goals => _goals;

  GoalProvider() {
    _loadGoals();
  }

  Future<void> _loadGoals() async {
    _goals = await GoalService.loadGoals();
    notifyListeners();
  }

  Future<void> addGoal(Goal goal) async {
    _goals.add(goal);
    await GoalService.saveGoals(_goals);
    notifyListeners();
  }

  Future<void> updateGoal(Goal updatedGoal) async {
    int index = _goals.indexWhere((goal) => goal.id == updatedGoal.id);
    if (index != -1) {
      _goals[index] = updatedGoal;
      await GoalService.saveGoals(_goals);
      notifyListeners();
    }
  }

  Future<void> deleteGoal(String id) async {
    _goals.removeWhere((goal) => goal.id == id);
    await GoalService.saveGoals(_goals);
    notifyListeners();
  }
}