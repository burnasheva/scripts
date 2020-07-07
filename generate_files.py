for value in range(10):

	# construct the filename; prefix or suffix optional
	filename = 'prefix-' + str(value) + '.txt'
	
	# open the file to be written
	fo = open(filename, 'w')
	# write the content in the file including the value being passed to each; %s indicates a string
	fo.write('%s' % value)
	
	fo.close()
