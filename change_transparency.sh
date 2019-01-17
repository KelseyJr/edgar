#!/bin/bash
# Change 127 255 127 -> transparent
for i in `find gfx -name '*.png'`;do
convert $i -transparent "#7fff7f" $i
TYPE=`identify -verbose $i | grep "Colorspace: Gray" | wc -l`
if [ $TYPE -gt 0 ];
then
	svn revert $i
fi
done
