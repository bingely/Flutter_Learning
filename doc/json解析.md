
1 知道有json字符串的，想变成dart
https://www.devio.org/io/tools/json-to-dart/
或
https://javiercbk.github.io/json_to_dart/

```
HomeRes.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    errorCode = json['errorCode'];
    errorMsg = json['errorMsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['errorCode'] = this.errorCode;
    data['errorMsg'] = this.errorMsg;
    return data;
  }
```

2 定义数据模型的结构
https://book.flutterchina.club/chapter11/json_model.html

dependencies:
  json_annotation: ^2.0.0


dev_dependencies:
  build_runner: ^1.0.0
  json_serializable: ^2.0.0

通过命令（flutter packages pub run build_runner build）生成 fromJson 和 tojson 方法




### 奇怪不是有 alt+insert 有快捷方式吗
只是有对象的话 teacher: Teacher.fromJson(map['teacher']) ,
    factory Student.fromJson(Map<String, dynamic> map) {
    return new Student(
      id: map['id'],
      name: map['name'],
      score: map['score'],
      teacher: Teacher.fromJson(map['teacher']) , //teacher: map['teacher'] as Teacher,
    );
  }

区别在于优点：工具生成的判断更合理些（fromJson 和 tojson ）
data = json['data'] != null ? new Data.fromJson(json['data']) : null;
缺点：需要修改地方就是生成的名字，和对应的type有时候不对
