## README


#To plot the admixture graphs, input files: 


DV_MV_2.1_popq      // (str) input file of population q's
DV_MV_2.1_indivq // (str) input file of individual q's
DV_MV.name       // (str) input file of labels for below figure
DV_MV.pop        // (str) input file of labels for atop figure
DV_MV_2.1.perm       // (str) input file of permutation of clusters to print  
DV_MV_2.1.indivs.ps         //(str) name of output file




in the result file: DV_MD_2.1_f


cut the "Proportion of membership of each pre-defined
 population in each of the 2 clusters" to make the popq file.


		  2:     0.852  0.148              30
		  3:     0.942  0.058               1
		  4:     0.741  0.259               3
		  5:     0.823  0.177               5
		  6:     0.579  0.421              30
		  7:     0.460  0.540               1
		  8:     0.389  0.611              34
		  9:     0.293  0.707               5
		 10:     0.350  0.650              26
		 11:     0.367  0.633              19
		 12:     0.612  0.388              60
		 13:     0.151  0.849              26
		 ....

AND the "Inferred ancestry of individuals" for the indq file: 

		  1 100_TakLan    (1)    2 :  0.993 0.007 
		  2 101_TakLan    (2)    2 :  0.977 0.023 
		  3 102_TakLan    (1)    2 :  0.776 0.224 
		  4 103_TakLan    (1)    2 :  0.993 0.007 
		  5 104_TakLan    (1)    2 :  0.992 0.008 
		  6 36_TakLan    (1)    2 :  0.410 0.590 
		  7 49_TakLan    (1)    2 :  0.989 0.011 
		  8 50_TakLan    (1)    2 :  0.992 0.008 
		  9 51_TakLan    (1)    2 :  0.932 0.068 
		 10 52_TakLan    (1)    2 :  0.969 0.031 
		 11 53_TakLan    (1)    2 :  0.657 0.343 
		 12 54_TakLan    (2)    2 :  0.994 0.006 
		 ...

MAKE a color file PERM FILE
		4 Paired_7_qual_2
		2 Paired_7_qual_5
		1 Paired_7_qual_4
		3 Set1_6_qual_6
		5 Paired_7_qual_6
		6 Paired_7_qual_7

