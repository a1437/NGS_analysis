#!bin/bash

bowtie2 -p 4 -x bacsu.index_bt2 -1 GLDS-185_transcriptomics_C8E4WANXX_s1_1_GSLv3-7_75_SL143634.fastq -2 GLDS-185_transcriptomics_C8E4WANXX_s1_2_GSLv3-7_75_SL143634.fastq -S sample80.sam --fast --no-unal
samtools view -bS -F 0x4 sample80.sam > sample80.bam
samtools sort sample80.bam -o sample80.sorted.bam
samtools index sample80.sorted.bam  
cp sample80.sorted.bam bacsu75.sorted.bam 
cp sample80.sorted.bam.bai bacsu75.sorted.bam.bai 

bowtie2 -p 4 -x bacsu.index_bt2 -1 GLDS-185_transcriptomics_C8E4WANXX_s1_1_GSLv3-7_76_SL143635.fastq -2 GLDS-185_transcriptomics_C8E4WANXX_s1_2_GSLv3-7_76_SL143635.fastq -S sample80.sam --fast --no-unal
samtools view -bS -F 0x4 sample80.sam > sample80.bam
samtools sort sample80.bam -o sample80.sorted.bam
samtools index sample80.sorted.bam  
cp sample80.sorted.bam bacsu76.sorted.bam 
cp sample80.sorted.bam.bai bacsu76.sorted.bam.bai 


