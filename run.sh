#!/bin/bash
# set -euo pipefail

for edf in $(command find /proj/sens2022521/EEGcohortMX/ -name '*edf' -type f -exec basename \{} .edf \; )
do
    echo "EDF: ${edf}"
    julia   --project "/sw/comp/julia/1.7.2/rackham/test_user/MindReader/src/ReadMind.jl"       --input "${edf}.edf"       --inputDir "/proj/sens2022521/EEGcohortMX/"       --params "Parameters.jl" --paramsDir "" --annotation "${edf}.xlsx"       --annotDir "/proj/sens2022521/EEGcohortMX/"       --outDir "/home/ivans/"       --additional "annotationCalibrator.jl,fileReaderXLSX.jl"       --addDir "./"

done