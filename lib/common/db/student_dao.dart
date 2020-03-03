import 'package:flutter_qyyim/common/db/solution1/db_base_bean.dart';
import 'package:flutter_qyyim/testdemo/bean/teacher.dart';

class StudentDao extends DbBaseBean {
  String id;
  String name;
  int score;

  // 增加 teacher 属性
  //Teacher teacher;

  StudentDao({this.id, this.name, this.score});

  // 将类对象转换成 JSON 字典，方便插入数据库
  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'name': this.name,
      'score': this.score,
      // 'teacher': this.teacher,
    };
  }

  //JSON 解析工厂类，使用字典数据为对象初始化赋值
  factory StudentDao.fromJson(Map<String, dynamic> parsedJson) {
    return StudentDao(
      id: parsedJson['id'],
      name: parsedJson['name'],
      score: parsedJson['score'],
      // 增加映射规则
      // teacher: Teacher.fromJson(parsedJson ['teacher'])
    );
  }

  @override
  StudentDao fromJson(Map<String, dynamic> parsedJson) {
    return StudentDao(
      id: parsedJson['id'],
      name: parsedJson['name'],
      score: parsedJson['score'],
      // 增加映射规则
      // teacher: Teacher.fromJson(parsedJson ['teacher'])
    );
  }

  @override
  String getTableName() {
    return "Student";
  }
//  factory Student.fromJson(Map<String, dynamic> map) {
//    return new Student(
//      id: map['id'] as String,
//      name: map['name'] as String,
//      score: map['score'] as int,
//      teacher: map['teacher'] as Teacher,
//    );
//  }
}
