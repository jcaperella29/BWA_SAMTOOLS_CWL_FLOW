cwlVersion: v1.0
class: CommandLineTool
baseCommand: ["bedtools", "bamtobed"]
hints:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/bedtools:2.30.0--hc088bd4_1  # Use Docker if needed
inputs:
  sorted_bam:
    type: File
    inputBinding:
      prefix: "-i"  # Specify the input BAM file explicitly with `-i`
outputs:
  output_bed:
    type: File
    outputBinding:
      glob: "*.bed"
stdout: output.bed
arguments:
  - "-bedpe"  # Optional: Use BEDPE format for paired-end data
