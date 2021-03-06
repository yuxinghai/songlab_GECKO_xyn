
#!/bin/bash
source "/data/zhoulab/yuxinghai/tools/utilis.sh"
raw_d=/data5/zhoulab/yuxinghai/SongGeCKO_xyn/results/03_20nt_sgRNA
D=/data5/zhoulab/yuxinghai/SongGeCKO_xyn/results/04_map
script_Dir=/data5/zhoulab/yuxinghai/SongGeCKO_xyn/script
mkdir -p ${D}
f_fa=${D}/crisprpool_A.fa
exist_or_run "python ${script_Dir}/mkpool.py ${D}" ${D}/${f_fa}
ebwt=${D}/bowtie.A_idx/crisprpool_A
mkdir -p ${D}/bowtie.A_idx
exist_or_run "bowtie-build ${f_fa} $ebwt" ${ebwt}.1.ebwt


NAMES=(A1 NC-A1)
numSamples=${#NAMES[@]}
for (( i=0; i<${numSamples}; i++ )); do
    name=${NAMES[$i]}
    f_fastq=${raw_d}/sg_${name}.fq
    f_sam=${D}/${name}.sam
    exist_or_run "bowtie -p 12 --best --strata --norc -m 1 -l 20 -n 3 -S ${ebwt} ${f_fastq} ${f_sam}" ${f_sam}
done

f_fa=${D}/crisprpool_B.fa
ebwt=${D}/bowtie.B_idx/crisprpool_B
mkdir -p ${D}/bowtie.B_idx
exist_or_run "bowtie-build ${f_fa} $ebwt" ${ebwt}.1.ebwt


NAMES=(B1 NC-B1)
numSamples=${#NAMES[@]}
for (( i=0; i<${numSamples}; i++ )); do
    name=${NAMES[$i]}
    f_fastq=${raw_d}/sg_${name}.fq
    #ls ${f_fastq}; continue
    f_sam=${D}/${name}.sam
    exist_or_run "bowtie -p 12 --best --strata --norc -m 1 -l 20 -n 3 -S ${ebwt} ${f_fastq} ${f_sam}" ${f_sam}
done
