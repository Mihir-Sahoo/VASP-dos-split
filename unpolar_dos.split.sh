#!/bin/bash
# Unpolar-dos-split script by Mihir
###########################################
# When Calcualting for PDOS for spin-unpolarized system,
# put following key words in your INCAR file for dos calcualtion
#		LORBIT = 11
#		RWIGS  =  ***** **** **** ( u can take value from your POTCAR)
#			 values are seaprated by sapce for different types of atoms.
#		NEDOS  = 2000 (I have taken this value.)
# If u want to change NEDOS value, then no problem for script. just change the script where sed command is written. for example, If u take NEDOS =#  3000, then u can edit the script by putting 3006,3001and 3000 in place of 2006,2001 and 2000 respectively.
# Put DOSCAR file and script in same directory and run the script.
# Any doubt regarding script, freely caontact me through following mail ids.
#		mrs10@iitbbs.ac.in
#		smihirranjan@gmail.com
###########################################
echo ' enter Fermi energy'
read c
echo ' enter number of atoms'
read n
for k in $(seq "$n") ; do
echo "$k"
rm $k-pdos.dat
rm $k-total
sed -n 7,2006p DOSCAR > total-dos-temporary.dat
sed -n $(($k*2001+7)),$(($k*2001+6+2000))p DOSCAR > $k-pdos-temporary.dat
awk  '{printf( "%f\t%f\n",  $1- '$c',$2); }' total-dos-temporary.dat > total-dos.dat
awk  '{printf( "%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\n", $1- '$c',$2,$3,$4,$5,$6,$7,$8,$9,$10); }' $k-pdos-temporary.dat > $k-pdos.dat
cat $k-pdos.dat | awk '{printf( "%f\t%f\n", $1,$2+$3+$4+$5+$6+$7+$8+$9+$10); }' > $k-total
rm total-dos-temporary.dat $k-pdos-temporary.dat
done


