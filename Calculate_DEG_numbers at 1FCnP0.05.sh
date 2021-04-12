#!/bin/bash

## Define the tissue ID
FILEID="Final_ID_dana_with_dmel_Ensemble_Symbol_removed_NA" 

#Define path variables
FILEDIR=/mnt/d/ComBioPub1/NRC_final_YO_FB/Clean_data/Final_Files
REF="$FILEDIR/Final_IDs_dmel_nrc_gene_fc_logration_wb_mf.csv" 
Anno="$FILEDIR/PA42.3.0.1.fasta.all.gff" 
R1="$FILEDIR/${TissueID}*_R1_*.fastq" 

awk -F "," '$7 ~ /^-0./ { next } { print }' ${FILEID}*.csv > temp1.csv

awk -F "," '$7 ~ /^0./ { next } { print }' temp1.csv > Final_${FILEID}_0.05_1.csv


#male count
awk -F',' 'FNR>1 && $7!~/^-/{count++} END{print count+0}' Final_${FILEID}_0.05_1.csv

#total count
wc -l Final_${FILEID}_0.05_1.csv | awk '{print $1-1}'

#female count in excel
