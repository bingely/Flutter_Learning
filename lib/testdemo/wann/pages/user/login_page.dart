import 'package:flutter/material.dart';
import 'package:flutter_qyyim/common/provider/provider_widget.dart';
import 'package:flutter_qyyim/common/service/wanandroid_service.dart';
import 'package:flutter_qyyim/testdemo/wann/view_model/login_model.dart';
import 'package:flutter_qyyim/ui/toast.dart';
import 'package:flutter_qyyim/ui/view_state_widget.dart';
import 'package:provider/provider.dart';
import 'login_field_widget.dart';
import 'login_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
    // 拿到provider 引用
    return new Scaffold(
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
          ),
          SliverToBoxAdapter(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      //LoginLogo(),
                      LoginFormContainer(
                        child: ProviderWidget<LoginModel>(
                          model: LoginModel(Provider.of(context)),
                          onModelReady: (model) {
                          },
                          builder: (context, model, child) {
                            return Form(
                              child: child,
                            );
                          },

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              LoginTextField(),
                              LoginTextField(),

                              RaisedButton(
                                onPressed: (){
                                  var model = LoginModel(Provider.of(context));
                                  model.login("bingley", "bingleywan").then((islogin) {
                                    if (islogin) {
                                      Toast.show("成功登录", context);

                                    }
                                  });
                                },
                                child: Text('login'),
                              ),
                              ViewStateButton(onPressed: (){

                              },textData: "exit",)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
