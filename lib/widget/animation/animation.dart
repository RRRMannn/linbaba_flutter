import 'package:flutter/material.dart';

class AnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("AnimationDemo"),
        elevation: 0,
      ),
      body: AnimationDemoHome(),
    );
  }
}

class AnimationDemoHome extends StatefulWidget {
  @override
  _AnimationDemoHomeState createState() => _AnimationDemoHomeState();
}

class _AnimationDemoHomeState extends State<AnimationDemoHome>
    with TickerProviderStateMixin {
  AnimationController animationDemoController;

  Animation animationSize; //大小控制
  Animation animationColor; //颜色控制

  CurvedAnimation curve;

  @override
  void initState() {
    animationDemoController = AnimationController(
//      lowerBound: 10.0,
//      //最小值
//      upperBound: 100.0,
//      //最大值
//      value: 32.0,
      //当前值
      duration: Duration(milliseconds: 1000),
      //动画持续时间
      vsync: this,
    );

    curve = CurvedAnimation(
      //设置变化函数并绑定到AnimationController
      parent: animationDemoController,
      curve: Curves.bounceInOut,
    );

//    animation = Tween(                  //设置大小范围并绑定到AnimationController
//      begin: 32.0,
//      end: 100.0,
//    ).animate(animationDemoController);
//
//    animationColor=ColorTween(          //设置颜色范围并绑定到AnimationController
//      begin: Colors.red[100],
//      end: Colors.red[900],
//    ).animate(animationDemoController);

    animationSize = Tween(
      //设置大小范围并绑定到CurvedAnimation
      begin: 32.0,
      end: 100.0,
    ).animate(curve);

    animationColor = ColorTween(
      //设置颜色范围并绑定到CurvedAnimation
      begin: Color.fromRGBO(0, 0, 0, 1),
      end: Color.fromRGBO(255, 0, 255, 1),
    ).animate(curve);

    animationDemoController.addListener(() {
//      print("${animationDemoController.value}");
//      print("${animation.value}");
//      print("${animationColor.value}");
      setState(() {});
    });

//    animationDemoController.addStatusListener((AnimationStatus status) {
//      print(status);
//    });

//    animationDemoController.forward(); //开始动画
  }

  @override
  void dispose() {
    animationDemoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedHeart(
        animations: [
          animationSize,
          animationColor
        ],
        controller: animationDemoController,
      ),
    );
  }
}

class AnimatedHeart extends AnimatedWidget {                              //数值改变自动变化
  final List animations;
  final AnimationController controller;

  AnimatedHeart({this.animations, this.controller})
      : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return IconButton(
      icon: Icon(Icons.favorite),
      iconSize: animations[0].value,
//        iconSize: animationDemoController.value,
      color: animations[1].value,
      onPressed: () {
        switch (controller.status) {
          case AnimationStatus.completed:
            controller.reverse();
            break;
          default:
            controller.forward();
        }
      },
    );
  }
}
