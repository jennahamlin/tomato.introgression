#!/bin/bash

#PBS -q bensasson_q 
#PBS -N vcftools
#PBS -l walltime=80:00:00,vmem=60gb,nodes=1:ppn=1
#PBS -m abe
#PBS -M jhamlin@uga.edu

cd /scratch/jhamlin/tomato


#ar=(Potato PI128650 LA0442 LA1365 LA2133 LA2157 LA0118 LA0400 LA2172 LA2147 LA1983 LA1969 LA1933 LA1718 LA1617 LA1595 LA1582 LA1521 LA1375 LA1341 LA1278 LA1269 LA1246 LA1245 LA1044 LA0746 LA0716 LA0483 LA0417 LA0407 LA1969 LA0373 LA1777 LA1272)

##########1. Download data from ENA: POTATO (PRJNA287005), TOMATO 360 (PRJNA259308), and TOMATO 150 (PRJEB5235)
########## wget can take a bit of time especially since some of the files are quite large    
##potato

#axel ftp.sra.ebi.ac.uk/vol1/fastq/SRR206/002/SRR2069932/SRR2069932_1.fastq.gz
#axel ftp.sra.ebi.ac.uk/vol1/fastq/SRR206/002/SRR2069932/SRR2069932_2.fastq.gz

##tomato

#LA0118
#axel ftp.sra.ebi.ac.uk/vol1/fastq/ERR418/ERR418061/ERR418061_1.fastq.gz
#axel ftp.sra.ebi.ac.uk/vol1/fastq/ERR418/ERR418061/ERR418061_2.fastq.gz

#LA0373
#axel ftp.sra.ebi.ac.uk/vol1/fastq/SRR157/005/SRR1572235/SRR1572235_1.fastq.gz
#axel ftp.sra.ebi.ac.uk/vol1/fastq/SRR157/005/SRR1572235/SRR1572235_2.fastq.gz

#LA1272
#axel ftp.sra.ebi.ac.uk/vol1/fastq/ERR418/ERR418106/ERR418106_1.fastq.gz
#axel ftp.sra.ebi.ac.uk/vol1/fastq/ERR418/ERR418106/ERR418106_2.fastq.gz

#LA0407
#axel ftp.sra.ebi.ac.uk/vol1/fastq/ERR418/ERR418104/ERR418104_1.fastq.gz
#axel ftp.sra.ebi.ac.uk/vol1/fastq/ERR418/ERR418104/ERR418104_2.fastq.gz

#LA0483
#axel  ftp.sra.ebi.ac.uk/vol1/fastq/ERR418/ERR418087/ERR418087_1.fastq.gz
#axel ftp.sra.ebi.ac.uk/vol1/fastq/ERR418/ERR418087/ERR418087_2.fastq.gz

#LA0716
#axel ftp.sra.ebi.ac.uk/vol1/fastq/ERR418/ERR418107/ERR418107_1.fastq.gz
#axel ftp.sra.ebi.ac.uk/vol1/fastq/ERR418/ERR418107/ERR418107_2.fastq.gz 

#1044
#axel ftp.sra.ebi.ac.uk/vol1/fastq/ERR418/ERR418121/ERR418121_1.fastq.gz 
#axel ftp.sra.ebi.ac.uk/vol1/fastq/ERR418/ERR418121/ERR418121_2.fastq.gz

#LA1278
#axel ftp.sra.ebi.ac.uk/vol1/fastq/ERR418/ERR418084/ERR418084_1.fastq.gz
#axel ftp.sra.ebi.ac.uk/vol1/fastq/ERR418/ERR418084/ERR418084_2.fastq.gz

#LA1365
#axel ftp.sra.ebi.ac.uk/vol1/fastq/ERR418/ERR418096/ERR418096_1.fastq.gz
#axel ftp.sra.ebi.ac.uk/vol1/fastq/ERR418/ERR418096/ERR418096_2.fastq.gz

#LA1718
#axel ftp.sra.ebi.ac.uk/vol1/fastq/ERR418/ERR418102/ERR418102_1.fastq.gz
#axel ftp.sra.ebi.ac.uk/vol1/fastq/ERR418/ERR418102/ERR418102_2.fastq.gz

