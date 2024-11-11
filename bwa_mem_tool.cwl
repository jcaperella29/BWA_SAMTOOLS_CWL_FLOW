
cwlVersion: v1.0
class: CommandLineTool
baseCommand: ["/mnt/c/Users/ccape/bwa/bwa", "mem"]
hints:
  InlineJavascriptRequirement: {}  # Enables JavaScript if needed later
inputs:
  ref_genome:
    type: File
    inputBinding:
      position: 1
  ref_genome_bwt:
    type: File
  ref_genome_pac:
    type: File
  ref_genome_ann:
    type: File
  ref_genome_amb:
    type: File
  ref_genome_sa:
    type: File
  read1:
    type: File
    inputBinding:
      position: 2
  read2:
    type: File
    inputBinding:
      position: 3
outputs:
  aligned_sam:
    type: File
    outputBinding:
      glob: "*.sam"
stdout: output.sam
requirements:
  InitialWorkDirRequirement:
    listing:
      - $(inputs.ref_genome)
      - $(inputs.ref_genome_bwt)
      - $(inputs.ref_genome_pac)
      - $(inputs.ref_genome_ann)
      - $(inputs.ref_genome_amb)
      - $(inputs.ref_genome_sa)
