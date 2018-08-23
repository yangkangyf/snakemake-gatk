rule mutect2_tumor_normal:
    input:
        # Required arguments.
        reference = 'reference/Homo_sapiens_assembly38.fasta',
        tumor = '{tumor_sample}.bam',
        normal = '{normal_sample}.bam',
        tumor_idx = '{tumor_sample}.bam.bai',
        normal_idx = '{normal_sample}.bam.bai',
        reference_dict = 'reference/Homo_sapiens_assembly38.dict'
        # Optional arguments. Omit unused files.
        germline_resource = 'reference/af-only-gnomad.hg38.vcf.gz',
        germline_resource_index = 'reference/af-only-gnomad.hg38.vcf.gz.tbi'
    output:
        '{tumor_sample}.vcf.gz'
    params:
        extra = '--disable-read-filter MateOnSameContigOrNoMappedMateReadFilter ' \
        'af-of-alleles-not-in-resource 0.0000025 ',
        java_options = ''
    threads: 1
    wrapper:
        'http://dohlee-bio.info:9193/gatk/mutect2/tumor_normal'
