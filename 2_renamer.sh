#!/bin/bash
 
 
# Изменение расширений в именах файлов текущего каталога.
# Первый аргумент - старое расширение
# Второй аргумент - новое расширение
#
#         ./script.sh old_extension new_extension
#
# Меняются только файлы, у который раширение = old_extension
# 
# при этом измененные файлы копируются в папку answer, а исходные остаются на месте
# Пример:
# Изменить все расширения *.jpg в именах файлов на *.gif
#          ./script.sh jpg gif


ARGS=2 # Ожидаемое число аргументов.
E_BADARGS=65 # Код завершения, если число аргументов меньше ожидаемого.

if [ $# -ne "$ARGS" ]
then
  echo "Порядок использования: `basename $0` old_extension new_extension"
  exit $E_BADARGS
fi

#очищаем содержимое папки answer
rm -rf answer/*

# тут пишем свой код:
first=".$1"
second=".$2"
# Цикл прохода по списку имен файлов, имеющих расширение равное первому аргументу.
for file in ./*
do
if [ -f $file ] 
then

root="${file#.}"
root="${file%"$root"}${root%.*}"
ext="${file#"$root"}"
echo $ext

if [ $ext == $first ]
    then
	cp -r $file $root$second
	mv $root$second answer/
fi

fi
done
# Внутри цикла копируем файл в answer, подменяя расширение на новое


# Конец
exit 0
