# flutter_pigeon_plugin

A new Flutter plugin.

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



### 创建 Demo project

在Android Studio中，创建 Demo project

### 创建 Plugin project

```bash
// The plugin project was generated without specifying the `--platforms` flag, no new platforms are added.
// To add platforms, run `flutter create -t plugin --platforms <platforms> .` under the same
// directory. You can also find detailed instructions on how to add platforms in the `pubspec.yaml`
flutter create --org com.zero --template plugin flutterPigeon

// 正确
flutter create --org com.zero --template plugin  --platforms android,ios flutterPigeon
```


> 注意 创建命令需要带 `--platforms android,ios`，才会创建 Android iOS目录


修改 Android 配置

为了在Android Studio 4.1.1中运行，需要修改 各个目录下的gradle和build配置

修改内容如下：
```
// android/gradle/wrapper/gradle-wrapper.properties
distributionUrl=https\://services.gradle.org/distributions/gradle-6.5-all.zip

// android/build.gradle
ext.kotlin_version = '1.3.72'
repositories {
        maven { url 'https://maven.aliyun.com/repository/google' }
        maven { url 'https://maven.aliyun.com/repository/jcenter' }
        maven { url 'https://maven.aliyun.com/repository/gradle-plugin' }
        google()
        jcenter()
 }
 dependencies {
        classpath 'com.android.tools.build:gradle:4.1.1'
        classpath "org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlin_version"
 }
 
 allprojects {
    repositories {
        maven { url 'https://maven.aliyun.com/repository/google' }
        maven { url 'https://maven.aliyun.com/repository/jcenter' }
        maven { url 'https://maven.aliyun.com/repository/gradle-plugin' }
        google()
        jcenter()
    }
}

// android/app/build.gradle
kotlinOptions {
        jvmTarget = '1.8'
}

```

至此，project 构建完成，可运行 demo和 flutterPlugin/example

### 接入Pigeon
#### 添加依赖
首先在`pubspec.yaml`中添加依赖
```yaml
// flutterPigeon\pubspec.yaml
dependencies:
  flutter:
    sdk: flutter
  pigeon: 0.1.17
```
然后按照官方的要求添加一个`pigeons`目录，这里我们放dart侧的入口文件，内容为接口、参数、返回值的定义，后面通过pigeon的命令，生产native端代码。

```bash

```

flutter pub run pigeon --input pigeons/message.dart

解决 `Android native`生成的代码`Pigeon`中的错误
```
// flutterPigeon/android/build.gradle
    compileOptions {
        sourceCompatibility JavaVersion.VERSION_1_8
        targetCompatibility JavaVersion.VERSION_1_8
    }

    kotlinOptions {
        jvmTarget = '1.8'
    }
```









