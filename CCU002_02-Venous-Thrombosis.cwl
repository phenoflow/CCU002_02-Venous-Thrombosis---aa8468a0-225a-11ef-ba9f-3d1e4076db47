cwlVersion: v1.0
steps:
  read-potential-cases-fhir:
    run: read-potential-cases-fhir.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  cerebral-ccu002_02-venous-thrombosis---secondary:
    run: cerebral-ccu002_02-venous-thrombosis---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-fhir/output
  ccu002_02-venous-thrombosis-buddchiari---secondary:
    run: ccu002_02-venous-thrombosis-buddchiari---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: cerebral-ccu002_02-venous-thrombosis---secondary/output
  ccu002_02-venous-thrombosis-extremity---secondary:
    run: ccu002_02-venous-thrombosis-extremity---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: ccu002_02-venous-thrombosis-buddchiari---secondary/output
  ccu002_02-venous-thrombosis-embolism---secondary:
    run: ccu002_02-venous-thrombosis-embolism---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: ccu002_02-venous-thrombosis-extremity---secondary/output
  other-ccu002_02-venous-thrombosis---secondary:
    run: other-ccu002_02-venous-thrombosis---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: ccu002_02-venous-thrombosis-embolism---secondary/output
  ccu002_02-venous-thrombosis-pregnancy---secondary:
    run: ccu002_02-venous-thrombosis-pregnancy---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: other-ccu002_02-venous-thrombosis---secondary/output
  ccu002_02-venous-thrombosis-thrombophlebitis---secondary:
    run: ccu002_02-venous-thrombosis-thrombophlebitis---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: ccu002_02-venous-thrombosis-pregnancy---secondary/output
  ccu002_02-venous-thrombosis-unspecified---secondary:
    run: ccu002_02-venous-thrombosis-unspecified---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: ccu002_02-venous-thrombosis-thrombophlebitis---secondary/output
  ccu002_02-venous-thrombosis---secondary:
    run: ccu002_02-venous-thrombosis---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: ccu002_02-venous-thrombosis-unspecified---secondary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: ccu002_02-venous-thrombosis---secondary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
