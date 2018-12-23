#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <Qt3DQuick/QQmlAspectEngine>
#include <Qt3DQuickExtras/Qt3DQuickWindow>
#include <QtQml>

int main(int argc, char *argv[]) {
  QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

  QGuiApplication app(argc, argv);
  Qt3DExtras::Quick::Qt3DQuickWindow view;

  // Expose the window as a context property so we can set the aspect ratio
  view.engine()->qmlEngine()->rootContext()->setContextProperty("_window",
                                                                &view);
  view.setSource(QUrl("qrc:/main.qml"));
  view.show();

  return app.exec();
}
