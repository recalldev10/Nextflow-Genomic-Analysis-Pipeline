process align {
    input:
    file 'input.fastq'
    script:
    """
    bowtie2 -x reference_index -U \${fastq} -S alignment.sam
    """
}
// Define your pipeline inputs
input:
file 'input.fastq'
// Define your pipeline outputs
output:
file 'alignment.sam'
// Define pipeline parameters and options
"""
// Set the reference genome index path
params.reference_index = '/Users/PBandla_1/reference_sequence.fna'
"""
// Run the alignment