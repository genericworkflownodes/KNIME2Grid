#!/bin/bash
# THIS FILE WAS AUTOMATICALLY GENERATED BY THE KNIME2GUSE KNIME EXTENSION

# each file corresponds to one port that includes a list of files
INPUT_FILES_TO_EXPAND=@@INPUT_FILES_TO_EXPAND@@
# each of the folders listed here corresponds to an output port that generates list of files
OUTPUT_FOLDERS_TO_COMPRESS=@@OUTPUT_FOLDERS_TO_COMPRESS@@
EXECUTABLE=@@EXECUTABLE@@

for input_file_to_expand in ${INPUT_FILES_TO_EXPAND}; do
	echo "expanding ${input_file_to_expand}"
	# we expect the files to be extracted into a folder named after the port
	# e.g.: input_ligands/ligand1.sdf, input_ligands/ligand2.sdf
	echo tar xfz ${input_file_to_expand}
done

# execute the tool
echo "Executing:" ${EXECUTABLE} ${BASH_ARGV[*]}
${EXECUTABLE} ${BASH_ARGV[*]}

# compress the multi-file outputs
for output_folders_to_compress in ${OUTPUT_FOLDERS_TO_COMPRESS}; do
	echo "compressing ${output_folders_to_compress}"
	# the whole folder, whose name should match the output port name, will be compressed
	# e.g.: input_ligands/ligand1.sdf, input_ligands/ligand2.sdf
	echo tar cfz ${output_folders_to_compress}.tar.gz ${output_folders_to_compress}
done