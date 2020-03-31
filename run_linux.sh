#!/bin/bash
prog="$0"
while [ -h "${prog}" ]; do
    newProg=`/bin/ls -ld "${prog}"`
    newProg=`expr "${newProg}" : ".* -> \(.*\)$"`
    if expr "x${newProg}" : 'x/' >/dev/null; then
        prog="${newProg}"
    else
        progdir=`dirname "${prog}"`
        prog="${progdir}/${newProg}"
    fi
done


oldwd=`pwd`
progdir=`dirname "${prog}"`

echo progdir "${progdir}"
cd "${progdir}"
progdir=`pwd`
prog="${progdir}"/`basename "${prog}"`
cd "${oldwd}"

jarpath=iDebugTool.jar

# Check args.
if [ debug = "$1" ]; then
    # add this in for debugging
    java_debug=-agentlib:jdwp=transport=dt_socket,server=y,address=8050,suspend=y
    shift 1
else
    java_debug=
fi

javaCmd="java"

# Mac OS X needs an additional arg, or you get an "illegal thread" complaint.
if [ `uname` = "Darwin" ]; then
    os_opts="-XstartOnFirstThread"
else
    os_opts=
fi

if [ `uname` = "Linux" ]; then
    export GDK_NATIVE_WINDOWS=true
fi

exec "$javaCmd" \
    -Xmx256M $os_opts $java_debug \
    -Didevicetool.IDeviceTool.bindir="$progdir" \
    -classpath "$jarpath" \
    idevicetool.IDeviceTool "$@"
