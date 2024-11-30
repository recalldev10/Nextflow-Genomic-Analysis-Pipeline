nextflow.enable.dsl=2  // Enable DSL2

// Define the process for quality trimming and filtering
process trimAndFilter {
    // Specify the Conda environment with Cutadapt
    conda 'cutadapt=4.9'  // Make sure Cutadapt is installed in the specified environment

    input:
    path fastq  // Use 'path' for file input in DSL2

    output:
    path "trimmed_${fastq.baseName}.fastq"  // Output filename

    script:
    """
    # Use Cutadapt to trim and filter reads
    cutadapt -q 20 -o trimmed_${fastq.baseName}.fastq ${fastq}
    """
}

// Define the workflow
workflow {
    // Define your pipeline inputs
    inputFastq = file("sample1.fastq")  // Specify the input FASTQ file

    // Run the quality trimming and filtering process
    trimAndFilter(inputFastq)
}