#LA1983
#axel ftp.sra.ebi.ac.uk/vol1/fastq/ERR418/ERR418095/ERR418095_1.fastq.gz
#axel ftp.sra.ebi.ac.uk/vol1/fastq/ERR418/ERR418095/ERR418095_2.fastq.gz

#LA2133
#axel ftp.sra.ebi.ac.uk/vol1/fastq/ERR418/ERR418090/ERR418090_1.fastq.gz
#axel ftp.sra.ebi.ac.uk/vol1/fastq/ERR418/ERR418090/ERR418090_2.fastq.gz

#LA2157
#axel ftp.sra.ebi.ac.uk/vol1/fastq/ERR418/ERR418092/ERR418092_1.fastq.gz
#axel ftp.sra.ebi.ac.uk/vol1/fastq/ERR418/ERR418092/ERR418092_2.fastq.gz

#LA2172
#axel ftp.sra.ebi.ac.uk/vol1/fastq/ERR418/ERR418093/ERR418093_1.fastq.gz
#axel ftp.sra.ebi.ac.uk/vol1/fastq/ERR418/ERR418093/ERR418093_2.fastq.gz

#LA0373
#axel ftp.sra.ebi.ac.uk/vol1/fastq/SRR157/005/SRR1572235/SRR1572235_1.fastq.gz
#axel ftp.sra.ebi.ac.uk/vol1/fastq/SRR157/005/SRR1572235/SRR1572235_2.fastq.gz

#LA0400
#axel ftp.sra.ebi.ac.uk/vol1/fastq/SRR157/007/SRR1572257/SRR1572257_1.fastq.gz
#axel ftp.sra.ebi.ac.uk/vol1/fastq/SRR157/007/SRR1572257/SRR1572257_2.fastq.gz

#LA0417
#axel ftp.sra.ebi.ac.uk/vol1/fastq/SRR157/003/SRR1572243/SRR1572243_1.fastq.gz
#axel ftp.sra.ebi.ac.uk/vol1/fastq/SRR157/003/SRR1572243/SRR1572243_2.fastq.gz

#LA0442
#axel  ftp.sra.ebi.ac.uk/vol1/fastq/SRR157/008/SRR1572238/SRR1572238_1.fastq.gz
#axel  ftp.sra.ebi.ac.uk/vol1/fastq/SRR157/008/SRR1572238/SRR1572238_2.fastq.gz

#LA0746
#axel ftp.sra.ebi.ac.uk/vol1/fastq/SRR157/008/SRR1572688/SRR1572688_1.fastq.gz 
#axel ftp.sra.ebi.ac.uk/vol1/fastq/SRR157/008/SRR1572688/SRR1572688_2.fastq.gz

#LA1245
#axel ftp.sra.ebi.ac.uk/vol1/fastq/SRR157/008/SRR1572248/SRR1572248_1.fastq.gz
#axel ftp.sra.ebi.ac.uk/vol1/fastq/SRR157/008/SRR1572248/SRR1572248_2.fastq.gz

#LA1246
#axel ftp.sra.ebi.ac.uk/vol1/fastq/SRR157/004/SRR1572234/SRR1572234_1.fastq.gz
#axel ftp.sra.ebi.ac.uk/vol1/fastq/SRR157/004/SRR1572234/SRR1572234_2.fastq.gz

#LA1969
#axel ftp.sra.ebi.ac.uk/vol1/fastq/SRR157/000/SRR1572240/SRR1572240_1.fastq.gz
#axel ftp.sra.ebi.ac.uk/vol1/fastq/SRR157/000/SRR1572240/SRR1572240_2.fastq.gz

#LA1341
#axel ftp.sra.ebi.ac.uk/vol1/fastq/SRR157/000/SRR1572270/SRR1572270_1.fastq.gz
#axel ftp.sra.ebi.ac.uk/vol1/fastq/SRR157/000/SRR1572270/SRR1572270_2.fastq.gz

#LA1375
#axel ftp.sra.ebi.ac.uk/vol1/fastq/SRR157/009/SRR1572239/SRR1572239_1.fastq.gz
#axel ftp.sra.ebi.ac.uk/vol1/fastq/SRR157/009/SRR1572239/SRR1572239_2.fastq.gz

