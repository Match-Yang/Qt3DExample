#include "paintedtextureimage.h"
#include <QDebug>


PaintedTextureImage::PaintedTextureImage(Qt3DCore::QNode *parent) : Qt3DRender::QPaintedTextureImage(parent)
{
    setSize(QSize(1024, 1024));
}

PaintedTextureImage::~PaintedTextureImage()
{

}

void PaintedTextureImage::paint(QPainter *painter)
{
    painter->fillRect(0, 0, width(), height(), Qt::gray);
    QPen p(Qt::white, 10);
    painter->setPen(p);
    painter->drawRect(width() / 2, height() / 2, width() / 2, height() / 2);
    QFont f;
    f.setPixelSize(100);
    painter->setFont(f);
    painter->drawText(QRect(0, 0, width(), height()), m_text);
}
