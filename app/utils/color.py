# -*- coding: utf-8 -*-
__author__ = 'WeRn'

# Вывод управляющей последованиельности
esc = lambda code, string='': '\x1b{}{}'.format(code, string)

# Без цвета
none = lambda text, *args: '{}'.format(text)
# Базовые цвета
black = lambda text, close=True: '{}{}{}'.format(esc('[30m'), text, close is True and esc('[0m') or '')
red = lambda text, close=True: '{}{}{}'.format(esc('[31m'), text, close is True and esc('[0m') or '')
green = lambda text, close=True: '{}{}{}'.format(esc('[32m'), text, close is True and esc('[0m') or '')
brown = lambda text, close=True: '{}{}{}'.format(esc('[33m'), text, close is True and esc('[0m') or '')
blue = lambda text, close=True: '{}{}{}'.format(esc('[34m'), text, close is True and esc('[0m') or '')
purple = lambda text, close=True: '{}{}{}'.format(esc('[35m'), text, close is True and esc('[0m') or '')
cyan = lambda text, close=True: '{}{}{}'.format(esc('[36m'), text, close is True and esc('[0m') or '')
gray = lambda text, close=True: '{}{}{}'.format(esc('[37m'), text, close is True and esc('[0m') or '')
lightgray = gray
# Осветленные
darkgray = lambda text, close=True: '{}{}{}'.format(esc('[90m'), text, close is True and esc('[0m') or '')
lightred = lambda text, close=True: '{}{}{}'.format(esc('[91m'), text, close is True and esc('[0m') or '')
lightgreen = lambda text, close=True: '{}{}{}'.format(esc('[92m'), text, close is True and esc('[0m') or '')
yellow = lambda text, close=True: '{}{}{}'.format(esc('[93m'), text, close is True and esc('[0m') or '')
lightblue = lambda text, close=True: '{}{}{}'.format(esc('[94m'), text, close is True and esc('[0m') or '')
lightmagenta = lambda text, close=True: '{}{}{}'.format(esc('[95m'), text, close is True and esc('[0m') or '')
lightcyan = lambda text, close=True: '{}{}{}'.format(esc('[96m'), text, close is True and esc('[0m') or '')
white = lambda text, close=True: '{}{}{}'.format(esc('[97m'), text, close is True and esc('[0m') or '')


# Отладка
if __name__ == '__main__':
    '''
    Black       0;30     Dark Gray     1;30
    Blue        0;34     Light Blue    1;34
    Green       0;32     Light Green   1;32
    Cyan        0;36     Light Cyan    1;36
    Red         0;31     Light Red     1;31
    Purple      0;35     Light Purple  1;35
    Brown       0;33     Yellow        1;33
    Light Gray  0;37     White         1;37
    '''
    colors = (black, red, green,
    brown, blue, purple, cyan,
    lightgray, darkgray, lightred,
    lightgreen, yellow, lightblue,
    lightmagenta, lightcyan, white)

    for col in colors:
        print(col('Hello'))


    print('Hello', yellow('World'))