# lift_note

请勿商用，谢谢～

## 规范 --- 自定义类组件皆L（项目名 或 作者头 或 公司头）开头
1. 类名命名：使用大驼峰命名法，首字母大写，单词之间用大写字母连接，如：`LoginPage` --> 类名
2. 函数命名：使用小驼峰命名法，首字母小写，单词之间用小写字母连接，如：`login` --> 函数名
3. 多文件用index.dart导出
4. (a)文件名：使用小驼峰命名法，首字母小写，单词之间用小写字母连接，如：`login_page.dart` --> 文件名
(b)文件名：使用大驼峰命名法，首字母大写，单词之间用大写字母连接，如：`LoginPage` --> 类名
(c)文件夹: 使用小驼峰命名法，首字母小写，单词之间用小写字母连接,如: `home_nbews_view` ，注意: viewModel 例外
5. import规范：(a)模块多文件下用index.dart export (b)import时优先package 后 相对路径
6. （1）json转模型统一使用json to dart --> https://javiercbk.github.io/json_to_dart/ 负荷低，不需关注插件
（2）【备用】插件json_serializable生成（本项目中home_model 为JsonToDartBeanAction生成，仅为操作对比存在）
    操作备注：v1.x.x
        (a)json转换代码：https://caijinglong.github.io/json2dart/index.html --> 到指定文件
        (b) flutter packages pub run build_runner clean
            flutter packages pub run build_runner build --delete-conflicting-outputs
            or 直接
            flutter packages pub run build_runner build
7.遵循原则： 
    （1）如果状态是用户数据，如复选框的选中状态、滑块的位置，则该状态最好由父 Widget 管理。
    （2）如果某一个状态是不同 Widget 共享的则最好由它们共同的父 Widget 管理
        例子：如detail页面的子组件数据由父组件管理，子组件各自管理自身model
