#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { KRONA_IMPORTTEXT } from '../../../../modules/ksumngs/krona/importtext/main.nf'

workflow test_krona_importtext {

    input = file('http://krona.sourceforge.net/examples/text.txt', checkIfExists: true)

    KRONA_IMPORTTEXT ( input )
}
