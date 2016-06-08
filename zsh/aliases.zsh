alias em='emacs -nw'
alias sup='sudo $(fc -ln -1)'
alias sudo='sudo '
alias tr='trash'
alias ls='ls --color=auto --group-directories-first -X'
alias vi='nvim'
#cmake aliases
alias cm="cmake . && make"
function cmgen
{
    source=$1
    pwd="$(pwd)"
    echo "cmake_minimum_required ( VERSION 3.5.1 )\n"\
    "project ( $( basename $pwd ) )\n"\
    "add_executable ( prog $source )\n"\
    "target_compile_features ( prog PRIVATE cxx_range_for )\n" \
    "set( CMAKE_CXX_COMPILER \"/usr/bin/clang++\" )\n"\
    "set( CMAKE_CXX_FLAGS \"-Wall\" )\n"\
    "include_directories(\"../headers\")" > CMakeLists.txt
    
}

