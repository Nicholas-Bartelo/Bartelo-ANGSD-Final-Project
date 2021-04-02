#! /bin/bash

BATCH --account=angsd_class
#SBATCH --partition=angsd_class
#SBATCH --nodes=1
#SBATCH --ntasks=16
#SBATCH --job-name=mouse_genome_creation
#SBATCH --time=12:34:00
#SBATCH --mem=35G

echo "Starting at:" `date` >> hello_slurm_output.txt
sleep 30
echo "This is job #:" $SLURM_JOB_ID >> hello_slurm_output.txt
echo "Running on node:" `hostname` >> hello_slurm_output.txt
echo "Running on cluster:" $SLURM_CLUSTER_NAME >> hello_slurm_output.txt
echo "This job was assigned the temporary (local) directory:" $TMPDIR >> hello_slurm_output.txt

spack load subread

featureCounts -a /home/nib4003/ANGSD_2021_hw/final_project/gencode.vM25.primary_assembly.annotation.gtf -t 'exon' -g 'gene_id' -s 2 -o /home/nib4003/ANGSD_2021_hw/final_project/counting_reads_for_all_samples/final_project_featCounts_mouse_genes_stranded_after_comments_from_merv.txt /home/nib4003/ANGSD_2021_hw/final_project/all_bam_files_for_featurecounts/*.bam
