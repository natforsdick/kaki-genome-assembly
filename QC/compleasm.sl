#!/bin/bash -e
#SBATCH -A ga03186
#SBATCH -J compleasm # job name (shows up in the queue)
#SBATCH -c 22
#SBATCH --mem=15GB #
#SBATCH --time=01:30:00 #Walltime (HH:MM:SS)
#SBATCH --output %x.%j.out #
#SBATCH --error %x.%j.err #

# compleasm - 2023-06-15
# Genome assembly QC - BUSCO alternative

# PARAMS
INDIR=/nesi/nobackup/ga03048/kaki-hifi-asm/asm3-hic-hifiasm-p/05-scaffolding/2023-12-18-asm3-pur-scaf/yahs/
OUTDIR=/nesi/nobackup/ga03048/kaki-hifi-asm/asm-stats/
DB=/nesi/project/ga03186/aves_odb10
ASM=asm3-hic-hifiasm-p-p_ctg-purged_rep1_scaffolds_final.contam-excl.fa

asm=$(basename $ASM .fa)

cd $INDIR
module purge
module load compleasm/0.2.2-gimkl-2022a

compleasm.py run -a ${INDIR}${ASM} -o ${OUTDIR}compleasm-${asm} -t 16  -l aves_odb10 -L $DB
