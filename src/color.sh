# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
# @author   a-Sansara - https://git.pluie.org/meta-tech/bes-color
# @app      bes-color
# @license  GNU GPL v3
# @date     2017-10-23 23:30:54 CET
#
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function bes.color.boot () {
    BES_NOCOLOR=${BES_NOCOLOR:-0}
    if [ "$BES_NOCOLOR" -eq 0 ]; then
        color.load
        if [ $? -eq 1 ]; then
            # by convention all colors begins with 'C' uppercase
            # followed by a name in lowercase
            # but in this calls you dont need to prefix names
            #
            #                    background    foreground
            #                    R   G   B      R   G   B
            color.set "head"     53 114 160    195 223 255
            color.set "headsep"  53 114 160    252 212 102
            #                    background
            #                    R   G   B
            color.bg  "done"     63 172 138
            color.bg  "fail"    172  63  85
            #                    foreground
            #                    R   G   B
            color.fg  "title"   133  92 181
            color.fg  "headline" 22  74 133
            color.fg  "sep"      80  80  80
            color.fg  "err"     194  48  64
            color.fg  "val"     255 175  95
            color.fg  "key"      40 168 134
            color.fg  "action"  106 183 241 
            color.fg  "symbol"  255 175  95
            color.fg  "item"     92 147 181
            color.fg  "usa"     255 172   0
            color.fg  "spe"     255 214 166
            color.fg  "opt"      94 215 255
            color.fg  "com"     175 135 175
            color.fg  "text"      0 132 101
            color.fg  "meta"     39 100 170 
            Coff="\\033[m"
            echo -e "$Cerr warning ${Coff}cannot load colors config file"
        fi
    fi
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function color.fg()
{
    local s=${1}
    if [ ${s:0:1} = "C" ]; then s=${s:1}; fi
    s=${s,,}
    local -n var=C$1
    var="\033[1;38;2;$2;$3;$4m"
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function color.bg()
{
    local s=${1}
    if [ ${s:0:1} = "C" ]; then s=${s:1}; fi
    s=${s,,}
    local -n var=C$1
    var="\033[1;48;2;$2;$3;$4m"
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function color.set()
{
    local s=${1}
    if [ ${s:0:1} = "C" ]; then s=${s:1}; fi
    s=${s,,}
    local -n var=C$1
    var="\033[1;48;2;$2;$3;$4;1;38;2;$5;$6;$7m"
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function color.rgb ()
{
    local c=${3:-0}
    local v=$1
    local -n r=${2}_r
    local -n g=${2}_g
    local -n b=${2}_b
    if [ -z  "$v" ]; then
        r=$c
        g=$c
        b=$c
        return
    fi
    r=${v%%;*}
    [ "$v" = "$r" ] && v='' || v="${v#*;}"
    if [ -z "$r" ]; then r=$c; fi
    g=${v%%;*}
    [ "$v" = "$g" ] && v='' || v="${v#*;}"
    if [ -z "$g" ]; then g=$c; fi
    b=${v%%;*}
    if [ -z "$b" ]; then b=$c; fi
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function color.env () {
    local -n   var=${2:-shenv}
    local        v=ctx$1
    local  ctxPROD="174 8 49"
    local   ctxINT="218 84 0"
    local   ctxDEV="218 159 0"
    local ctxLOCAL="122 122 122"
    if [ -z "${!v}" ]; then
        v=ctxLOCAL
        SHENV_CTX=LOCAL
    fi
    var=${!v}
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function color.load () {
    local file=${1:-/usr/share/bes/colors.ini}
    if [ -f "$file" ]; then
        local prefix="bes_colors"
        bes.ini "$file" -p "$prefix" -b 1
        for name in ${bes_colors_ALL_VARS}; do
            key="${name:${#prefix}+1}"
            if [ "${key:0:2}" = "fg" ]; then
                color.fg "${key:3}" ${!name}
            elif [ "${key:0:2}" == "bg" ]; then
                color.bg "${key:3}" ${!name}
            elif [ "${key:0:3}" == "set" ]; then
                color.set "${key:4}" ${!name}
            fi
        done
    else
        return 1
    fi
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
bes.color.boot
