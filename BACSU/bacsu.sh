#!bin/bash

bowtie2 -p 4 -x bacsu.index_bt2 -1 GLDS-185_transcriptomics_C8E4WANXX_s1_1_GSLv3-7_75_SL143634.fastq -2 GLDS-185_transcriptomics_C8E4WANXX_s1_2_GSLv3-7_75_SL143634.fastq -S sample75.sam --fast --no-unal
samtools view -bS sample75.sam > sample75.bam
samtools sort sample75.bam -o sample75.sorted.bam
samtools index sample75.sorted.bam  

bowtie2 -p 4 -x bacsu.index_bt2 -1 GLDS-185_transcriptomics_C8E4WANXX_s1_1_GSLv3-7_76_SL143635.fastq -2 GLDS-185_transcriptomics_C8E4WANXX_s1_2_GSLv3-7_76_SL143635.fastq -S sample76.sam --fast --no-unal
samtools view -bS sample76.sam > sample76.bam
samtools sort sample76.bam -o sample76.sorted.bam
samtools index sample76.sorted.bam 
samtools view -u -f 12 sample76.bam > sample76_unmapped.bam
samtools sort -n sample76_unmapped.bam -o sample35.newsort.bam
samtools fastq -F 0x900 -s /dev/null -o /dev/null -1 r1.fq -2 r2.fq sample35.newsort.bam


bwa index -p drome_bwa_index /biomsu/data/drome/ref/Drosophila_melanogaster.BDGP6.32.dna.toplevel.fa
bwa mem -t 4 drome_bwa_index /biomsu/data/drome/reads1/SRR10302246.fastq.gz | samtools view -bS | samtools sort -o 46_bwa.bam

hisat2-build /biomsu/data/drome/ref/Drosophila_melanogaster.BDGP6.32.dna.toplevel.fa drome_hisat_index 2
hisat2 -x drome_hisat_index -p 4 -U /biomsu/data/drome/reads1/SRR10302246.fastq.gz | samtools view -bS | samtools sort -o 46_hisat.bam









