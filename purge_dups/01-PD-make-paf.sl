#!/bin/bash -e

#SBATCH --job-name=make-paf
#SBATCH --output=%x.%j.out
#SBATCH --error=%x.%j.err
#SBATCH --time=00:12:00
#SBATCH --mem=8G
#SBATCH --ntasks=1
#SBATCH --profile=task 
#SBATCH --account=ga03186
#SBATCH --cpus-per-task=32

# Purge_dups pipeline
# Created by Sarah Bailey, UoA
# Modified by Nat Forsdick, 2021-08-24

# step 01: align HiFi sequencing data to the assembly and generate a paf file
# Takes one parameter - PRI or ALT

#########
# MODULES
module purge
module load minimap2/2.20-GCC-9.2.0 
#########

#########
# PARAMS
INDIR=/nesi/nobackup/ga03186/kaki-hifi-asm/asm2-hifiasm-p/
OUTDIR=/nesi/nobackup/ga03186/kaki-hifi-asm/asm2-hifiasm-p/purge_dups/
DATA=/nesi/project/ga03186/data/JF_PacBio-kaki-Steeves-Order260/processed/
PRE=asm2-hifiasm-p # PREFIX
PRI=p_ctg
ALT=a_ctg
R1=01P- # Designate cutoffs round - either default (01) or modified (02) and whether Primary or Alternate assembly
R2=02P-
#########

#mkdir -p $OUTDIR
cd $OUTDIR

if [ "$1" == "PRI" ]; then
  minimap2 -x map-hifi -t $SLURM_CPUS_PER_TASK ${INDIR}${PRE}.${PRI}.fa ${DATA}m54349U_210221_005741.fastq | gzip -c - > ${R1}${PRE}-${PRI}-mapped.paf.gz
 
elif [ "$1" == "ALT" ]; then
  minimap2 -x map-hifi -t $SLURM_CPUS_PER_TASK ${INDIR}${R1}${PRE}.${ALT}.hap-merged.fa ${DATA}m54349U_210221_005741.fastq | gzip -c - > ${R1}${PRE}-${ALT}-merged-mapped.paf.gz
fi
