#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { CLIQUESNV_ILLUMINAVC } from '../../../../modules/ksumngs/cliquesnv/illuminavc/main.nf'

workflow test_cliquesnv_illuminavc {
    
    input = [ 
        [ id:'test', single_end:false ], // meta map
        file(params.test_data['sarscov2']['illumina']['test_paired_end_bam'], checkIfExists: true) 
    ]

    CLIQUESNV_ILLUMINAVC ( input )
}
