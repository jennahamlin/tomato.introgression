import sys
import scipy.stats

def parse_nulls(nullfile):
	
	'''
	Gets the null distribution of D2 statistics
	from the specified file
	'''
	
	nulls = []

	with open(nullfile, 'r') as null_file:
		for line in null_file:
			nulls.append(float(str.strip(line)))

	return nulls

nulls = parse_nulls(sys.argv[1])

def D2_pval(nulls, observed_D2):

	'''
	Returns a p value for the empirical 
	value of D2, along with variance estimates
	for the null distribution
	'''

	mean_null_D2 = sum(nulls)/float(len(nulls))

	null_D2_stdev = ((sum([(x - mean_null_D2)**2 for x in nulls]))/float((len(nulls)-1)))**(0.5)
	null_D2_se = null_D2_stdev/float(len(nulls)**(0.5))
	CI_lower = mean_null_D2 - (1.96)*float(null_D2_stdev)
	CI_upper = mean_null_D2 + (1.96)*float(null_D2_stdev)

	if observed_D2 > mean_null_D2:
		pval = sum(1 for i in nulls if i >= observed_D2)/float(len(nulls))
	elif observed_D2 < mean_null_D2:
		pval = sum(1 for i in nulls if i <= observed_D2)/float(len(nulls))

	return mean_null_D2, null_D2_stdev, null_D2_se, CI_lower, CI_upper, pval

mean_null_D2, null_D2_stdev, null_D2_se, CI_lower, CI_upper, pval = D2_pval(nulls, float(sys.argv[2]))
trio = '.'.join([sys.argv[3], sys.argv[4], sys.argv[5]])
print(','.join([trio, sys.argv[2], str(mean_null_D2), str(null_D2_stdev), str(null_D2_se), str(CI_lower), str(CI_upper), str(pval)])) 
