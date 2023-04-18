# PanCyr

An iOS Cyrillic keyboard to cover the widest possible range of Cyrillic characters.

## Why?

I've run onto an issue while living in Serbia that inputing correctly names of the streets in _ćirilica_ 
(Cyrillic script) is difficult because there are additional letters. Installing a separate Serbian keyboard
I did not see like a very exciting option (juggling between Russian and English is enough), hence decided
to implement a custom keyboard extension that would cover a wider range of Cyrrillic characters to support 
not only Russian, but also Ukrainian, Bulgarian, Belorussian, Serbian, and any (eventually) other major
Cyrillic script.

## How?

Russian layout (ЙЦУКЕН) is taken as the base layout and I've added additional letters to the long-press option:

<screenshot here>

|Script| | | | | | | | | | | |
|:-----|:-|:-|:-|:-|:-|:-|:-|:-|:-|:-|:-|
|Main |Й|Ц|У|К|Е|Н|Г|Ш|Щ|З|Х|
|Extra|О|ЦЦ|У|К|Е|Нь|ГГГ| | |З|Х|
|Main |Ф|Ы|В|А|П|Р|О|Л|Д|Ж|Э|
|Extra| | | | | | |О|Ль|Дж|Ж|Э|
|Main |Я|Ч|С|М|И|Т|Ь|Б|Ю| | |
|Extra| |ЧЧЧ| | |I| |Ъ| | | | |

