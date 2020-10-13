# VASP-dos-split
# When Calcualting for PDOS for spin-polarized system,
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
