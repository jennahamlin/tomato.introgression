import sys 
import random
import scipy.stats

def parse_alignment(alignment, P1, P2, P3, outgroup):
	
	'''
	Parses the sequences for the specified trio
	from the given input alignment.
	'''

	with open(alignment) as alignment_file:
		for line in alignment_file:
			if P1 in line:
				P1_seq = next(alignment_file, '').strip() #Parse P1 sequence	
			elif P2 in line: 
				P2_seq = next(alignment_file, '').strip() #Parse P2 sequence
			elif P3 in line:
				P3_seq = next(alignment_file, '').strip() #Parse P3 sequence
			elif outgroup in line:
				outgroup_seq = next(alignment_file, '').strip() #Parse outgroup sequence

	return P1_seq, P2_seq, P3_seq, outgroup_seq

		
def calc_D(P1, P2, P3, outgroup):
	
	'''
	Calculates the ABBA-BABA test for the specified trio
	'''

	bases = ['A', 'C', 'T', 'G']
	ABBA = 0
	BABA = 0

	for i in range(len(P1)):
		if P1[i] in bases and P2[i] in bases and P3[i] in bases and outgroup[i] in bases: #if all bases at site are resolved
			if P2[i] == P3[i] and P1[i] != P3[i] and P1[i] == outgroup[i]: #count ABBA sites
				ABBA += 1 
			elif P1[i] == P3[i] and P2[i] != P3[i] and P2[i] == outgroup[i]: #count BABA sites
				BABA += 1

	return ABBA, BABA, float(ABBA-BABA)/(ABBA+BABA)

def D_block_bootstrap(P1, P2, P3, outgroup, n_replicates):

	'''
	Performs block boostrapping of the ABBA-BABA test for
	the specified trio, and returns estimates of the 
	standard deviation, standard error, 95% confidence 
	interval, z score, and p value.
	'''

	D_estimates = []

	for i in range(n_replicates): #for each bootstrap replicate

        	P1_bootstrapped, P2_bootstrapped, P3_bootstrapped, outgroup_bootstrapped = [], [], [], [] #to store bootstrapped genomes

        	for j in range(1000): #for each resampling window

  			sampling_index = random.randint(0, len(P1)-100000) #index to slice 

                        #sample windows 
                        P1_bootstrapped.append(P1[sampling_index:sampling_index+100000])
                        P2_bootstrapped.append(P2[sampling_index:sampling_index+100000])
                        P3_bootstrapped.append(P3[sampling_index:sampling_index+100000])
                        outgroup_bootstrapped.append(outgroup[sampling_index:sampling_index+100000])

                #concatenate resampling windows
                P1_bootstrapped = ''.join(P1_bootstrapped)
                P2_bootstrapped = ''.join(P2_bootstrapped)
                P3_bootstrapped = ''.join(P3_bootstrapped)
                outgroup_bootstrapped = ''.join(outgroup_bootstrapped)

                #estimate D
		
		ABBA, BABA, D = calc_D(P1_bootstrapped, P2_bootstrapped, P3_bootstrapped, outgroup_bootstrapped)
		D_estimates.append(D)
 

        #estimate mean
        mean_D = sum(D_estimates)/float(len(D_estimates))

        #estimate variance
        D_stdev = ((sum([(x - mean_D)**2 for x in D_estimates]))/float((len(D_estimates)-1)))**(0.5)
 	D_se = D_stdev/float(len(D_estimates)**(0.5))
	CI_lower = mean_D - (1.96)*float(D_stdev)
	CI_upper = mean_D + (1.96)*float(D_stdev)
	
	#estimate p value
	if mean_D > 0:
		pval = sum(1 for i in D_estimates if i <= 0)/float(len(D_estimates))
	elif mean_D < 0:
		pval = sum(1 for i in D_estimates if i >= 0)/float(len(D_estimates))
		
	return mean_D, D_stdev, D_se, CI_lower, CI_upper, pval


P1, P2, P3, outgroup = parse_alignment('fasta_files/solanum.all.filtered.fasta', str(sys.argv[1]), str(sys.argv[2]), str(sys.argv[3]), 'Potato')
mean_D, D_stdev, D_se, CI_lower, CI_upper, pval = D_block_bootstrap(P1, P2, P3, outgroup, 1000)
print('.'.join([sys.argv[1], sys.argv[2], sys.argv[3]]), mean_D, D_stdev, D_se, CI_lower, CI_upper, pval)

