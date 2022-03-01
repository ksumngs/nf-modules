// Adapted from nf-core's cat/fastq module by Jose Espinosa-Carrasco and
// Harshil Patel
// (https://github.com/nf-core/modules/blob/master/modules/cat/fastq)
// Used under MIT license
// This module is modified from the original
// 1. To use a non-Busybox container
// 2. To join files regardless of number of original files
// 3. To allow a mix of gzipped and non-gzipped files
// #2 is a consequence of #3: a single non-gzipped file needs to be gzipped in the
// output
process CAT_FASTQ {
    tag "$meta.id"
    label 'process_low'

    conda (params.enable_conda ? "conda-forge::sed=4.7" : null)
    container "${ workflow.containerEngine == 'singularity' && !task.ext.singularity_pull_docker_container ?
        'https://containers.biocontainers.pro/s3/SingImgsRepo/biocontainers/v1.1.0_cv2/biocontainers_v1.1.0_cv2.img' :
        'docker.io/biocontainers/biocontainers:v1.1.0_cv2' }"

    input:
    tuple val(meta), path(reads, stageAs: "input*/*")

    output:
    tuple val(meta), path("*.merged.fastq.gz"), emit: reads
    path "versions.yml"                       , emit: versions

    when:
    task.ext.when == null || task.ext.when

    script:
    def args = task.ext.args ?: ''
    def prefix = task.ext.prefix ?: "${meta.id}"
    def readList = reads.collect{ it.toString() }
    if (meta.single_end) {
        """
        zcat -f ${readList.join(' ')} | gzip > ${prefix}.merged.fastq.gz

        cat <<-END_VERSIONS > versions.yml
        "${task.process}":
            gzip: echo \$(gzip --version | head -n1 | sed 's/^gzip //')
        END_VERSIONS
        """
    } else {
        def read1 = []
        def read2 = []
        readList.eachWithIndex{ v, ix -> ( ix & 1 ? read2 : read1 ) << v }
        """
        zcat -f ${read1.join(' ')} | gzip > ${prefix}_1.merged.fastq.gz
        zcat -f ${read2.join(' ')} | gzip > ${prefix}_2.merged.fastq.gz

        cat <<-END_VERSIONS > versions.yml
        "${task.process}":
            gzip: echo \$(gzip --version | head -n1 | sed 's/^gzip //')
        END_VERSIONS
        """
    }
}
