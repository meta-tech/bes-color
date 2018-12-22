bes-color
========

bes-color is a small bash bes display true colors utility library

## Install

add bes-color to your require section in bes.ini
```
[require]
bes.color   = 1.1
```
then do 
```
bes-build update
```

## Usage

by convention all color varnames begins with a 'C' uppercase followed by a name in lowercase

predefined colors :
- $Chead 
- $Cheadsep
- $Cheadline
- $Ctitle
- $Cdone
- $Cfail
- $Csep
- $Cerr
- $Cval
- $Ckey
- $Caction
- $Csymbol
- $Citem
- $Cusa
- $Cspe
- $Copt
- $Ccom
- $Ctext
- $Cmeta

use special var *$Coff* to disable previous color effects.

ex :
```
    echo -e "${Ctitle} mytitle${Coff}"
```

### use config file to load colors
 
```
color.load "/your/path/colors.ini"
```

without parameter, `color.load` function try to load
the default location `/usr/share/bes/colors.ini`

contents of colors.ini file :

```
[set]
#           background    foreground
#           R   G   B      R   G   B
head     =  53 114 160    195 223 255
headsep  =  53 114 160    252 212 102

[bg]
#           background
#           R   G   B
one      =  63 172 138
fail     = 172  63  85

[fg]
#           foreground
#           R   G   B
title    = 133  92 181
headline =  22  74 133
sep      =  80  80  80
err      = 194  48  64
val      = 255 175  95
key      =  40 168 134
action   = 106 183 241 
symbol   = 255 175  95
item     =  92 147 181
usa      = 255 172   0
spe      = 255 214 166
opt      =  94 215 255
com      = 175 135 175
text     =   0 132 101
meta     =  39 100 170 
```

in colors.ini config file, var names are without 'C' prefix


### set foreground

```
#                    R   G    B
color.fg "myfgcolor" 185  69  69
echo -e "$Cmyfgcolor foreground $Coff"
```


### set background color

```
#                      R   G    B
color.bg "mybgcolor" 69  185  185
echo -e "$Cmybgcolor background $Coff"
```


### mix background color and foreground color

```
echo -e "$Cmybgcolor background $Cmyfgcolor foregound $Coff"
echo -e "$Cmyfgcolor foreground $Cmybgcolor backgound $Coff"
```


### set background and foreground

```
#                      background  foreground
#                      R   G   B    R   G   B
color.set "mycolor"    69 185 185  185  69  69
echo -e "$Cmycolor cool $Coff"
```


### disabling colors

```
# set
BES_NOCOLOR=1
```
