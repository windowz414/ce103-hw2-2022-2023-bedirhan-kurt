#!/usr/bin/bash
export GRAPHVIZ_DOT="$(which dot)"
export DOXYGEN_EXE="$(which doxygen)"
export SOURCE_DIR=../ce103-hw2-lib
export DOC_IMG_PATH_UML=../doxygen/Resources
export DOC_IMG_PATH=../doxygen/Resources
# export STRIP_PATH="C:xx"
if [ ! -f plantuml.jar ]; then
  curl -L -o plantuml.jar "https://github.com/plantuml/plantuml/releases/download/v1.2021.14/plantuml-1.2021.14.jar" || wget -O platuml.jar "https://github.com/plantuml/plantuml/releases/download/v1.2021.14/plantuml-1.2021.14.jar"
fi
java -jar "plantuml.jar" -v -o "$DOC_IMG_PATH_UML" "$SOURCE_DIR/**.(c|cpp|doc|h|puml)"
$DOXYGEN_EXE Doxyfile
echo -n "Press any key to continue ..."
read -sn1 < /dev/tty
