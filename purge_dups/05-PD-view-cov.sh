#!/bin/bash -e

# Purge_dups pipeline
# Created by Sarah Bailey, UoA
# Modified by Nat Forsdick, 2021-08-24

# step 05: to view the coverage distribution

##########
# PARAMS
PURGE_DUPS=/nesi/nobackup/ga03186/purge_dups/scripts/
OUTDIR=/nesi/nobackup/ga03186/kaki-hifi-asm/asm2-hifiasm-p/purge_dups/
PRE=asm2-hifiasm-p # PREFIX
PRI=p_ctg
ALT=a_ctg
R1=01P- # Designate cutoffs round - either default (01) or modified (02) and whether Primary or Alternate assembly
R2=02P-
##########

##########
# MODULES
ml purge
ml load Python
##########

cd ${OUTDIR}

python3 ${PURGE_DUPS}hist_plot.py -c ${R2}${PRE}-cutoffs ${R1}${PRE}-PB.stat ${R2}${PRE}-PB.cov.png

# Run assemblathon stats
/nesi/project/ga03186/scripts/Assemblathon_scripts/assemblathon_stats.pl ${R2}${PRE}-purged.fa > ${R2}${PRE}-purged.stats
