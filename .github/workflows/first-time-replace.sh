#!/bin/bash

function srename() {

  if [ $# -eq 2 ]; then

    #read -r -p "fromCommand : " fromCommand;
    fromCommand="$1"
    #pascalFrom=$(echo "$(tr '[:lower:]' '[:upper:]' <<<${fromCommand:0:1})${fromCommand:1}")
    upperFrom=$(echo "$fromCommand" | awk -F. '{print toupper($1)}')
    lowerFrom=$(echo "$fromCommand" | awk -F. '{print tolower($1)}')
    snakeFrom=$(echo "$fromCommand" | sed -r 's/([A-Z])/_\L\1/g' | sed 's/^_//g')
    snakeFrom=$(echo "$snakeFrom" | sed 's/-/_/g')
    upperSnakeFrom=$(echo "$snakeFrom" | awk -F. '{print toupper($1)}')
    kebabFrom=$(echo "$snakeFrom" | sed 's/_/-/g')
    camelFrom=$(echo "$snakeFrom" | sed -r 's|_([a-z])|\U\1|g')
    pascalFrom=$(echo "$snakeFrom" | sed -r 's|_([a-z])|\U\1|g' | sed 's|^\([a-z]\)|\u\1|')
    #camelFrom=$(echo "$(tr '[:upper:]' '[:lower:]' <<<${fromCommand:0:1})${fromCommand:1}")

    echo "\$upperFrom" $upperFrom
    echo "\$lowerFrom" $lowerFrom
    echo "\$snakeFrom" $snakeFrom
    echo "\$upperSnakeFrom" $upperSnakeFrom
    echo "\$kebabFrom" $kebabFrom
    echo "\$camelFrom" $camelFrom
    echo "\$pascalFrom" $pascalFrom

    #read -r -p "toCommand : " toCommand;
    toCommand="$2"
    #pascalTo=$(echo "$(tr '[:lower:]' '[:upper:]' <<<${toCommand:0:1})${toCommand:1}")
    upperTo=$(echo "$toCommand" | awk -F. '{print toupper($1)}')
    lowerTo=$(echo "$toCommand" | awk -F. '{print tolower($1)}')
    snakeTo=$(echo "$toCommand" | sed -r 's/([A-Z])/_\L\1/g' | sed 's/^_//g')
    snakeTo=$(echo "$snakeTo" | sed 's/-/_/g')
    upperSnakeTo=$(echo "$snakeTo" | awk -F. '{print toupper($1)}')
    kebabTo=$(echo "$snakeTo" | sed 's/_/-/g')
    camelTo=$(echo "$snakeTo" | sed -r 's|_([a-z])|\U\1|g')
    pascalTo=$(echo "$snakeTo" | sed -r 's|_([a-z])|\U\1|g' | sed 's|^\([a-z]\)|\u\1|')
    #camelTo=$(echo "$(tr '[:upper:]' '[:lower:]' <<<${toCommand:0:1})${toCommand:1}")

    echo "\$upperTo" $upperTo
    echo "\$lowerTo" $lowerTo
    echo "\$snakeTo" $snakeTo
    echo "\$upperSnakeTo" $upperSnakeTo
    echo "\$kebabTo" $kebabTo
    echo "\$camelTo" $camelTo
    echo "\$pascalTo" $pascalTo

    srenamelazy $fromCommand $toCommand
    srenamelazy $snakeFrom $snakeTo
    srenamelazy $upperSnakeFrom $upperSnakeTo
    srenamelazy $kebabFrom $kebabTo
    srenamelazy $camelFrom $camelTo
    srenamelazy $pascalFrom $pascalTo
    srenamelazy $upperFrom $upperTo
    srenamelazy $lowerFrom $lowerTo

    return 0
  fi

  echo "srename {from} {to}"
}

function srenamelazy() {

  if [ $# -eq 2 ]; then

    #read -r -p "fromCommand : " fromCommand;
    fromCommand="$1"

    #read -r -p "toCommand : " toCommand;
    toCommand="$2"

    echo "srenaminglazy directory ${fromCommand} ${toCommand}"
    find . -maxdepth 7 -type d -not -path "./node_modules*" -not -path "./.git/*" -not -path "./bootstrap*" -not -path "./docker*" -not -path "./storage*" -exec rename "s/$fromCommand/$toCommand/" {} +
    echo "srenamedlazy directory ${fromCommand} ${toCommand}"
    echo "srenaminglazy file ${fromCommand} ${toCommand}"
    find . -maxdepth 7 -type f -not -path "./node_modules*" -not -path "./.git/*" -not -path "./bootstrap*" -not -path "./docker*" -not -path "./storage*" \( -name '*.php' -o -name '*.json' -o -name '*.yml' -o -name '*.xml' -o -name '*.md' -o -name '*.blade.php' -o -name '*.ts' -o -name '*.js' -o -name '*.html' -o -name '*.scss' -o -name '*.vue' -o -name '*.png' -o -name '*.jpg' \) -exec rename "s/$fromCommand/$toCommand/" {} +
    echo "srenamedlazy file ${fromCommand} ${toCommand}"

    return 0
  fi

  echo "srenamelazy {from} {to}"
}

function srenamedry() {

  if [ $# -eq 2 ]; then

    #read -r -p "fromCommand : " fromCommand;
    fromCommand="$1"
    #pascalFrom=$(echo "$(tr '[:lower:]' '[:upper:]' <<<${fromCommand:0:1})${fromCommand:1}")
    upperFrom=$(echo "$fromCommand" | awk -F. '{print toupper($1)}')
    lowerFrom=$(echo "$fromCommand" | awk -F. '{print tolower($1)}')
    snakeFrom=$(echo "$fromCommand" | sed -r 's/([A-Z])/_\L\1/g' | sed 's/^_//g')
    snakeFrom=$(echo "$snakeFrom" | sed 's/-/_/g')
    upperSnakeFrom=$(echo "$snakeFrom" | awk -F. '{print toupper($1)}')
    kebabFrom=$(echo "$snakeFrom" | sed 's/_/-/g')
    camelFrom=$(echo "$snakeFrom" | sed -r 's|_([a-z])|\U\1|g')
    pascalFrom=$(echo "$snakeFrom" | sed -r 's|_([a-z])|\U\1|g' | sed 's|^\([a-z]\)|\u\1|')
    #camelFrom=$(echo "$(tr '[:upper:]' '[:lower:]' <<<${fromCommand:0:1})${fromCommand:1}")

    echo "\$upperFrom" $upperFrom
    echo "\$lowerFrom" $lowerFrom
    echo "\$snakeFrom" $snakeFrom
    echo "\$upperSnakeFrom" $upperSnakeFrom
    echo "\$kebabFrom" $kebabFrom
    echo "\$camelFrom" $camelFrom
    echo "\$pascalFrom" $pascalFrom

    #read -r -p "toCommand : " toCommand;
    toCommand="$2"
    #pascalTo=$(echo "$(tr '[:lower:]' '[:upper:]' <<<${toCommand:0:1})${toCommand:1}")
    upperTo=$(echo "$toCommand" | awk -F. '{print toupper($1)}')
    lowerTo=$(echo "$toCommand" | awk -F. '{print tolower($1)}')
    snakeTo=$(echo "$toCommand" | sed -r 's/([A-Z])/_\L\1/g' | sed 's/^_//g')
    snakeTo=$(echo "$snakeTo" | sed 's/-/_/g')
    upperSnakeTo=$(echo "$snakeTo" | awk -F. '{print toupper($1)}')
    kebabTo=$(echo "$snakeTo" | sed 's/_/-/g')
    camelTo=$(echo "$snakeTo" | sed -r 's|_([a-z])|\U\1|g')
    pascalTo=$(echo "$snakeTo" | sed -r 's|_([a-z])|\U\1|g' | sed 's|^\([a-z]\)|\u\1|')
    #camelTo=$(echo "$(tr '[:upper:]' '[:lower:]' <<<${toCommand:0:1})${toCommand:1}")

    echo "\$upperTo" $upperTo
    echo "\$lowerTo" $lowerTo
    echo "\$snakeTo" $snakeTo
    echo "\$upperSnakeTo" $upperSnakeTo
    echo "\$kebabTo" $kebabTo
    echo "\$camelTo" $camelTo
    echo "\$pascalTo" $pascalTo

    srenamedrylazy $fromCommand $toCommand
    srenamedrylazy $upperFrom $upperTo
    srenamedrylazy $lowerFrom $lowerTo
    srenamedrylazy $snakeFrom $snakeTo
    srenamedrylazy $upperSnakeFrom $upperSnakeTo
    srenamedrylazy $kebabFrom $kebabTo
    srenamedrylazy $camelFrom $camelTo
    srenamedrylazy $pascalFrom $pascalTo

    return 0
  fi

  echo "srenamedry {from} {to}"
}

function srenamedrylazy() {

  if [ $# -eq 2 ]; then

    #read -r -p "fromCommand : " fromCommand;
    fromCommand="$1"

    #read -r -p "toCommand : " toCommand;
    toCommand="$2"

    echo "srenamingdrylazy directory ${fromCommand} ${toCommand}"
    find . -maxdepth 7 -type d -not -path "./node_modules*" -not -path "./.git/*" -not -path "./bootstrap*" -not -path "./docker*" -not -path "./storage*" -exec echo "s/$fromCommand/$toCommand/" {} +
    echo "srenameddrylazy directory ${fromCommand} ${toCommand}"
    echo "srenamingdrylazy file ${fromCommand} ${toCommand}"
    find . -maxdepth 7 -type f -not -path "./node_modules*" -not -path "./.git/*" -not -path "./bootstrap*" -not -path "./docker*" -not -path "./storage*" \( -name '*.php' -o -name '*.json' -o -name '*.yml' -o -name '*.xml' -o -name '*.md' -o -name '*.blade.php' -o -name '*.ts' -o -name '*.js' -o -name '*.html' -o -name '*.scss' -o -name '*.vue' -o -name '*.png' -o -name '*.jpg' \) -exec echo "s/$fromCommand/$toCommand/" {} +
    echo "srenameddrylazy file ${fromCommand} ${toCommand}"

    return 0
  fi

  echo "srenamedrylazy {from} {to}"
}

function sreplace() {

  if [ $# -eq 2 ]; then

    #read -r -p "fromCommand : " fromCommand;
    fromCommand="$1"
    #pascalFrom=$(echo "$(tr '[:lower:]' '[:upper:]' <<<${fromCommand:0:1})${fromCommand:1}")
    upperFrom=$(echo "$fromCommand" | awk -F. '{print toupper($1)}')
    lowerFrom=$(echo "$fromCommand" | awk -F. '{print tolower($1)}')
    snakeFrom=$(echo "$fromCommand" | sed -r 's/([A-Z])/_\L\1/g' | sed 's/^_//g')
    snakeFrom=$(echo "$snakeFrom" | sed 's/-/_/g')
    upperSnakeFrom=$(echo "$snakeFrom" | awk -F. '{print toupper($1)}')
    kebabFrom=$(echo "$snakeFrom" | sed 's/_/-/g')
    camelFrom=$(echo "$snakeFrom" | sed -r 's|_([a-z])|\U\1|g')
    pascalFrom=$(echo "$snakeFrom" | sed -r 's|_([a-z])|\U\1|g' | sed 's|^\([a-z]\)|\u\1|')
    #camelFrom=$(echo "$(tr '[:upper:]' '[:lower:]' <<<${fromCommand:0:1})${fromCommand:1}")

    echo "\$upperFrom" $upperFrom
    echo "\$lowerFrom" $lowerFrom
    echo "\$snakeFrom" $snakeFrom
    echo "\$upperSnakeFrom" $upperSnakeFrom
    echo "\$kebabFrom" $kebabFrom
    echo "\$camelFrom" $camelFrom
    echo "\$pascalFrom" $pascalFrom

    #read -r -p "toCommand : " toCommand;
    toCommand="$2"
    #pascalTo=$(echo "$(tr '[:lower:]' '[:upper:]' <<<${toCommand:0:1})${toCommand:1}")
    upperTo=$(echo "$toCommand" | awk -F. '{print toupper($1)}')
    lowerTo=$(echo "$toCommand" | awk -F. '{print tolower($1)}')
    snakeTo=$(echo "$toCommand" | sed -r 's/([A-Z])/_\L\1/g' | sed 's/^_//g')
    snakeTo=$(echo "$snakeTo" | sed 's/-/_/g')
    upperSnakeTo=$(echo "$snakeTo" | awk -F. '{print toupper($1)}')
    kebabTo=$(echo "$snakeTo" | sed 's/_/-/g')
    camelTo=$(echo "$snakeTo" | sed -r 's|_([a-z])|\U\1|g')
    pascalTo=$(echo "$snakeTo" | sed -r 's|_([a-z])|\U\1|g' | sed 's|^\([a-z]\)|\u\1|')
    #camelTo=$(echo "$(tr '[:upper:]' '[:lower:]' <<<${toCommand:0:1})${toCommand:1}")

    echo "\$upperTo" $upperTo
    echo "\$lowerTo" $lowerTo
    echo "\$snakeTo" $snakeTo
    echo "\$upperSnakeTo" $upperSnakeTo
    echo "\$kebabTo" $kebabTo
    echo "\$camelTo" $camelTo
    echo "\$pascalTo" $pascalTo

    sreplacelazy $fromCommand $toCommand
    sreplacelazy $snakeFrom $snakeTo
    sreplacelazy $upperSnakeFrom $upperSnakeTo
    sreplacelazy $kebabFrom $kebabTo
    sreplacelazy $camelFrom $camelTo
    sreplacelazy $pascalFrom $pascalTo
    sreplacelazy $upperFrom $upperTo
    sreplacelazy $lowerFrom $lowerTo

    return 0
  fi

  echo "sreplace {from} {to}"
}

function sreplacelazy() {

  if [ $# -eq 2 ]; then

    #read -r -p "fromCommand : " fromCommand;
    fromCommand="$1"

    #read -r -p "toCommand : " toCommand;
    toCommand="$2"

    echo "sreplacinglazy ${fromCommand} ${toCommand}"

    find . -maxdepth 7 -type f -not -path "./node_modules*" -not -path "./.git/*" -not -path "./bootstrap*" -not -path "./docker*" -not -path "./storage*" \( -name '*.php' -o -name '*.json' -o -name '*.yml' -o -name '*.xml' -o -name '*.md' -o -name '*.blade.php' -o -name '*.ts' -o -name '*.js' -o -name '*.html' -o -name '*.scss' -o -name '*.vue' \) -exec sed -i s/$fromCommand/$toCommand/ {} +

    echo "sreplacedlazy ${fromCommand} ${toCommand}"

    return 0
  fi

  echo "sreplacelazy {from} {to}"
}

function sreplacedry() {

  if [ $# -eq 2 ]; then

    #read -r -p "fromCommand : " fromCommand;
    fromCommand="$1"
    #pascalFrom=$(echo "$(tr '[:lower:]' '[:upper:]' <<<${fromCommand:0:1})${fromCommand:1}")
    upperFrom=$(echo "$fromCommand" | awk -F. '{print toupper($1)}')
    lowerFrom=$(echo "$fromCommand" | awk -F. '{print tolower($1)}')
    snakeFrom=$(echo "$fromCommand" | sed -r 's/([A-Z])/_\L\1/g' | sed 's/^_//g')
    snakeFrom=$(echo "$snakeFrom" | sed 's/-/_/g')
    upperSnakeFrom=$(echo "$snakeFrom" | awk -F. '{print toupper($1)}')
    kebabFrom=$(echo "$snakeFrom" | sed 's/_/-/g')
    camelFrom=$(echo "$snakeFrom" | sed -r 's|_([a-z])|\U\1|g')
    pascalFrom=$(echo "$snakeFrom" | sed -r 's|_([a-z])|\U\1|g' | sed 's|^\([a-z]\)|\u\1|')
    #camelFrom=$(echo "$(tr '[:upper:]' '[:lower:]' <<<${fromCommand:0:1})${fromCommand:1}")

    echo "\$upperFrom" $upperFrom
    echo "\$lowerFrom" $lowerFrom
    echo "\$snakeFrom" $snakeFrom
    echo "\$upperSnakeFrom" $upperSnakeFrom
    echo "\$kebabFrom" $kebabFrom
    echo "\$camelFrom" $camelFrom
    echo "\$pascalFrom" $pascalFrom

    #read -r -p "toCommand : " toCommand;
    toCommand="$2"
    #pascalTo=$(echo "$(tr '[:lower:]' '[:upper:]' <<<${toCommand:0:1})${toCommand:1}")
    upperTo=$(echo "$toCommand" | awk -F. '{print toupper($1)}')
    lowerTo=$(echo "$toCommand" | awk -F. '{print tolower($1)}')
    snakeTo=$(echo "$toCommand" | sed -r 's/([A-Z])/_\L\1/g' | sed 's/^_//g')
    snakeTo=$(echo "$snakeTo" | sed 's/-/_/g')
    upperSnakeTo=$(echo "$snakeTo" | awk -F. '{print toupper($1)}')
    kebabTo=$(echo "$snakeTo" | sed 's/_/-/g')
    camelTo=$(echo "$snakeTo" | sed -r 's|_([a-z])|\U\1|g')
    pascalTo=$(echo "$snakeTo" | sed -r 's|_([a-z])|\U\1|g' | sed 's|^\([a-z]\)|\u\1|')
    #camelTo=$(echo "$(tr '[:upper:]' '[:lower:]' <<<${toCommand:0:1})${toCommand:1}")

    echo "\$upperTo" $upperTo
    echo "\$lowerTo" $lowerTo
    echo "\$snakeTo" $snakeTo
    echo "\$upperSnakeTo" $upperSnakeTo
    echo "\$kebabTo" $kebabTo
    echo "\$camelTo" $camelTo
    echo "\$pascalTo" $pascalTo

    sreplacedrylazy $fromCommand $toCommand
    sreplacedrylazy $upperFrom $upperTo
    sreplacedrylazy $lowerFrom $lowerTo
    sreplacedrylazy $snakeFrom $snakeTo
    sreplacedrylazy $upperSnakeFrom $upperSnakeTo
    sreplacedrylazy $kebabFrom $kebabTo
    sreplacedrylazy $camelFrom $camelTo
    sreplacedrylazy $pascalFrom $pascalTo

    return 0
  fi

  echo "sreplacedry {from} {to}"
}

function sreplacedrylazy() {

  if [ $# -eq 2 ]; then

    #read -r -p "fromCommand : " fromCommand;
    fromCommand="$1"

    #read -r -p "toCommand : " toCommand;
    toCommand="$2"

    echo "sreplacingdrylazy ${fromCommand} ${toCommand}"

    echo "find . -maxdepth 7 -type f -not -path "./node_modules*" -not -path "./.git/*" -not -path "./bootstrap*" -not -path "./docker*" -not -path "./storage*" \( -name '*.php' -o -name '*.json' -o -name '*.yml' -o -name '*.xml' -o -name '*.md' -o -name '*.blade.php' -o -name '*.ts' -o -name '*.js' -o -name '*.html' -o -name '*.scss' -o -name '*.vue' \) -exec sed -i s/$fromCommand/$toCommand/ {} +"

    find . -maxdepth 7 -type f -not -path "./node_modules*" -not -path "./.git/*" -not -path "./bootstrap*" -not -path "./docker*" -not -path "./storage*" \( -name '*.php' -o -name '*.json' -o -name '*.yml' -o -name '*.xml' -o -name '*.md' -o -name '*.blade.php' -o -name '*.ts' -o -name '*.js' -o -name '*.html' -o -name '*.scss' -o -name '*.vue' \) -exec sed -i s/$fromCommand/$toCommand/ {} +

    echo "sreplaceddrylazy ${fromCommand} ${toCommand}"

    return 0
  fi

  echo "sreplacedrylazy {from} {to}"
}

function srefactor() {

  if [ $# -eq 2 ]; then
    srename $@
    sreplace $@
    return 0
  fi

  echo "srefactor {from} {to}"
}

function srefactordry() {

  if [ $# -eq 2 ]; then
    srenamedry $@
    sreplacedry $@
    return 0
  fi

  echo "srefactordry {from} {to}"
}

function caseToUpper() {
  echo "$1" | awk -F. '{print toupper($1)}'
}
function caseToLower() {
  echo "$1" | awk -F. '{print tolower($1)}'
}
function caseToSnake() {
  echo "$1" | sed -r 's/([A-Z])/_\L\1/g' | sed 's/^_//g'
}
function caseToKebabArgs() {
  echo "$1" | sed 's/_/-/g'
}
function caseToKebab() {
  if [ ! -t 0 ]
  then
    while read line
    do
      caseToKebabArgs $(echo $line)
    done < "/dev/stdin"
  else
    caseToKebabArgs $@
  fi
}
function caseToCamel() {
  echo "$1" | sed -r 's|_([a-z])|\U\1|g'
}
function caseToPascal() {
  echo "$1" | sed -r 's|_([a-z])|\U\1|g' | sed 's|^\([a-z]\)|\u\1|'
}

REPO_NAME=$1
PACKAGE_KEYWORD=$(echo $REPO_NAME | sed -e 's/joy-voyager-bread-//')
# PACKAGE_KEYWORD=$(echo $PACKAGE_KEYWORDS | sed -e 's/s$//')

srefactor replace-keyword $PACKAGE_KEYWORD
srefactor replace-keyword $PACKAGE_KEYWORD
srefactor replace-keyword $PACKAGE_KEYWORD
srefactor replace-keyword $PACKAGE_KEYWORD
srefactor replace-keyword $PACKAGE_KEYWORD

srefactor tys ties
srefactor tys ties
srefactor tys ties
srefactor tys ties
