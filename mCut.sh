#!/bin/bash
 E='echo -e';    # -e включить поддержку вывода Escape последовательностей
 e='echo -en';   # -n не выводить перевод строки
 p='+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+'
 trap "R;exit" 2 #
    ESC=$( $e "\e")
   TPUT(){ $e "\e[${1};${2}H" ;}
  CLEAR(){ $e "\ec";}
# 25 возможно это
  CIVIS(){ $e "\e[?25l";}
# это цвет текста списка перед курсором при значении 0 в переменной  UNMARK(){ $e "\e[0m";}
MARK(){ $e "\e[1;94m";}
# 0 это цвет списка
 UNMARK(){ $e "\e[0m";}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Эти строки задают цвет фона ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  R(){ CLEAR ;stty sane;CLEAR;};                 # в этом варианте фон прозрачный
# R(){ CLEAR ;stty sane;$e "\ec\e[37;44m\e[J";}; # в этом варианте закрашивается весь фон терминала
# R(){ CLEAR ;stty sane;$e "\ec\e[0;45m\e[";};   # в этом варианте закрашивается только фон меню
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 HEAD(){ for (( a=2; a<=33; a++ ))
  do
 TPUT $a 1
  $E "\e[94m\xE2\x94\x82                                                                                        \xE2\x94\x82\e[0m";
  done
 TPUT 2 4
  $E "\033[1;35m*** Cut ***\033[0m";
 TPUT 3 4
  $E "\033[90mудалить разделы из каждой строки файлов\033[0m";
 TPUT 4 1
  $E "\033[34m+----------------------------------------------------------------------------------------+\033[0m";
 TPUT 11 3
  $E "Опции                                                  \033[34mOption\033[0m";
 TPUT 23 3
  $E "\033[90mИспользуйте один и только один из -b, -c или -f.\033[0m";
 TPUT 24 3
  $E "\033[90mКаждый СПИСОК состоит из одного или нескольких диапазонов, разделенных запятыми.\033[0m";
 TPUT 25 3
  $E "\033[90mВыбранный ввод записывается в том же порядке что он читается и пишется ровно один раз.\033[0m";
 TPUT 26 3
  $E "\033[90mКаждый диапазон является одним из:\033[0m";
 TPUT 32 3
  $E "\033[90mUp \xE2\x86\x91 \xE2\x86\x93 Down Select Enter\033[0m";
 FOOT(){ MARK;TPUT 34 1
  $E "$p";UNMARK;}
 MARK;TPUT 1 1
  $E "$p" ;UNMARK;}
   i=0; CLEAR; CIVIS;NULL=/dev/null
# это управляет кнопками ввер/хвниз
 i=0; CLEAR; CIVIS;NULL=/dev/null
