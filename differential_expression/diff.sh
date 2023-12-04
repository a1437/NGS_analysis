parallel -X -j8 "hisat2 -x drome_hisat_index -p 4 -U {} | samtools sort -o {/.}.bam" ::: /biomsu/data/drome/reads1/*.gz
featureCounts -a /biomsu/data/drome/ref/Drosophila_melanogaster.BDGP6.32.108.gtf -t gene -o counts.txt ./*bam
/biomsu/data/scripts/run_edgeR_4vs4.R counts.txt deg_count.table
cat deg_count.table | awk '{if($5 < 0.01) print $1}' > DEG.list
