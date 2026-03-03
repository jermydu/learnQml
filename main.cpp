#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include "colormaker.h"

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    //注册c++类到qml中  这个注册动作一定要放到qml上下文创建之前
    qmlRegisterType<ColorMaker>("jermydu.ctrl",1,1,"ColorMaker");
    //注册C++对象到qml中 这样这个对象属性就可以直接在qml中使用了
    engine.rootContext()->setContextProperty("cppColorMaker", new ColorMaker);
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
