#!/bin/bash -e

# Purge_dups pipeline
# Created by Sarah Bailey, UoA
# Modified by Nat Forsdick, 2021-08-24

# step 04b: merge purged haplotigs with alternate draft assembly

##########
# PARAMS
##########
INDIR=/nesi/nobackup/ga03186/kaki-hifi-asm/asm2-hifiasm-p/
OUTDIR=/nesi/nobackup/ga03186/kaki-hifi-asm/asm2-hifiasm-p/purge_dups/
PURGE_DUPS=/nesi/nobackup/ga03186/purge_dups/bin/
PRE=asm2-hifiasm-p # PREFIX
PRI=p_ctg
ALT=a_ctg
ROUND=01P- # Designate cutoffs round - either default (01) or modified (02) and whether Primary or Alternate assembly
##########

cd $OUTDIR

# Rename outputs
mv purged.fa ${ROUND}${PRE}-purged.fa
mv hap.fa ${ROUND}${PRE}-hap.fa

# Step 05: Merge purged haplotigs (hap.fa) with the alternate draft assembly
cat ${ROUND}${PRE}-hap.fa ${INDIR}${PRE}${ALT}.fa > ${INDIR}${PRE}${ALT}.hap-merged.fa