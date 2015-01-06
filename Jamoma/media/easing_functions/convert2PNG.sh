
	
for i in *.svg; 
do rsvg-convert $i -w "240" -h "180" -o `echo $i | sed -e 's/svg$/png/'`; 
done