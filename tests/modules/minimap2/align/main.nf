#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { MINIMAP2_ALIGN } from '../../../../modules/minimap2/align/main.nf'

workflow test_minimap2_align_paired_end {

    fasta = file(params.test_data['sarscov2']['genome']['genome_fasta'], checkIfExists: true)
    input = [ [ id:'test', single_end:false ], // meta map
              [ file(params.test_data['sarscov2']['illumina']['test_1_fastq_gz'], checkIfExists: true),
                file(params.test_data['sarscov2']['illumina']['test_2_fastq_gz'], checkIfExists: true) ],
              fasta
            ]

    MINIMAP2_ALIGN ( input, false, false, false )
}

workflow test_minimap2_align_single_end {

    fasta = file(params.test_data['sarscov2']['genome']['genome_fasta'], checkIfExists: true)
    input = [ [ id:'test', single_end:true ], // meta map
              [ file(params.test_data['sarscov2']['illumina']['test_1_fastq_gz'], checkIfExists: true) ],
              fasta
            ]

    MINIMAP2_ALIGN ( input, false, false, false )
}

workflow test_minimap2_align_bam {

    fasta = file(params.test_data['sarscov2']['genome']['genome_fasta'], checkIfExists: true)
    input = [ [ id:'test', single_end:false ], // meta map
              [ file(params.test_data['sarscov2']['illumina']['test_1_fastq_gz'], checkIfExists: true),
                file(params.test_data['sarscov2']['illumina']['test_2_fastq_gz'], checkIfExists: true) ],
              fasta
            ]

    MINIMAP2_ALIGN ( input, true, false, false )
}

workflow test_minimap2_align_cigar_paf {

    fasta = file(params.test_data['sarscov2']['genome']['genome_fasta'], checkIfExists: true)
    input = [ [ id:'test', single_end:false ], // meta map
              [ file(params.test_data['sarscov2']['illumina']['test_1_fastq_gz'], checkIfExists: true),
                file(params.test_data['sarscov2']['illumina']['test_2_fastq_gz'], checkIfExists: true) ],
              fasta
            ]

    MINIMAP2_ALIGN ( input, false, true, false )
}

workflow test_minimap2_align_cigar_bam {

    fasta = file(params.test_data['sarscov2']['genome']['genome_fasta'], checkIfExists: true)
    input = [ [ id:'test', single_end:false ], // meta map
              [ file(params.test_data['sarscov2']['illumina']['test_1_fastq_gz'], checkIfExists: true),
                file(params.test_data['sarscov2']['illumina']['test_2_fastq_gz'], checkIfExists: true) ],
              fasta
            ]

    MINIMAP2_ALIGN ( input, true, false, true )
}

workflow test_minimap2_align_cigar_invalid_paf {

    fasta = file(params.test_data['sarscov2']['genome']['genome_fasta'], checkIfExists: true)
    input = [ [ id:'test', single_end:false ], // meta map
              [ file(params.test_data['sarscov2']['illumina']['test_1_fastq_gz'], checkIfExists: true),
                file(params.test_data['sarscov2']['illumina']['test_2_fastq_gz'], checkIfExists: true) ],
              fasta
            ]

    MINIMAP2_ALIGN ( input, true, true, false )
}

workflow test_minimap2_align_cigar_invalid_bam {

    fasta = file(params.test_data['sarscov2']['genome']['genome_fasta'], checkIfExists: true)
    input = [ [ id:'test', single_end:false ], // meta map
              [ file(params.test_data['sarscov2']['illumina']['test_1_fastq_gz'], checkIfExists: true),
                file(params.test_data['sarscov2']['illumina']['test_2_fastq_gz'], checkIfExists: true) ],
              fasta
            ]

    MINIMAP2_ALIGN ( input, false, false, true )
}
