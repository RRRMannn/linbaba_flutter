import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ThemeDemo(),
    );
  }
}

class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Theme(
      data: ThemeData(accentColor: Colors.blueGrey), //修改此界面的主题颜色
      child: Container(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RegisterFormState();
  }
}

class RegisterFormState extends State<RegisterForm> {
  final registerFormKey = GlobalKey<FormState>();
  String username, password;
  bool autoValidate=false;

  void submitRegisterForm() {
    //提交信息时候验证
    if (registerFormKey.currentState.validate()) {
      registerFormKey.currentState.save();

      debugPrint("username:$username");
      debugPrint("password:$password");

      Scaffold.of(context).showSnackBar(
        SnackBar(content: Text("Registering…")),
      );

    }else{
      autoValidate=true;
    }
  }

  String validatePassword(String value) {
    if (value.isEmpty) return "Username is required";

    return null;
  }

  String validateUsername(String value) {
    if (value.isEmpty) return "Password is required";

    return null;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
      key: registerFormKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
                icon: Icon(Icons.person),
                labelText: "Username",
                helperText: "",       //帮助信息
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
            onSaved: (value) {
              username = value;
            },
            validator: validateUsername,      //添加输入用户名判断
            autovalidate: autoValidate,       //提交后开启动态验证
          ),
          SizedBox(
            height: 16,
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
                icon: Icon(Icons.lock),
                labelText: "Password",
                helperText: "",       //帮助信息
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
            onSaved: (value) {
              password = value;
            },
            validator: validatePassword,      //添加输入密码判断
            autovalidate: autoValidate,       //提交后开启动态验证
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            width: double.infinity,
            child: RaisedButton(
              onPressed: submitRegisterForm,
              color: Theme.of(context).accentColor,
              child: Text(
                "Register",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TextFieldDemoStat();
  }
}

class TextFieldDemoStat extends State<TextFieldDemo> {
  final textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
  }

  @override
  void initState() {
    textEditingController.text = "标题";
    textEditingController.addListener(() {
      debugPrint("input:${textEditingController.text}");
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextField(
      controller: textEditingController,
//      onChanged: (value){
//        debugPrint("imput $value");
//      },
//      onSubmitted: (value){
//        debugPrint("imput $value");
//      },
      decoration: InputDecoration(
        icon: Icon(Icons.subject),
        labelText: 'Title',
        hintText: 'Enter the post title',
//        border: InputBorder.none,   //取消下划线
        border: OutlineInputBorder(
            //输入框边界线
            borderRadius: BorderRadius.circular(30)),
        filled: true, //输入框颜色填充
//        fillColor: Colors.blue    //输入框填充颜色选择
      ),
    );
  }
}
