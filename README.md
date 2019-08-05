# QHPopViewMan

该工具是实现弹层控件在 底部 或者 四周 的弹出动画，类似分享或者直播间的用户面板等，效果如图

![](https://github.com/chenqihui/QHPopViewMan/blob/master/screenshots/QHPopViewManDemo.gif)

其实是针对 动画 的统一封装，这里主要使用 UIView 的 animation，但是由于封装，可以方便扩展其他动画，如修改为 Keyframe 等，具体可以参考 [iOS 核心动画高级技巧 | RyuukuSpace](http://chenqihui.github.io/2018/08/23/iOS-%E6%A0%B8%E5%BF%83%E5%8A%A8%E7%94%BB%E9%AB%98%E7%BA%A7%E6%8A%80%E5%B7%A7/)。

另外该工具也针对 UI 布局比较常用的三种，分别是：Frame、Autolayout & Masonry 进行适配 & 实现。

## create

分别使用各自的 ***create 函数*** 创建 QHPopViewMan

~~~
// Frame
QHFramePopViewMan.create(popView: popV, showFrame: sF, hideFrame: hF)
// Autolayout
QHAutoLayoutPopViewMan.create(popView: popV, layoutConstraint: popVBottomLC, showConstant: sC, hideConstant: hC)
// Masonry
QHMasonryPopViewMan.create(popView: popV, constraint: bottomConstraint, showOffset: 0, hideOffset: h)
~~~

## API

~~~
// 初始隐藏状态
func initHide()
// 展示
func popUp()
// 隐藏
func popDown()
~~~

## 其他

集成该工具有两个类 *QHPopViewMan.swift* 和 *QHPopViewMan+Masonry.swift*，其中 *QHPopViewMan+Masonry* 只能在项目中使用 Masonry 第三库才能加入，即没有的话可以忽略。
