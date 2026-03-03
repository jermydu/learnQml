#include "colormaker.h"
#include <QTimerEvent>
#include <QDateTime>

ColorMaker::ColorMaker(QObject *parent)
    : QObject{parent}
    ,m_algorithm(RandomRGB)
    ,m_currentColor(Qt::black)
    ,m_colorTimer(0)
{
}

ColorMaker::~ColorMaker()
{

}

QColor ColorMaker::currentColor() const
{
    return m_currentColor;
}

void ColorMaker::setCurrentColor(const QColor color)
{
    m_currentColor = color;
    emit currentColorChanged(m_currentColor);
}

 QColor ColorMaker::timeColor() const
{
    QTime time = QTime::currentTime();
    int r = time.hour();
    int g = time.minute() * 2;
    int b = time.second() * 4;
    return QColor::fromRgb(r,g,b);
}

ColorMaker::GenerateAlgorithm ColorMaker::algorithm() const
{
    return m_algorithm;
}

void ColorMaker::setAlgorithm(const ColorMaker::GenerateAlgorithm algorithm)
{
    m_algorithm = algorithm;
}

void ColorMaker::start()
{
    if(m_colorTimer == 0)
    {
        m_colorTimer = startTimer(1000);
    }
}

void ColorMaker::stop()
{
    if(m_colorTimer > 0)
    {
        killTimer(m_colorTimer);
        m_colorTimer = 0;
    }
}

void ColorMaker::timerEvent(QTimerEvent *e)
{
    if(e->timerId() == m_colorTimer)
    {
        switch(m_algorithm)
        {
        case RandomRGB:
            m_currentColor.setRgb(generator.generate() % 255, generator.generate() % 255, generator.generate() % 255);
            break;
        case RandomRed:
            m_currentColor.setRed(generator.generate() % 255);
            break;
        case RandomGreen:
            m_currentColor.setGreen(generator.generate() % 255);
            break;
        case RandomBlue:
            m_currentColor.setBlue(generator.generate() % 255);
            break;
        case LinearIncrease:
        {
            int r = m_currentColor.red() + 10;
            int g = m_currentColor.green() + 10;
            int b = m_currentColor.blue() + 10;
            m_currentColor.setRgb(r % 255, g % 255, b % 255);
        }
        break;
        }
        emit currentColorChanged(m_currentColor);
        emit currentTime(QDateTime::currentDateTime().toString("yyyy-MM-dd hh:mm:ss"));
    }
    else
    {
        QObject::timerEvent(e);
    }
}
