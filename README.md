# Bartelo-ANGSD-Final-Project

## What we have done so far 3/20

1. Downloaded all 9 sample reads into SCU

2. Ran FastQC on all 9 fastq files and made multiQC report. There seems to be possible problems with the diabetes mice.

3. Used primary assembly .gtf and .fa file to create reference genome for STAR alignment. We used the primary assembly because Merv told us it was a good idea and a better 
explanation can be found in "Download and begin processing Alignment" files. 

4. Aligned reads to reference genome using STAR.

5. Ran bamQC for all files and found that there are not errors which we should be concerned with.

6. Ran QoRTs on all aligned files and generated multiplot QC pdf files. 

7. Looked at IGV Browser and determined reads were stranded since they all point in same direction on same gene.

THINGS TO DO NEXT:

1. Use featureCounts on all samples, outlined in "Counting reads", and read the results into R following the class notes shown here and create all figures to compare samples: https://medcornell.instructure.com/courses/1787065/files/118484018?wrap=1 or also C:\Users\nicky\OneDrive\Documents\ANGSD-R-In_Class\2-24

2. Look at "RNA-seq Data Analysis 2" to figure out how to make heatmaps and use PCA. This file uses the same objects as used in step 2 above so it can be incorporated into one file.

## Future Questions To Consider:

1. Can we find gender of mice and see if there are differences in expression levels between different genders? This could result in a new insight into the paper if one gender has more expression than another. - ALL MICE ARE FEMALES (FOUND BY LOOKING AT QoRTs OUTPUT Chromosome Distribution (Excluding Autosomes) FIGURES FOR ALL FILES)

2. Library protocol used was ribo zero gold. We have found that there are more overrepresented sequences in diabetes mice than the others. This could be due to this protocol not being run perfectly and therefore resulting in a higher chance of rRNA left over or can also result in high numbers of long non-coding RNA or other non-coding RNA. We need to use BLAST to look at the top sequences, mostly in diabetes sample 3 which failed the overrepresented sequences multiqc output, to see where these sequences are coming from. If they are rRNA, we can potentially use sortMeRNA to get rid of them. The bias could also be due to an increased number of PCR cycles which amplifies GC content and duplicates more sequences, seen in our diabetes sample 3 multiqc.

3. Overall Good Question: Are differentially expressed genes just due to high overrepresented sequences we find? 

## What each resource below tells us:

1. Overall use of animals in diabetic research and why db/db is the best.

2. Diabetes in humans

3. Paper we are basing the whole project off of

4. Different paper not necessary to include

5. Different paper not necessary to include

6. Where we get the samples from 

7. Explains why we used some of the STAR parameters we did - e.g. sjdbOverhang = # of bp - 1

8. Explains library protocol used

9. Explains why it is necessary to use stranded flags to get more accurate results for featureCounts when having stranded reads. 

### Resources

1. King, Aileen J F. “The Use of Animal Models in Diabetes Research.” British Journal of Pharmacology, Blackwell Publishing Ltd, June 2012, www.ncbi.nlm.nih.gov/pmc/articles/PMC3417415/#:~:text=Although%20rats%20and%20mice%20are,to%20develop%20obesity%20in%20captivity. 

2. Fuchsberger, Christian, et al. “The Genetic Architecture of Type 2 Diabetes.” Nature, U.S. National Library of Medicine, 2017, www.ncbi.nlm.nih.gov/pmc/articles/PMC5034897/#SD1. 

3. Matthews, DR., et al. “RNA-Seq Analysis of Islets to Characterise the Dedifferentiation in Type 2 Diabetes Model Mice Db/Db.” Endocrine Pathology, Springer US, 1 Jan. 1998, link.springer.com/article/10.1007/s12022-018-9523-x. 

4. Goyal, Neha, et al. “RNA Sequencing of Db/Db Mice Liver Identifies LncRNA H19 as a Key Regulator of Gluconeogenesis and Hepatic Glucose Output.” Scientific Reports, Nature Publishing Group UK, 16 Aug. 2017, www.ncbi.nlm.nih.gov/pmc/articles/PMC5559625/. 

5. Zhang, Fang, et al. “Gene Expression Profile Analysis of Type 2 Diabetic Mouse Liver.” PLOS ONE, Public Library of Science, 2013, journals.plos.org/plosone/article?id=10.1371%2Fjournal.pone.0057766. 

6. “GEO Accession Viewer.” National Center for Biotechnology Information, U.S. National Library of Medicine, www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE107489. 

7. Dobin, Alexander, and Thomas Gingeras. “Optimizing RNA-Seq Mapping with STAR.” Methods in Molecular Biology (Clifton, N.J.), U.S. National Library of Medicine, 2016, pubmed.ncbi.nlm.nih.gov/27115637/. 

8. https://jp.support.illumina.com/content/dam/illumina-support/documents/documentation/chemistry_documentation/ribosomal-depletion/ribo-zero/ribo-zero-reference-guide-15066012-02.pdf

9. A. Mortazavi, BA. Williams, et al. “Comparison of Stranded and Non-Stranded RNA-Seq Transcriptome Profiling and Investigation of Gene Overlap.” BMC Genomics, BioMed Central, 1 Jan. 1970, bmcgenomics.biomedcentral.com/articles/10.1186/s12864-015-1876-7. 