#
 ARROW(){ IFS= read -s -n1 key 2>/dev/null >&2
           if [[ $key = $ESC ]];then
              read -s -n1 key 2>/dev/null >&2;
              if [[ $key = \[ ]]; then
                 read -s -n1 key 2>/dev/null >&2;
                 if [[ $key = A ]]; then echo up;fi
                 if [[ $key = B ]];then echo dn;fi
              fi
           fi
           if [[ "$key" == "$($e \\x0A)" ]];then echo enter;fi;}
  M0(){ TPUT  5 3; $e "Kраткий обзор                                          \e[32mSynopsis                      \e[0m";}
  M1(){ TPUT  6 3; $e "Описание                                               \e[32mDescription                   \e[0m";}
  M2(){ TPUT  7 3; $e "Авторы                                                 \e[32mAuthors                       \e[0m";}
  M3(){ TPUT  8 3; $e "Сообщение об ошибках                                   \e[32mReporting Bugs                \e[0m";}
  M4(){ TPUT  9 3; $e "Авторские права                                        \e[32mCopyright                     \e[0m";}
  M5(){ TPUT 10 3; $e "Смотрите также                                         \e[32mSee Also                      \e[0m";}
#
  M6(){ TPUT 12 3; $e "Выберите только эти байты                              \e[32m-b --bytes=LIST               \e[0m";}
  M7(){ TPUT 13 3; $e "Вырезать подстроку из строки определённой длины        \e[32m-c --characters=LIST          \e[0m";}
  M8(){ TPUT 14 3; $e "Укажите разделитель, который вместо разделителя        \e[32m-d --delimiter=DELIM          \e[0m";}
  M9(){ TPUT 15 3; $e "Выберите только эти поля                               \e[32m-f --fields=LIST              \e[0m";}
 M10(){ TPUT 16 3; $e "Игнорируется                                           \e[32m-n                            \e[0m";}
 M11(){ TPUT 17 3; $e "Дополнить набор выбранных байтов, символов или полей   \e[32m   --complement               \e[0m";}
 M12(){ TPUT 18 3; $e "Не печатать строки, не содержащие разделителей         \e[32m-s --only-delimited           \e[0m";}
 M13(){ TPUT 19 3; $e "Используйте STRING в качестве выходного разделителя    \e[32m   --output-delimiter=STRING  \e[0m";}
 M14(){ TPUT 20 3; $e "Разделитель строк NUL, а не новая строка               \e[32m-z --zero-terminated          \e[0m";}
 M15(){ TPUT 21 3; $e "Показать эту справку и выйти                           \e[32m   --help                     \e[0m";}
 M16(){ TPUT 22 3; $e "Вывести информацию о версии и выйти                    \e[32m   --version                  \e[0m";}
#
 M17(){ TPUT 27 3; $e "N-й байт, символ или поле, считая от 1                 \e[32mN                             \e[0m";}
 M18(){ TPUT 28 3; $e "От N-го байта, символа или поля до конца строки        \e[32mN-                            \e[0m";}
 M19(){ TPUT 29 3; $e "От N-го до M-го (включительно) байта, символа или поля \e[32mN-M                           \e[0m";}
 M20(){ TPUT 30 3; $e "От 1-го до M-го (включительно) байта, символа или поля \e[32m-M                            \e[0m";}
 M21(){ TPUT 31 3; $e "\e[32mGrannik Git                                                                          \e[0m";}
#
 M22(){ TPUT 33 3; $e "Выход                                                  \e[32mExit                          \e[0m";}
LM=22
   MENU(){ for each in $(seq 0 $LM);do M${each};done;}
    POS(){ if [[ $cur == up ]];then ((i--));fi
           if [[ $cur == dn ]];then ((i++));fi
           if [[ $i -lt 0   ]];then i=$LM;fi
           if [[ $i -gt $LM ]];then i=0;fi;}
REFRESH(){ after=$((i+1)); before=$((i-1))
           if [[ $before -lt 0  ]];then before=$LM;fi
           if [[ $after -gt $LM ]];then after=0;fi
           if [[ $j -lt $i      ]];then UNMARK;M$before;else UNMARK;M$after;fi
           if [[ $after -eq 0 ]] || [ $before -eq $LM ];then
           UNMARK; M$before; M$after;fi;j=$i;UNMARK;M$before;M$after;}
   INIT(){ R;HEAD;FOOT;MENU;}
     SC(){ REFRESH;MARK;$S;$b;cur=`ARROW`;}
     ES(){ MARK;$e " ENTER = main menu ";$b;read;INIT;};INIT
  while [[ "$O" != " " ]]; do case $i in
  0) S=M0 ;SC;if [[ $cur == enter ]];then R;echo " cut OPTION... [FILE]...";ES;fi;;
  1) S=M1 ;SC;if [[ $cur == enter ]];then R;echo "   Вывести выбранные части строк из каждого ФАЙЛА в стандартный вывод. Если ФАЙЛ отсутствует или если ФАЙЛ равен -, читать стандартный ввод.
 Обязательные аргументы для длинных опций обязательны и для коротких опций.";ES;fi;;
  2) S=M2 ;SC;if [[ $cur == enter ]];then R;echo " Написано Дэвидом М. Игнатом, Дэвидом Маккензи и Джимом Мейерингом.";ES;fi;;
  3) S=M3 ;SC;if [[ $cur == enter ]];then R;echo " Онлайн-справка GNU coreutils:                  https://www.gnu.org/software/coreutils/
 Сообщайте обо всех ошибках перевода по адресу: https://translationproject.org/team/";ES;fi;;
  4) S=M4 ;SC;if [[ $cur == enter ]];then R;echo "
  Copyright © 2020 Free Software Foundation, Inc. Лицензия GPLv3+: GNU GPL версии 3 или выше: https://gnu.org/licenses/gpl.html
  Это бесплатное программное обеспечение: вы можете изменять и распространять его. НИКАКИХ ГАРАНТИЙ, насколько это разрешено законом.
";ES;fi;;
  5) S=M5 ;SC;if [[ $cur == enter ]];then R;echo "  Полная документация: https://www.gnu.org/software/coreutils/cut
  или доступно локально через: info (coreutils) cut invocation";ES;fi;;
  6) S=M6 ;SC;if [[ $cur == enter ]];then R;echo -e "
