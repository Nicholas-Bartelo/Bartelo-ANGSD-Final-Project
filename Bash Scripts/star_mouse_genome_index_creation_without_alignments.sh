#! /bin/bash -l

#SBATCH --account=angsd_class
#SBATCH --partition=angsd_class                                                                                         #SBATCH --nodes=1
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

spack load star@2.7.0e
rm -rf /scratch/nib4003/STARtmp
mkdir -p /scratch/nib4003

STAR --runMode genomeGenerate --runThreadN 16 --genomeDir /home/nib4003/ANGSD_2021_hw/final_project/star_mouse_genome_index --genomeFastaFiles /home/nib4003/ANGSD_2021_hw/final_project/GRCm38.primary_assembly.genome.fa --sjdbGTFfile /home/nib4003/ANGSD_2021_hw/final_project/gencode.vM25.primary_assembly.annotation.gtf --sjdbOverhang 49 --outTmpDir /scratch/nib4003/STARtmp

exit
