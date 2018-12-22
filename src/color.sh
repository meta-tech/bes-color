#!/bin/bash
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
        # by convention all colors begins with 'C' uppercase
        # followed by a name in lowercase
        #                     background    foreground
        #                     R   G   B      R   G   B
        color.set "Chead"     53 114 160    195 223 255
        color.set "Cheadsep"  53 114 160    252 212 102
        #                     background
        #                     R   G   B
        color.bg  "Cdone"     63 172 138
        color.bg  "Cfail"    172  63  85
        #                     foreground
        #                     R   G   B
        color.fg  "Ctitle"   133  92 181
        color.fg  "Cheadline" 22  74 133
        color.fg  "Csep"      80  80  80
        color.fg  "Cerr"     194  48  64
        color.fg  "Cval"     255 175  95
        color.fg  "Ckey"      40 168 134
        color.fg  "Caction"  106 183 241 
        color.fg  "Csymbol"  255 175  95
        color.fg  "Citem"     92 147 181
        color.fg  "Cusa"     255 172   0
        color.fg  "Cspe"     255 214 166
        color.fg  "Copt"      94 215 255
        color.fg  "Ccom"     175 135 175
        color.fg  "Ctext"      0 132 101
        color.fg  "Cmeta"     39 100 170 
        Coff="\\033[m"
    fi
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function color.fg()
{
    local -n var=$1
    var="\033[1;38;2;$2;$3;$4m"
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function color.bg()
{
    local -n var=$1
    var="\033[1;48;2;$2;$3;$4m"
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function color.set()
{
    local -n var=$1
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
bes.color.boot
