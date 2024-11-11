cwlVersion: v1.0
class: CommandLineTool
baseCommand: ["samtools", "sort"]
inputs:
  aligned_sam:
    type: File
    inputBinding:
      position: 1
outputs:
  sorted_bam:
    type: File
    outputBinding:
      glob: "*.bam"
stdout: sorted_output.bam
