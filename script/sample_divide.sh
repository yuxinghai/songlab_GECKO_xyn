#!/usr/bin/bash
dir="/data5/zhoulab/yuxinghai/SongGeCKO_xyn/results/02_decode"
primer_Site="TCTTGTGGAAAGGACGAAACACCG"
A1_barcode="AAGTAGAG"
B1_barcode="CGCGCGGT"
NC_A1_barcode="CGTTACCA"
NC_B1_barcode="TCCTTGGT"
grep "\!$A1_barcode$primer_Site.*TTTTAGAG" $1 |sed -r 's/\!/\n/g' >${dir}/A1.fq
grep "\!$B1_barcode$primer_Site.*TTTTAGAG" $1 |sed -r 's/\!/\n/g' >${dir}/B1.fq
grep "\!$NC_A1_barcode$primer_Site.*TTTTAGAG" $1 |sed -r 's/\!/\n/g'>${dir}/NC-A1.fq
grep "\!$NC_A1_barcode$primer_Site.*TTTTAGAG" $1 |sed -r 's/\!/\n/g'>${dir}/NC-B1.fq

