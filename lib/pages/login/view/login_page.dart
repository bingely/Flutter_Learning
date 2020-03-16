import 'package:flutter/material.dart';
import 'package:flutter_qyyim/common/provider/base.dart';
import 'package:flutter_qyyim/pages/login/view_module/login_provider.dart';

class GitLoginPage extends PageProvideNode<LoginProvider> {
  @override
  Widget buildContent(BuildContext context) {
    return LoginContentPage(mProvider);
  }
}

class LoginContentPage extends StatefulWidget {
  final LoginProvider provide;

  LoginContentPage(this.provide);

  @override
  _LoginContentPageState createState() => new _LoginContentPageState();
}

class _LoginContentPageState extends State<LoginContentPage> {
  LoginProvider mProvide;

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
        title: new Text(''),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('login'),
          onPressed: () {
            final s =
                mProvide.login().doOnListen(() {}).doOnDone(() {}).listen((_) {
              //success
            }, onError: (e) {
              //error
            });
            mProvide.addSubscription(s);
          },
        ),
      ),
    );
  }
}