#LA1521
#axel ftp.sra.ebi.ac.uk/vol1/fastq/SRR157/001/SRR1572241/SRR1572241_1.fastq.gz
#axel ftp.sra.ebi.ac.uk/vol1/fastq/SRR157/001/SRR1572241/SRR1572241_2.fastq.gz

#LA1582
#axel ftp.sra.ebi.ac.uk/vol1/fastq/SRR157/006/SRR1572246/SRR1572246_1.fastq.gz
#axel ftp.sra.ebi.ac.uk/vol1/fastq/SRR157/006/SRR1572246/SRR1572246_2.fastq.gz

#LA1595
#axel ftp.sra.ebi.ac.uk/vol1/fastq/SRR157/008/SRR1572288/SRR1572288_1.fastq.gz
#axel ftp.sra.ebi.ac.uk/vol1/fastq/SRR157/008/SRR1572288/SRR1572288_2.fastq.gz

#LA1617
#axel ftp.sra.ebi.ac.uk/vol1/fastq/SRR157/000/SRR1572250/SRR1572250_1.fastq.gz
#axel ftp.sra.ebi.ac.uk/vol1/fastq/SRR157/000/SRR1572250/SRR1572250_2.fastq.gz

#LA1933
#axel ftp.sra.ebi.ac.uk/vol1/fastq/SRR157/003/SRR1572273/SRR1572273_1.fastq.gz
#axel ftp.sra.ebi.ac.uk/vol1/fastq/SRR157/003/SRR1572273/SRR1572273_2.fastq.gz

#LA1969
#axel ftp.sra.ebi.ac.uk/vol1/fastq/SRR157/006/SRR1572696/SRR1572696_1.fastq.gz
#axel ftp.sra.ebi.ac.uk/vol1/fastq/SRR157/006/SRR1572696/SRR1572696_2.fastq.gz

#LA2147
#axel ftp.sra.ebi.ac.uk/vol1/fastq/SRR157/004/SRR1572274/SRR1572274_1.fastq.gz
#axel ftp.sra.ebi.ac.uk/vol1/fastq/SRR157/004/SRR1572274/SRR1572274_2.fastq.gz

#PI128650
#axel ftp.sra.ebi.ac.uk/vol1/fastq/SRR157/004/SRR1572694/SRR1572694_1.fastq.gz
#axel ftp.sra.ebi.ac.uk/vol1/fastq/SRR157/004/SRR1572694/SRR1572694_2.fastq.gz

# LA1777
#axel ftp.sra.ebi.ac.uk/vol1/fastq/ERR418/ERR418103/ERR418103_1.fastq.gz
#axel ftp.sra.ebi.ac.uk/vol1/fastq/ERR418/ERR418103/ERR418103_2.fastq.gz

#note to self PI128650 = is located here -70.165523	-18.521155	Facultative-SC 
#LA1537 need to correct in supplemental table Self-fertile selection, obtained by self-pollination with irradiated pollen. Starting material from Alexander, originated from PI 128650

#gunzip *.fastq.gz

##########2. Run FastQC to identifiy parameters for trimming and quality check the data especially good idea when combining across projects
#module load FastQC/0.11.8-Java-1.8.0_144
#fastqc *fastq

##########Loop to grab the accesssion names and can be used in subsequent loops 
#for file in *_1.fastq
#do
#        strain=${file%%._1.fastq})
#done

##########3.Using accession names in previous loop, run trimmomatic to clean up reads 
#module load Trimmomatic/0.33-Java-1.8.0_144


#for file in *_1.fastq
#do
#        strain=${file%%._1.fastq}
#       java -jar $EBROOTTRIMMOMATIC/trimmomatic-0.33.jar PE -baseout ${strain}.fq /scratch/jhamlin/tomato/${strain}_1.fastq /scratch/jhamlin/tomato/${strain}_2.fastq SLIDINGWINDOW:4:20 MINLEN:36
#done

##########4. Perform mapping and sorting with associated packages output is a sorted.bam file 
#module load BWA/0.7.17-foss-2016b
#module load SAMtools/1.3.1-foss-2016b
#module load BCFtools/1.3.1-foss-2016b

