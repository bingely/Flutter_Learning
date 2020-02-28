class Teacher {
    //Teacher 的名字与年龄
    String name;
    int age;
    // 构造方法
    Teacher({this.name,this.age});
    //JSON 解析工厂类，使用字典数据为对象初始化赋值
    factory Teacher.fromJson(Map<String, dynamic> parsedJson){
        return Teacher(
            name : parsedJson['name'],
            age : parsedJson ['age']
        );
    }
}