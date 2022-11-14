#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { UNTAR } from '../../../../modules/ksumngs/untar/main.nf'
include { KRAKEN2 } from '../../../../modules/ksumngs/kraken2/main.nf'
include { KRAKENTOOLS_KREPORT2KRONA } from '../../../../modules/ksumngs/krakentools/kreport2krona/main.nf'

workflow test_krakentools_kreport2krona {

    input = Channel.of([ [ id:'test', single_end:false ], // meta map
              [ file(params.test_data['sarscov2']['illumina']['test_1_fastq_gz'], checkIfExists: true),
                file(params.test_data['sarscov2']['illumina']['test_2_fastq_gz'], checkIfExists: true) ]
            ])
    db    = file(params.test_data['sarscov2']['genome']['kraken2_tar_gz'], checkIfExists: true)

    UNTAR ( db )
    KRAKEN2 ( input, UNTAR.out.untar )
    KRAKENTOOLS_KREPORT2KRONA ( KRAKEN2.out.kreport )
}