\e[32m echo \"abcdefghijklmnopqrstuvwxyz\" | cut -b 7\e[0m
 Если же необходимо вырезать  несколько символов, их номера указывают через запятую:
\e[32m echo \"abcdefghijklmnopqrstuvwxyz\" | cut -b 7,9,12\e[0m
 вырезать некоторый диапазон символов:
\e[32m echo \"abcdefghijklmnopqrstuvwxyz\" | cut -b 7-12\e[0m
 вырезать символы из текста, который находится в файле:
\e[32m cut -b 1,9 example.txt\e[0m
 вырезание символов в заданном диапазоне находится в файле:
\e[32m cut -b 4-9 example.txt\e[0m
 чтобы команда вырезала все символы, начиная с пятого:
\e[32m cut -b 5- example.txt\e[0m
 начиная с первого байта и заканчивая шестнадцатым:
\e[32m cut -b -16 example.txt\e[0m

 будем использовать двоеточие в качестве разделителя:
\e[32m cut -d: -f1 text.txt\e[0m
";ES;fi;;
  7) S=M7 ;SC;if [[ $cur == enter ]];then R;echo -e "
\e[32m echo \"abcdefg\" | cut -c3-5\e[0m

 вырезать первый символ можно так:
\e[32m echo \"abcdefg\" | cut -c 1\e[0m

 вырезать часть текста из готового документа:
\e[32m echo \"abcdefg\" | cut -c 1\e[0m
";ES;fi;;
  8) S=M8;SC;if [[ $cur == enter ]];then R;echo " ";ES;fi;;
  9) S=M9;SC;if [[ $cur == enter ]];then R;echo -e "
 Выберите только эти поля; также вывести любую строку, не содержащую символ-разделитель, если не указана опция -s

 Чтобы вырезать слово из первого столбца, воспользуемся командой
\e[32m echo \"Cognosce te ipsum\" | cut -d ' ' -f 1\e[0m

 В случае с текстовым файлом результат такой же — первое слово каждого столбца напечатано в терминале:
\e[32m cut -d ':' -f 1 example.txt\e[0m

 Чтобы вырезать несколько столбцов, нужно указать их номера:
\e[32m echo \"Cognosce te ipsum\" | cut -d ' ' -f 2,3\e[0m

 При использовании текстового файла аналогичная команда выглядит так:
\e[32m cut -d ':' -f 1,2,3 example.txt\e[0m

 виде диапазона чисел:
\e[32m cut -d ':' -f 1-3 example.txt\e[0m

 Обратите внимание на два апострофа, которые из раза в раз появляются в записи команды при работе с текстом из стандартного ввода.
 Эти знаки необходимы, если разделителем является символ пробела

 Вырезать содержимое, начиная с определенного столбца
\e[32m echo \"Cognosce te ipsum\" | cut -d ' ' -f 2-\e[0m
";ES;fi;;
 10) S=M10;SC;if [[ $cur == enter ]];then R;echo " ";ES;fi;;
 11) S=M11;SC;if [[ $cur == enter ]];then R;echo " ";ES;fi;;
 12) S=M12;SC;if [[ $cur == enter ]];then R;echo " ";ES;fi;;
 13) S=M13;SC;if [[ $cur == enter ]];then R;echo " Используйте STRING в качестве выходного разделителя, по умолчанию используется входной разделитель.";ES;fi;;
 14) S=M14;SC;if [[ $cur == enter ]];then R;echo " ";ES;fi;;
 15) S=M15;SC;if [[ $cur == enter ]];then R;echo " ";ES;fi;;
 16) S=M16;SC;if [[ $cur == enter ]];then R;echo " ";ES;fi;;
 17) S=M17;SC;if [[ $cur == enter ]];then R;echo " ";ES;fi;;
 18) S=M18;SC;if [[ $cur == enter ]];then R;echo " ";ES;fi;;
 19) S=M19;SC;if [[ $cur == enter ]];then R;echo " ";ES;fi;;
 20) S=M20;SC;if [[ $cur == enter ]];then R;echo " ";ES;fi;;
 21) S=M21;SC;if [[ $cur == enter ]];then R;cat README.md;ES;fi;;
#
 22) S=M22;SC;if [[ $cur == enter ]];then R;ls -l;exit 0;fi;;
 esac;POS;done
