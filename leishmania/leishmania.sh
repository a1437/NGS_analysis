genome=/biomsu/data/who_is_who/leishmania
sample=/biomsu/data/who_is_who/sample7
fastqc $sample/sample6_R1.fastq $sample/sample6_R2.fastq -threads 4 -o ./
fastp -i  sample7_R1.fastq -I sample7_R2.fastq -o  t_sample7_R1.fastq -O  t_sample7_R2.fastq -l 50 --cut_front --cut_right --trim_tail1 1 --thread 4 -h Leishm_report.html

for i in $(ls $genome | cut -d "." -f1); do bwa index -p ./${i}.index $genome/${i}.fasta ; done
for i in $(ls $genome | cut -d "." -f1); do bwa mem -t 6  ${i}.index  t_sample7_R1.fastq t_sample7_R2.fastq | samtools view -b | samtools sort -o ./${i}.bwa.sort.bam; done
for i in $(ls | cut -d "." -f1); do samtools flagstat -@ 6 ${i}.bwa.sort.bam > ${i}.bwa.sorted.flagstat.txt ; done
