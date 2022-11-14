#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { CAT_FASTQ } from '../../../../modules/ksumngs/cat/fastq/main.nf'

workflow test_cat_fastq_single_end_gzipped {
    input = [
        [ id:'test', single_end:true ], // meta map
        [ file(params.test_data['sarscov2']['illumina']['test_1_fastq_gz'], checkIfExists: true),
        file(params.test_data['sarscov2']['illumina']['test2_1_fastq_gz'], checkIfExists: true) ]
    ]

    CAT_FASTQ ( input , true )
}

workflow test_cat_fastq_paired_end_gzipped {
    input = [
        [ id:'test', single_end:false ], // meta map
        [ file(params.test_data['sarscov2']['illumina']['test_1_fastq_gz'], checkIfExists: true),
        file(params.test_data['sarscov2']['illumina']['test_2_fastq_gz'], checkIfExists: true),
        file(params.test_data['sarscov2']['illumina']['test2_1_fastq_gz'], checkIfExists: true),
        file(params.test_data['sarscov2']['illumina']['test2_2_fastq_gz'], checkIfExists: true) ]
    ]

    CAT_FASTQ ( input , true )
}

workflow test_cat_fastq_single_end_same_name_gzipped {
    input = [
        [ id:'test', single_end:true ], // meta map
        [ file(params.test_data['sarscov2']['illumina']['test_1_fastq_gz'], checkIfExists: true),
        file(params.test_data['sarscov2']['illumina']['test_1_fastq_gz'], checkIfExists: true) ]
    ]

    CAT_FASTQ ( input , true )
}

workflow test_cat_fastq_paired_end_same_name_gzipped {
    input = [
        [ id:'test', single_end:false ], // meta map
        [ file(params.test_data['sarscov2']['illumina']['test_1_fastq_gz'], checkIfExists: true),
        file(params.test_data['sarscov2']['illumina']['test_2_fastq_gz'], checkIfExists: true),
        file(params.test_data['sarscov2']['illumina']['test_1_fastq_gz'], checkIfExists: true),
        file(params.test_data['sarscov2']['illumina']['test_2_fastq_gz'], checkIfExists: true) ]
    ]

    CAT_FASTQ ( input , true )
}

workflow test_cat_fastq_single_end_uncompressed {
    input = [
        [ id:'test', single_end:true ], // meta map
        [ file(params.test_data['sarscov2']['illumina']['test_1_fastq_gz'], checkIfExists: true),
        file(params.test_data['sarscov2']['illumina']['test2_1_fastq_gz'], checkIfExists: true) ]
    ]

    CAT_FASTQ ( input , false )
}

workflow test_cat_fastq_paired_end_uncompressed {
    input = [
        [ id:'test', single_end:false ], // meta map
        [ file(params.test_data['sarscov2']['illumina']['test_1_fastq_gz'], checkIfExists: true),
        file(params.test_data['sarscov2']['illumina']['test_2_fastq_gz'], checkIfExists: true),
        file(params.test_data['sarscov2']['illumina']['test2_1_fastq_gz'], checkIfExists: true),
        file(params.test_data['sarscov2']['illumina']['test2_2_fastq_gz'], checkIfExists: true) ]
    ]

    CAT_FASTQ ( input , false )
}

workflow test_cat_fastq_single_end_same_name_uncompressed {
    input = [
        [ id:'test', single_end:true ], // meta map
        [ file(params.test_data['sarscov2']['illumina']['test_1_fastq_gz'], checkIfExists: true),
        file(params.test_data['sarscov2']['illumina']['test_1_fastq_gz'], checkIfExists: true) ]
    ]

    CAT_FASTQ ( input , false )
}

workflow test_cat_fastq_paired_end_same_name_uncompressed {
    input = [
        [ id:'test', single_end:false ], // meta map
        [ file(params.test_data['sarscov2']['illumina']['test_1_fastq_gz'], checkIfExists: true),
        file(params.test_data['sarscov2']['illumina']['test_2_fastq_gz'], checkIfExists: true),
        file(params.test_data['sarscov2']['illumina']['test_1_fastq_gz'], checkIfExists: true),
        file(params.test_data['sarscov2']['illumina']['test_2_fastq_gz'], checkIfExists: true) ]
    ]

    CAT_FASTQ ( input , false )
}
