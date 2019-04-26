import 'package:flutter/material.dart';

import 'main15.dart';

void main() => runApp(new MyApp());

//Stateless widgets 是不可变的, 这意味着它们的属性不能改变 - 所有的值都是最终的.
//Stateful widgets 持有的状态可能在widget生命周期中发生变化. 实现一个 stateful widget 至少需要两个类:

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "输入框及表单",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("输入框及表单"),
        ),
        body: new Center(
//          child: new FormTestRoute(),
          child: new TestPage(),
        ),
      ),
    );
  }
}

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => new _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  FocusNode _focusNodeFirstName = new FocusNode();
  FocusNode _focusNodeLastName = new FocusNode();
  FocusNode _focusNodeDescription = new FocusNode();
  static final TextEditingController _firstNameController =
      new TextEditingController();
  static final TextEditingController _lastNameController =
      new TextEditingController();
  static final TextEditingController _pwdController =
      new TextEditingController();
  static final TextEditingController _descriptionController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text('My Test Page'),
//      ),
      body: new SafeArea(
        top: false,
        bottom: false,
        child: new Form(
          key: _formKey, //设置globalKey，用于后面获取FormState
          autovalidate: true, //开启自动校验
          child: new SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                /* -- Something large -- */
                Container(
                  width: double.infinity,
                  height: 150.0,
                  color: Colors.red,
                ),

                /* -- First Name -- */
                new EnsureVisibleWhenFocused(
                  focusNode: _focusNodeFirstName,
                  child: new TextFormField(
                    decoration: const InputDecoration(
                      border: const UnderlineInputBorder(),
                      filled: true,
                      icon: const Icon(Icons.person),
                      labelText: "用户名",
                      hintText: "用户名或邮箱",
                    ),
                    // 校验用户名
                    validator: (v) {
                      return v.trim().length > 0 ? null : "用户名不能为空";
                    },
                    onSaved: (String value) {
                      //TODO
                    },
                    controller: _firstNameController,
                    focusNode: _focusNodeFirstName,
                  ),
                ),
                const SizedBox(height: 24.0),

                /* -- Last Name -- */
                new EnsureVisibleWhenFocused(
                  focusNode: _focusNodeLastName,
                  child: new TextFormField(
                    decoration: const InputDecoration(
                      border: const UnderlineInputBorder(),
                      filled: true,
                      icon: const Icon(Icons.lock),
                      labelText: "密码",
                      hintText: "您的登录密码",
                    ),
                    obscureText: true,
                    //校验密码
                    validator: (v) {
                      return v.trim().length > 5 ? null : "密码不能少于6位";
                    },
                    onSaved: (String value) {
                      //TODO
                    },
//                    controller: _lastNameController,
                    controller: _pwdController,
                    focusNode: _focusNodeLastName,
                  ),
                ),
                const SizedBox(height: 24.0),

                /* -- Some other fields -- */
                new Container(
                  width: double.infinity,
                  height: 250.0,
                  color: Colors.blue,
                ),

                /* -- Description -- */
                new EnsureVisibleWhenFocused(
                  focusNode: _focusNodeDescription,
                  child: new TextFormField(
                    decoration: const InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: '请介绍一下自己',
                      labelText: '简介',
                    ),
                    onSaved: (String value) {
                      //TODO
                    },
                    maxLines: 5,
                    controller: _descriptionController,
                    focusNode: _focusNodeDescription,
                  ),
                ),
                const SizedBox(height: 24.0),

                /* -- Save Button -- */
                new Center(
                  child: new RaisedButton(
                    child: const Text('确定'),
                    onPressed: () {
                      //TODO
                      if ((_formKey.currentState as FormState).validate()) {
                        //验证通过提交数据
                      }
                    },
                  ),
                ),
                const SizedBox(height: 24.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//class FormTestRoute extends StatefulWidget {
//  @override
//  _FormTestRouteState createState() => new _FormTestRouteState();
//}
//
//class _FormTestRouteState extends State<FormTestRoute> {
//  TextEditingController _unameController = new TextEditingController();
//  TextEditingController _pwdController = new TextEditingController();
//  GlobalKey _formKey = new GlobalKey<FormState>();
//  FocusNode _focusNode = new FocusNode();
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
////      title: "Form Test",
//
//      body: Padding(
//        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
//        child: Form(
//          key: _formKey, //设置globalKey，用于后面获取FormState
//          autovalidate: true, //开启自动校验
//          child: Column(
//            children: <Widget>[
//              new EnsureVisibleWhenFocused(
//                focusNode: _focusNode,
//                child: new TextFormField(
//                  autofocus: true,
//                  controller: _unameController,
//                  decoration: InputDecoration(
//                      labelText: "用户名",
//                      hintText: "用户名或邮箱",
//                      icon: Icon(Icons.person)),
//                  // 校验用户名
//                  validator: (v) {
//                    return v.trim().length > 0 ? null : "用户名不能为空";
//                  },
//                  focusNode: _focusNode,
//                ),
//              ),
//              new EnsureVisibleWhenFocused(
//                focusNode: _focusNode,
//                child: new TextFormField(
//                  controller: _pwdController,
//                  decoration: InputDecoration(
//                      labelText: "密码",
//                      hintText: "您的登录密码",
//                      icon: Icon(Icons.lock)),
//                  obscureText: true,
//                  //校验密码
//                  validator: (v) {
//                    return v.trim().length > 5 ? null : "密码不能少于6位";
//                  },
//                  focusNode: _focusNode,
//                ),
//              ),
////              TextFormField(
////                autofocus: true,
////                controller: _unameController,
////                decoration: InputDecoration(
////                    labelText: "用户名",
////                    hintText: "用户名或邮箱",
////                    icon: Icon(Icons.person)),
////                // 校验用户名
////                validator: (v) {
////                  return v.trim().length > 0 ? null : "用户名不能为空";
////                },
////              ),
////              TextFormField(
////                controller: _pwdController,
////                decoration: InputDecoration(
////                    labelText: "密码",
////                    hintText: "您的登录密码",
////                    icon: Icon(Icons.lock)),
////                obscureText: true,
////                //校验密码
////                validator: (v) {
////                  return v.trim().length > 5 ? null : "密码不能少于6位";
////                },
////              ),
//              // 登录按钮
//              Padding(
//                padding: const EdgeInsets.only(top: 28.0),
//                child: Row(
//                  children: <Widget>[
//                    Expanded(
//                      child: RaisedButton(
//                        padding: EdgeInsets.all(15.0),
//                        child: Text("登录"),
//                        color: Theme.of(context).primaryColor,
//                        textColor: Colors.white,
//                        onPressed: () {
//                          //在这里不能通过此方式获取FormState，context不对
//                          //print(Form.of(context));
//
//                          // 通过_formKey.currentState 获取FormState后，
//                          // 调用validate()方法校验用户名密码是否合法，校验
//                          // 通过后再提交数据。
//                          if ((_formKey.currentState as FormState).validate()) {
//                            //验证通过提交数据
//                          }
//                        },
//                      ),
//                    ),
//                  ],
//                ),
//              )
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
