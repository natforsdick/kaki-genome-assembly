#!/bin/bash -e

# Purge_dups pipeline
# Created by Sarah Bailey, UoA
# Modified by Nat Forsdick, 2021-08-24

# step 02: calculate read depth histogram and base-level read depth, generate default cutoffs, split the assembly

#########
# PARAMS
INDIR=/nesi/nobackup/ga03186/kaki-hifi-asm/asm2-hifiasm-p/
OUTDIR=/nesi/nobackup/ga03186/kaki-hifi-asm/asm2-hifiasm-p/purge_dups/
PURGE_DUPS=/nesi/nobackup/ga03186/purge_dups/bin/
PRE=asm2-hifiasm-p # PREFIX
PRI=p_ctg
ALT=a_ctg
ROUND=01P- # Designate cutoffs round - either default (01) or modified (02) and whether Primary or Alternate assembly
#########

cd $OUTDIR

# step 02a: Produce PB.base.cov and PB.stat files
${PURGE_DUPS}pbcstat ${ROUND}${PRE}-mapped.paf.gz

## step 02b: generate default cutoffs
${PURGE_DUPS}calcuts ${ROUND}${PRE}-PB.stat > ${ROUND}${PRE}-cutoffs 2> ${ROUND}${PRE}-calcults.log

## step 02c: split the assembly 
${PURGE_DUPS}split_fa ${INDIR}${PRE}${PRI}.fa > ${ROUND}${PRE}.split