#! /bin/bash

BATCH --account=angsd_class
#SBATCH --partition=angsd_class
#SBATCH --nodes=1
#SBATCH --ntasks=16
#SBATCH --job-name=qorts_qc
#SBATCH --time=12:34:00
#SBATCH --mem=35G

echo "Starting at:" `date` >> hello_slurm_output.txt
sleep 30
echo "This is job #:" $SLURM_JOB_ID >> hello_slurm_output.txt
echo "Running on node:" `hostname` >> hello_slurm_output.txt
echo "Running on cluster:" $SLURM_CLUSTER_NAME >> hello_slurm_output.txt
echo "This job was assigned the temporary (local) directory:" $TMPDIR >> hello_slurm_output.txt

wget http://hartleys.github.io/QoRTs/QoRTs.jar
spack load qorts

java -Xmx12G -jar QoRTs.jar QC --singleEnded --stranded --generatePdfReport /home/nib4003/ANGSD_2021_hw/final_project/diabetes_sample1_aligned_star_reads/diabetes_sample1_alignments.Aligned.sortedByCoord.out.bam /home/nib4003/ANGSD_2021_hw/final_project/gencode.vM25.primary_assembly.annotation.gtf /home/nib4003/ANGSD_2021_hw/final_project/diabetes_sample1_qoRTs_alignment_qc_stranded

java -Xmx12G -jar QoRTs.jar QC --singleEnded --stranded --generatePdfReport /home/nib4003/ANGSD_2021_hw/final_project/diabetes_sample2_aligned_star_reads/diabetes_sample2_alignments.Aligned.sortedByCoord.out.bam /home/nib4003/ANGSD_2021_hw/final_project/gencode.vM25.primary_assembly.annotation.gtf /home/nib4003/ANGSD_2021_hw/final_project/diabetes_sample2_qoRTs_alignment_qc_stranded

java -Xmx12G -jar QoRTs.jar QC --singleEnded --stranded --generatePdfReport /home/nib4003/ANGSD_2021_hw/final_project/diabetes_sample3_aligned_star_reads/diabetes_sample3_alignments.Aligned.sortedByCoord.out.bam /home/nib4003/ANGSD_2021_hw/final_project/gencode.vM25.primary_assembly.annotation.gtf /home/nib4003/ANGSD_2021_hw/final_project/diabetes_sample3_qoRTs_alignment_qc_stranded

java -Xmx12G -jar QoRTs.jar QC --singleEnded --stranded --generatePdfReport /home/nib4003/ANGSD_2021_hw/final_project/heterozygous_sample1_aligned_star_reads/heterozygous_sample1_alignments.Aligned.sortedByCoord.out.bam /home/nib4003/ANGSD_2021_hw/final_project/gencode.vM25.primary_assembly.annotation.gtf /home/nib4003/ANGSD_2021_hw/final_project/heterozygous_sample1_qoRTs_alignment_qc_stranded

java -Xmx12G -jar QoRTs.jar QC --singleEnded --stranded --generatePdfReport /home/nib4003/ANGSD_2021_hw/final_project/heterozygous_sample2_aligned_star_reads/heterozygous_sample2_alignments.Aligned.sortedByCoord.out.bam /home/nib4003/ANGSD_2021_hw/final_project/gencode.vM25.primary_assembly.annotation.gtf /home/nib4003/ANGSD_2021_hw/final_project/heterozygous_sample2_qoRTs_alignment_qc_stranded

java -Xmx12G -jar QoRTs.jar QC --singleEnded --stranded --generatePdfReport /home/nib4003/ANGSD_2021_hw/final_project/heterozygous_sample3_aligned_star_reads/heterozygous_sample3_alignments.Aligned.sortedByCoord.out.bam /home/nib4003/ANGSD_2021_hw/final_project/gencode.vM25.primary_assembly.annotation.gtf /home/nib4003/ANGSD_2021_hw/final_project/heterozygous_sample3_qoRTs_alignment_qc_stranded

java -Xmx12G -jar QoRTs.jar QC --singleEnded --stranded --generatePdfReport /home/nib4003/ANGSD_2021_hw/final_project/wt_sample1_aligned_star_reads/wt_sample1_alignments.Aligned.sortedByCoord.out.bam /home/nib4003/ANGSD_2021_hw/final_project/gencode.vM25.primary_assembly.annotation.gtf /home/nib4003/ANGSD_2021_hw/final_project/wt_sample1_qoRTs_alignment_qc_stranded

java -Xmx12G -jar QoRTs.jar QC --singleEnded --stranded --generatePdfReport /home/nib4003/ANGSD_2021_hw/final_project/wt_sample2_aligned_star_reads/wt_sample2_alignments.Aligned.sortedByCoord.out.bam /home/nib4003/ANGSD_2021_hw/final_project/gencode.vM25.primary_assembly.annotation.gtf /home/nib4003/ANGSD_2021_hw/final_project/wt_sample2_qoRTs_alignment_qc_stranded

java -Xmx12G -jar QoRTs.jar QC --singleEnded --stranded --generatePdfReport /home/nib4003/ANGSD_2021_hw/final_project/wt_sample3_aligned_star_reads/wt_sample3_alignments.Aligned.sortedByCoord.out.bam /home/nib4003/ANGSD_2021_hw/final_project/gencode.vM25.primary_assembly.annotation.gtf /home/nib4003/ANGSD_2021_hw/final_project/wt_sample3_qoRTs_alignment_qc_stranded
