#!/bin/bash
source "/data/zhoulab/yuxinghai/tools/utilis.sh"
D=/data5/zhoulab/yuxinghai/SongGeCKO_xyn/results/04_map
des_dir=/data5/zhoulab/yuxinghai/SongGeCKO_xyn/results/05_count
script_Dir=/data5/zhoulab/yuxinghai/SongGeCKO_xyn/script
exist_or_run "python ${script_Dir}/shcount.py /data5/zhoulab/data/SongGeCKO/N02054_ZN_80-56515317_ampliSEQ/PF_data/human_geckov2_library_a.csv ${D}/NC-A1.sam ${D}/A1.sam -o ${des_dir}/screen_A1.csv" ${des_dir}/screen_A1.csv

exist_or_run "python ${script_Dir}/shcount.py /data5/zhoulab/data/SongGeCKO/N02054_ZN_80-56515317_ampliSEQ/PF_data/human_geckov2_library_b.csv ${D}/NC-B1.sam ${D}/B1.sam -o ${des_dir}/screen_B1.csv" ${des_dir}/screen_B1.csv