Diabetes Sample 1:

#Sequence       Count   Percentage      Possible Source
CCTTAGGCAACCTGGTGGTCCCCCGCTCCCGGGAGGTCACCATATTGATG      86659   0.3393385648828227      No Hit
CCAGGCTGGAGTGCAGTGGCTATTCACAGGCGCGATCCCACTACTGATCA      64005   0.2506302270430661      No Hit
GTCGGCATGTATTAGCTCTAGAATTACCACAGTTATCCAAGTAGGAGAGG      61858   0.24222302295804987     No Hit
GCTCAATCTCGGGTGGCTGAACGCCACTTGTCCCTCTAAGAAGTTGGGGG      52598   0.2059627948130801      No Hit
GTAACTTTTCTGACACCTCCTGCTTAAAACCCAAAAGGTCAGAAGGATCG      52106   0.20403622545591754     No Hit
GCCCCATTGGCTCCTCAGCCAAGCACATACACCAAATGTCTGAACCTGCG      47814   0.1872296488686378      No Hit
GCCCTCTTGAACTCTCTCTTCAAAGTTCTTTTCAACTTTCCCTTACGGTA      44098   0.17267856811413373     No Hit
GATCGGAAGAGCACACGTCTGAACTCCAGTCACCAGATCATCTCGTATGC      42628   0.16692235479090417     TruSeq Adapter, Index 7 (100% over 50bp)



Diabetes Sample 3:

>>Overrepresented sequences     fail
#Sequence       Count   Percentage      Possible Source
CCTTAGGCAACCTGGTGGTCCCCCGCTCCCGGGAGGTCACCATATTGATG      269364  1.1978663922086121      No Hit
CCAGGCTGGAGTGCAGTGGCTATTCACAGGCGCGATCCCACTACTGATCA      213381  0.9489090176707573      No Hit
GCCCAGGCTGGAGTGCAGTGGCTATTCACAGGCGCGATCCCACTACTGAT      155587  0.6918980946398231      No Hit
CTTAGGCAACCTGGTGGTCCCCCGCTCCCGGGAGGTCACCATATTGATGC      133262  0.5926184314106713      No Hit
CAGGCTGGAGTGCAGTGGCTATTCACAGGCGCGATCCCACTACTGATCAG      133190  0.5922982461585997      No Hit
GCTATTCACAGGCGCGATCCCACTACTGATCAGCACGGGAGTTTTGACCT      132139  0.587624430881832       No Hit
GCTCCGTTTCCGACCTGGGCCGGTTCACCCCTCCTTAGGCAACCTGGTGG      111471  0.49571347546771727     No Hit
GGCTGGAGTGCAGTGGCTATTCACAGGCGCGATCCCACTACTGATCAGCA      106126  0.4719441675187893      No Hit
GGCTATTCACAGGCGCGATCCCACTACTGATCAGCACGGGAGTTTTGACC      96079   0.42726498380262856     No Hit
GTGGCTATTCACAGGCGCGATCCCACTACTGATCAGCACGGGAGTTTTGA      86355   0.3840221867034002      No Hit
CTCCGTTTCCGACCTGGGCCGGTTCACCCCTCCTTAGGCAACCTGGTGGT      73456   0.32666010939129136     No Hit
GTTGCCCAGGCTGGAGTGCAGTGGCTATTCACAGGCGCGATCCCACTACT      68130   0.3029752947727712      No Hit
AGGCTGGAGTGCAGTGGCTATTCACAGGCGCGATCCCACTACTGATCAGC      65926   0.2931740684454677      No Hit
CGCTATGTTGCCCAGGCTGGAGTGCAGTGGCTATTCACAGGCGCGATCCC      61820   0.27491461504260556     No Hit
CCCCTCCTTAGGCAACCTGGTGGTCCCCCGCTCCCGGGAGGTCACCATAT      55702   0.24770776265129754     No Hit
ATTCACAGGCGCGATCCCACTACTGATCAGCACGGGAGTTTTGACCTGCT      53966   0.23998774046245958     No Hit
CCCTCCTTAGGCAACCTGGTGGTCCCCCGCTCCCGGGAGGTCACCATATT      53288   0.2369726626721185      No Hit
GTTTCCGACCTGGGCCGGTTCACCCCTCCTTAGGCAACCTGGTGGTCCCC      48970   0.21777044158260098     No Hit
GCTATGTTGCCCAGGCTGGAGTGCAGTGGCTATTCACAGGCGCGATCCCA      47428   0.21091314076740045     No Hit
GCTCATTCAAAGGTTTTATTCATTGCAGAGGGGTAGGCTGGGTAGTGGTG      45894   0.20409141609131898     No Hit
CCTCCTTAGGCAACCTGGTGGTCCCCCGCTCCCGGGAGGTCACCATATTG      45189   0.20095626883145104     No Hit
GTCTCGCTATGTTGCCCAGGCTGGAGTGCAGTGGCTATTCACAGGCGCGA      43482   0.19336521014691965     No Hit
GGGGTCTCGCTATGTTGCCCAGGCTGGAGTGCAGTGGCTATTCACAGGCG      41732   0.1855829297146233      No Hit
CTCCTTAGGCAACCTGGTGGTCCCCCGCTCCCGGGAGGTCACCATATTGA      41016   0.18239886526346666     No Hit
