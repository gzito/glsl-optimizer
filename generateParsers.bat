@echo off

set PATH=%PATH%;C:\Users\zito\Programmi\win_flex_bison

del src\glsl\glsl_lexer.cpp 
del src\glsl\glcpp\glcpp-lex.c
del src\glsl\glsl_parser.cpp
del src\glsl\glsl_parser.h
del src\glsl\glsl_parser.output
del src\glsl\glcpp\glcpp-parse.c
del src\glsl\glcpp\glcpp-parse.h
del src\glsl\glcpp\glcpp-parse.output

rem -d option in flex enable debug mode in scanner
win_flex -d -osrc/glsl/glcpp/glcpp-lex.c src/glsl/glcpp/glcpp-lex.l
win_flex -d -osrc/glsl/glsl_lexer.cpp src/glsl/glsl_lexer.ll

rem -t option in bison instrument the parser for debugging
win_bison -v -o "src/glsl/glcpp/glcpp-parse.c" -p "glcpp_parser_" --defines=src/glsl/glcpp/glcpp-parse.h src/glsl/glcpp/glcpp-parse.y
win_bison -v -o "src/glsl/glsl_parser.cpp" -p "_mesa_glsl_" --defines=src/glsl/glsl_parser.h src/glsl/glsl_parser.yy
