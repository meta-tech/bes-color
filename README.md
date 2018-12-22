bes-color
========

bes-color is a small bash bes display true colors utility library

## Install

add bes-color to your require section in bes.ini
```
[require]
bes.color   = 1.0
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


### set foreground

```
#                    R   G    B
color.fg "Cmyfgcolor" 185  69  69
echo -e "$Cmyfgcolor foreground $Coff"
```


### set background color

```
#                      R   G    B
color.bg "Cmybgcolor" 69  185  185
echo -e "$Cmybgcolor background $Coff"
```


### mix background color and foreground color

```
echo -e "$Cmybgcolor background $Cmyfgcolor foregound $Coff"
echo -e "$Cmyfgcolor foreground $Cmybgcolor backgound $Coff"
```


### set background and foreground

```
#                       background     foreground
#                       R   G   B    R   G   B
color.set "Cmycolor"    69 185 185  185  69  69
echo -e "$Cmycolor cool $Coff"
```


### disabling colors

```
# set
BES_NOCOLOR=1
```
