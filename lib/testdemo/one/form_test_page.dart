import 'package:flutter/material.dart';

class FormTestPage extends StatefulWidget {
  @override
  _FormTestPageState createState() => new _FormTestPageState();
}

class _FormTestPageState extends State<FormTestPage> {
  TextEditingController _unameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();

  GlobalKey _formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('formtestpage'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Form(
          key: _formKey, //设置globalKey，用于后面获取FormState
          autovalidate: true, //开启自动校验

          child: Column(
            children: <Widget>[
              TextFormField(
                autofocus: true,
                controller: _unameController,
                decoration: InputDecoration(
                    labelText: "username",
                    hintText: "hint username",
                    icon: Icon(Icons.person)),
                validator: (v) {
                  return v.trim().length > 0 ? null : "usernme is not null";
                },
              ),
              TextFormField(
                  controller: _pwdController,
                  decoration: InputDecoration(
                      labelText: "密码",
                      hintText: "您的登录密码",
                      icon: Icon(Icons.lock)),
                  obscureText: true,
                  //校验密码
                  validator: (v) {
                    return v.trim().length > 5 ? null : "密码不能少于6位";
                  }),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                          padding: EdgeInsets.all(15.0),
                          child: Text("登录"),
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          onPressed: () {
                            //在这里不能通过此方式获取FormState，context不对
                            //print(Form.of(context));

                            // 通过_formKey.currentState 获取FormState后，
                            // 调用validate()方法校验用户名密码是否合法，校验
                            // 通过后再提交数据。
                            if ((_formKey.currentState as FormState)
                                .validate()) {
                              //验证通过提交数据
                            }

                            //由于本widget也是Form的子代widget，所以可以通过下面方式获取FormState
                            /*if(Form.of(context).validate()){
                              //验证通过提交数据
                            }*/
                          }),
                    ),
                  ],
                ),
              ),
              /*
              * 注意，登录按钮的onPressed方法中不能通过Form.of(context)来获取，原因是，此处的context为FormTestRoute的context，
              * 而Form.of(context)是根据所指定context向根去查找，而FormState是在FormTestRoute的子树中，所以不行。
              * 正确的做法是通过Builder来构建登录按钮，Builder会将widget节点的context作为回调参数：*/
              Expanded(
                child: Builder(builder: (context) {
                  return RaisedButton(
                      padding: EdgeInsets.all(15.0),
                      child: Text("登录2"),
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      onPressed: () {
                        //由于本widget也是Form的子代widget，所以可以通过下面方式获取FormState
                        if(Form.of(context).validate()){
                          //验证通过提交数据
                          Form.of(context).save();
                        }
                      });
                }),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
