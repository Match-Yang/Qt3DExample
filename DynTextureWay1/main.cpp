#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlEngine>
#include "paintedtextureimage.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    qmlRegisterType<PaintedTextureImage>("S3D", 1, 0, "PaintedTextureImage");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
