#ifndef PAINTEDTEXTUREIMAGE_H
#define PAINTEDTEXTUREIMAGE_H

#include <QObject>
#include <Qt3DRender/QPaintedTextureImage>
#include <Qt3DCore/QNode>
#include <QPainter>

class PaintedTextureImage : public Qt3DRender::QPaintedTextureImage
{
    Q_OBJECT
    Q_PROPERTY(QString text READ text WRITE setText NOTIFY textChanged)
    QString m_text;

public:
    explicit PaintedTextureImage(Qt3DCore::QNode *parent = nullptr);
    ~PaintedTextureImage() override;

    QString text() const
    {
        return m_text;
    }

public slots:
    void setText(QString text)
    {
        if (m_text == text)
            return;

        m_text = text;
        emit textChanged(m_text);
        update(QRect(0, 0, width(), height()));
    }

signals:
    void textChanged(QString text);

protected:
    void paint(QPainter *painter) override;
};

#endif // PAINTEDTEXTUREIMAGE_H
