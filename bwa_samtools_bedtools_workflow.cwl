cwlVersion: v1.0
class: Workflow
inputs:
  ref_genome: File
  ref_genome_bwt: File
  ref_genome_pac: File
  ref_genome_ann: File
  ref_genome_amb: File
  ref_genome_sa: File
  read1: File
  read2: File

steps:
  bwa_mem:
    run: bwa_mem_tool.cwl
    in:
      ref_genome: ref_genome
      ref_genome_bwt: ref_genome_bwt
      ref_genome_pac: ref_genome_pac
      ref_genome_ann: ref_genome_ann
      ref_genome_amb: ref_genome_amb
      ref_genome_sa: ref_genome_sa
      read1: read1
      read2: read2
    out: [aligned_sam]

  samtools_sort:
    run: samtools_sort_tool.cwl
    in:
      aligned_sam: bwa_mem/aligned_sam
    out: [sorted_bam]

  bedtools_bamtobed:
    run: bedtools_bamtobed_tool.cwl
    in:
      sorted_bam: samtools_sort/sorted_bam
    out: [output_bed]

outputs:
  sorted_bam_output:
    type: File
    outputSource: samtools_sort/sorted_bam
  bed_output:
    type: File
    outputSource: bedtools_bamtobed/output_bed
