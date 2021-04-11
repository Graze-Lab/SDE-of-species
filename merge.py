#! /usr/bin/env python3

"A script to perform the linear regression and create the plot."

# Python program to
# demonstrate merging of
# two files

# Creating a list of filenames
filenames = ['A.591-search-immune-dmel-FlyBase_IDs.txt', 'B.432_search-defense-dmel-FlyBase_IDs.txt']

# Open file3 in write mode
with open('C.search-immune-defense-dmel-FlyBase_IDs.txt', 'w') as outfile:

    # Iterate through list
    for names in filenames:

        # Open each file in read mode
        with open(names) as infile:

            # read the data from file1 and
            # file2 and write it in file3
            outfile.write(infile.read())

        # Add '\n' to enter data of file2
        # from next line
        outfile.write("\n")