#ar=(Potato PI128650 LA0442 LA1365 LA2133 LA2157 LA0118 LA0400 LA2172 LA2147 LA1983 LA1969 LA1933 LA1718 LA1617 LA1595 LA1582 LA1521 LA1375 LA1341 LA1278 LA1269 LA1246 LA1245 LA1044 LA0746 LA0716 LA0483 LA0417 LA0407 LA1969 LA0373 LA1777 LA1272)

#for strain in "${ar[@]}"
#do
#       bwa mem /scratch/jhamlin/tomato/SL2.50.fa ${strain}_1P.fq  ${strain}_2P.fq | samtools sort -o ${strain}.sorted.bam -

#done

##########5. Combine sorted bam files parsed by chromosome via mpileup and call using bcftools
#module load SAMtools/1.3.1-foss-2016b
#module load BCFtools/1.3.1-foss-2016b
#module load parallel/20160622-foss-2016b

#index files
#parallel samtools index ::: *.sorted.bam


#samtools mpileup -u -f /scratch/jhamlin/tomato/SL2.50.fa -r SL2.50ch01 -b tomato.list.txt | bcftools call -c -O b > solanum.combined.chr01.bcf
#samtools mpileup -u -f /scratch/jhamlin/tomato/SL2.50.fa -r SL2.50ch02 -b tomato.list.txt | bcftools call -c -O b > solanum.combined.chr02.bcf
#samtools mpileup -u -f /scratch/jhamlin/tomato/SL2.50.fa -r SL2.50ch03 -b tomato.list.txt | bcftools call -c -O b > solanum.combined.chr03.bcf
#samtools mpileup -u -f /scratch/jhamlin/tomato/SL2.50.fa -r SL2.50ch04 -b tomato.list.txt | bcftools call -c -O b > solanum.combined.chr04.bcf
#samtools mpileup -u -f /scratch/jhamlin/tomato/SL2.50.fa -r SL2.50ch05 -b tomato.list.txt | bcftools call -c -O b > solanum.combined.chr05.bcf
#samtools mpileup -u -f /scratch/jhamlin/tomato/SL2.50.fa -r SL2.50ch06 -b tomato.list.txt | bcftools call -c -O b > solanum.combined.chr06.bcf
#samtools mpileup -u -f /scratch/jhamlin/tomato/SL2.50.fa -r SL2.50ch07 -b tomato.list.txt | bcftools call -c -O b > solanum.combined.chr07.bcf
#samtools mpileup -u -f /scratch/jhamlin/tomato/SL2.50.fa -r SL2.50ch08 -b tomato.list.txt | bcftools call -c -O b > solanum.combined.chr08.bcf
#samtools mpileup -u -f /scratch/jhamlin/tomato/SL2.50.fa -r SL2.50ch09 -b tomato.list.txt | bcftools call -c -O b > solanum.combined.chr09.bcf
#samtools mpileup -u -f /scratch/jhamlin/tomato/SL2.50.fa -r SL2.50ch10 -b tomato.list.txt | bcftools call -c -O b > solanum.combined.chr10.bcf
#samtools mpileup -u -f /scratch/jhamlin/tomato/SL2.50.fa -r SL2.50ch11 -b tomato.list.txt | bcftools call -c -O b > solanum.combined.chr11.bcf
#samtools mpileup -u -f /scratch/jhamlin/tomato/SL2.50.fa -r SL2.50ch12 -b tomato.list.txt | bcftools call -c -O b > solanum.combined.chr12.bcf


