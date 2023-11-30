#!bin/bash

bowtie2 -p 4 -x bacsu.index_bt2 -1 GLDS-185_transcriptomics_C8E4WANXX_s1_1_GSLv3-7_75_SL143634.fastq -2 GLDS-185_transcriptomics_C8E4WANXX_s1_2_GSLv3-7_75_SL143634.fastq -S sample75.sam --fast --no-unal
samtools view -bS sample75.sam > sample75.bam
samtools sort sample75.bam -o sample75.sorted.bam
samtools index sample75.sorted.bam  

bowtie2 -p 4 -x bacsu.index_bt2 -1 GLDS-185_transcriptomics_C8E4WANXX_s1_1_GSLv3-7_76_SL143635.fastq -2 GLDS-185_transcriptomics_C8E4WANXX_s1_2_GSLv3-7_76_SL143635.fastq -S sample76.sam --fast --no-unal
samtools view -bS sample76.sam > sample76.bam
samtools sort sample76.bam -o sample76.sorted.bam
samtools index sample76.sorted.bam  


