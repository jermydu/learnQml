#ifndef COLORMAKER_H
#define COLORMAKER_H

/* 定义一个C++类 供qml使用
 * 1. 信号和槽
 * 2. Q_INVOKABLE 宏修饰的函数
 * 3. Q_ENUMS修饰的枚举
 * 4. Q_PROPERTY修饰的属性
 */
#include <QObject>
#include <QColor>
#include <QRandomGenerator>

class ColorMaker : public QObject
{
    Q_OBJECT
    Q_ENUMS(GenerateAlgorithm)
    Q_PROPERTY(QColor currentColor READ currentColor WRITE setCurrentColor NOTIFY currentColorChanged)
    Q_PROPERTY(QColor timeColor READ timeColor)
public:
    explicit ColorMaker(QObject *parent = nullptr);
    ~ColorMaker();
    enum GenerateAlgorithm
    {
        RandomRGB,
        RandomRed,
        RandomGreen,
        RandomBlue,
        LinearIncrease
    };

    Q_INVOKABLE GenerateAlgorithm algorithm() const;
    Q_INVOKABLE void setAlgorithm(const GenerateAlgorithm algorithm);

    QColor currentColor() const;
    void setCurrentColor(const QColor color);

    QColor timeColor() const;
signals:
    void currentColorChanged(const QColor& color);
    void currentTime(const QString& strTime);

public slots:
    void start();
    void stop();

protected:
    void timerEvent(QTimerEvent *e);

private:
    GenerateAlgorithm m_algorithm;  //生成颜色算法
    QColor m_currentColor;          //当前颜色值
    int m_colorTimer;               //定时器id
    QRandomGenerator generator;     //随机数
};

#endif // COLORMAKER_H