#bcftools view solanum.combined.chr01.bcf | vcfutils.pl varFilter -Q 30 -d 10 - > solanum.filtered.chr01.vcf
#bcftools view solanum.combined.chr02.bcf | vcfutils.pl varFilter -Q 30 -d 10 - > solanum.filtered.chr02.vcf
#bcftools view solanum.combined.chr03.bcf | vcfutils.pl varFilter -Q 30 -d 10 - > solanum.filtered.chr03.vcf
#bcftools view solanum.combined.chr04.bcf | vcfutils.pl varFilter -Q 30 -d 10 - > solanum.filtered.chr04.vcf
#bcftools view solanum.combined.chr05.bcf | vcfutils.pl varFilter -Q 30 -d 10 - > solanum.filtered.chr05.vcf
#bcftools view solanum.combined.chr06.bcf | vcfutils.pl varFilter -Q 30 -d 10 - > solanum.filtered.chr06.vcf
#bcftools view solanum.combined.chr07.bcf | vcfutils.pl varFilter -Q 30 -d 10 - > solanum.filtered.chr07.vcf
#bcftools view solanum.combined.chr08.bcf | vcfutils.pl varFilter -Q 30 -d 10 - > solanum.filtered.chr08.vcf
#bcftools view solanum.combined.chr09.bcf | vcfutils.pl varFilter -Q 30 -d 10 - > solanum.filtered.chr09.vcf
#bcftools view solanum.combined.chr10.bcf | vcfutils.pl varFilter -Q 30 -d 10 - > solanum.filtered.chr10.vcf
#bcftools view solanum.combined.chr11.bcf | vcfutils.pl varFilter -Q 30 -d 10 - > solanum.filtered.chr11.vcf
#bcftools view solanum.combined.chr12.bcf | vcfutils.pl varFilter -Q 30 -d 10 - > solanum.filtered.chr12.vcf




##########6. Filter BCF with VCFtoosl. I used minimum base quality required to be 30 or greater and read depth to be 10 or greater
#module load VCFtools/0.1.15-foss-2016b-Perl-5.24.1
#
#vcftools --bcf solanum.combined.chr01.bcf --minQ 29 --min-meanDP 10 --recode --recode-INFO-all --out solanum.combined.filtered.chr01
#vcftools --bcf solanum.combined.chr02.bcf --minQ 29 --min-meanDP 10 --recode --recode-INFO-all --out solanum.combined.filtered.chr02
#cftools --bcf solanum.combined.chr03.bcf --minQ 29 --min-meanDP 10 --recode --recode-INFO-all --out solanum.combined.filtered.chr03
#vcftools --bcf solanum.combined.chr04.bcf --minQ 29 --min-meanDP 10 --recode --recode-INFO-all --out solanum.combined.filtered.chr04
#vcftools --bcf solanum.combined.chr05.bcf --minQ 29 --min-meanDP 10 --recode --recode-INFO-all --out solanum.combined.filtered.chr05
#vcftools --bcf solanum.combined.chr06.bcf --minQ 29 --min-meanDP 10 --recode --recode-INFO-all --out solanum.combined.filtered.chr06
#vcftools --bcf solanum.combined.chr07.bcf --minQ 29 --min-meanDP 10 --recode --recode-INFO-all --out solanum.combined.filtered.chr07
#vcftools --bcf solanum.combined.chr08.bcf --minQ 29 --min-meanDP 10 --recode --recode-INFO-all --out solanum.combined.filtered.chr08
#vcftools --bcf solanum.combined.chr09.bcf --minQ 29 --min-meanDP 10 --recode --recode-INFO-all --out solanum.combined.filtered.chr09
#vcftools --bcf solanum.combined.chr10.bcf --minQ 29 --min-meanDP 10 --recode --recode-INFO-all --out solanum.combined.filtered.chr10
#vcftools --bcf solanum.combined.chr11.bcf --minQ 29 --min-meanDP 10 --recode --recode-INFO-all --out solanum.combined.filtered.chr11
#vcftools --bcf solanum.combined.chr12.bcf --minQ 29 --min-meanDP 10 --recode --recode-INFO-all --out solanum.combined.filtered.chr12

#vcf-concat solanum.filtered.chr01.vcf solanum.filtered.chr02.vcf solanum.filtered.chr03.vcf solanum.filtered.chr04.vcf solanum.filtered.chr05.vcf solanum.filtered.chr06.vcf solanum.filtered.chr07.vcf solanum.filtered.chr08.vcf solanum.filtered.chr09.vcf solanum.filtered.chr10.vcf solanum.filtered.chr11.vcf solanum.filtered.chr12.vcf |  gzip -c > solanum.all.filtered.vcf.gz

# cp solanum.all.filtered.vcf.gz mvftools

##########7. Convert to MVF format
#cd /scratch/jhamlin/tomato/mvftools

#module load Biopython/1.68-foss-2016b-Python-3.5.2

#python3 mvftools.py ConvertVCF2MVF --vcf /scratch/jhamlin/tomato/solanum.all.filtered.vcf.gz --mask-depth 10 --mask-qual 30 --out solanum.all.filtered.mvf



