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
ROUND=01P- # Designate cutoffs round - either default (01) or modified (02) and whether Primary or Alternate assembly
##########

##########
# MODULES
ml purge
ml load Python
##########

cd ${OUTDIR}

python3 ${PURGE_DUPS}hist_plot.py -c ${ROUND}${PRE}-cutoffs ${ROUND}${PRE}-PB.stat ${ROUND}${PRE}-PB.cov.png