// lib/widgets/todo_edit_bottom_sheet.dart

import 'package:flutter/material.dart';
import 'package:todo_with_alarm/models/todo.dart';

class ToDoEditBottomSheet extends StatelessWidget {
  final Todo todo;
  final VoidCallback onUpdate;
  final VoidCallback onDelete;
  final VoidCallback onPostpone;
  final Function(double) onStatusUpdate; // onStatusUpdate 속성 추가

  const ToDoEditBottomSheet({
    Key? key,
    required this.todo,
    required this.onUpdate,
    required this.onDelete,
    required this.onPostpone,
    required this.onStatusUpdate, // 생성자에 추가
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 중요도와 긴급도 추출
    int importance = todo.importance;
    int urgency = todo.urgency;

    // 중요도와 긴급도에 따른 색상 설정
    Color importanceColor = _getBorderColor(importance, urgency);

    // 목표 아이콘 설정
    IconData goalIcon = _getGoalIcon(todo.goalId);

    bool isDDay = todo.isDDayTodo();

    return Container(
      height: 320,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
      ),
      child: Stack(
        children: [
          // 상단 바
          Positioned(
            left: MediaQuery.of(context).size.width / 2 - 63,
            top: 22,
            child: Container(
              width: 126,
              height: 8,
              decoration: ShapeDecoration(
                color: Color(0xFFDAEBCB),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1000),
                ),
              ),
            ),
          ),
          // 투두 정보
          Positioned(
            left: MediaQuery.of(context).size.width / 2 - 100,
            top: 59,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 목표 아이콘 및 중요도 색상 표시
                Container(
                  width: 24,
                  height: 24,
                  decoration: ShapeDecoration(
                    color: importanceColor.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Icon(
                    goalIcon,
                    size: 16,
                    color: importanceColor,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  todo.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF111111),
                    fontSize: 18,
                    fontFamily: 'Pretendard Variable',
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.27,
                    decoration:
                        todo.status >= 100 ? TextDecoration.lineThrough : null,
                  ),
                ),
              ],
            ),
          ),
          // 수정하기 버튼
          Positioned(
            left: MediaQuery.of(context).size.width / 2 - 106,
            top: 112,
            child: GestureDetector(
              onTap: () {
                onUpdate();
              },
              child: Container(
                width: 212,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                decoration: ShapeDecoration(
                  color: Color(0xFF78B545),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.edit,
                      size: 24,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8),
                    Text(
                      '수정하기',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Pretendard Variable',
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.24,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // 삭제하기 버튼
          Positioned(
            left: MediaQuery.of(context).size.width / 2 - 106,
            top: 176,
            child: GestureDetector(
              onTap: onDelete,
              child: Container(
                width: 212,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFF78B545)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.delete, size: 24, color: Color(0xFF78B545)),
                    SizedBox(width: 8),
                    Text(
                      '삭제하기',
                      style: TextStyle(
                        color: Color(0xFF78B545),
                        fontSize: 16,
                        fontFamily: 'Pretendard Variable',
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.24,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // 내일로 미루기 버튼 (디데이 투두가 아닌 경우에만 표시)
          if (!isDDay)
            Positioned(
              left: MediaQuery.of(context).size.width / 2 - 106,
              top: 240,
              child: GestureDetector(
                onTap: onPostpone,
                child: Container(
                  width: 212,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFF78B545)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_forward,
                          size: 24, color: Color(0xFF78B545)),
                      SizedBox(width: 8),
                      Text(
                        '내일하기',
                        style: TextStyle(
                          color: Color(0xFF78B545),
                          fontSize: 16,
                          fontFamily: 'Pretendard Variable',
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          // 진행률 수정 버튼 (디데이 투두인 경우)
          if (isDDay)
            Positioned(
              left: MediaQuery.of(context).size.width / 2 - 106,
              top: 240,
              child: GestureDetector(
                onTap: () {
                  _showProgressUpdateDialog(context);
                },
                child: Container(
                  width: 212,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  decoration: ShapeDecoration(
                    color: Color(0xFF78B545),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.edit, size: 24, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        '진행률 수정',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Pretendard Variable',
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  // 진행률 업데이트 다이얼로그 메서드
  void _showProgressUpdateDialog(BuildContext context) {
    double newStatus = todo.status;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              title: Text('진행률 수정'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('진행률: ${newStatus.toInt()}%'),
                  Slider(
                    value: newStatus,
                    min: 0,
                    max: 100,
                    divisions: 100,
                    label: '${newStatus.toInt()}%',
                    onChanged: (double value) {
                      setStateDialog(() {
                        newStatus = value;
                      });
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('취소'),
                ),
                TextButton(
                  onPressed: () async {
                    // 진행률 업데이트
                    await _updateTodoStatus(context, newStatus);
                    Navigator.pop(context);
                  },
                  child: Text('저장'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future<void> _updateTodoStatus(BuildContext context, double newStatus) async {
    try {
      // 진행률 업데이트 콜백 호출
      onStatusUpdate(newStatus);
    } catch (e) {
      // 에러 처리 로직 추가 (예: 로그 기록, 사용자 알림 등)
      print('Error updating todo status: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('진행률 업데이트에 실패했습니다.')),
      );
    }
  }

  // 테두리 색상 반환 메서드
  Color _getBorderColor(int importance, int urgency) {
    if (importance == 1 && urgency == 1) {
      return Colors.red; // 중요도 1, 긴급도 1
    } else if (importance == 1 && urgency == 0) {
      return Colors.blue; // 중요도 1, 긴급도 0
    } else if (importance == 0 && urgency == 1) {
      return Colors.yellow; // 중요도 0, 긴급도 1
    } else {
      return Colors.black; // 중요도 0, 긴급도 0
    }
  }

  // 목표 아이콘 반환 메서드
  IconData _getGoalIcon(String? goalId) {
    switch (goalId) {
      case 'goal1':
        return Icons.school;
      case 'goal2':
        return Icons.work;
      case 'goal3':
        return Icons.fitness_center;
      default:
        return Icons.flag;
    }
  }
}