#!/bin/sh
set +o errexit
time=$(date "+%Y%m%d-%H%M%S")
echo "start time"
echo "${time}"

export ITK_GLOBAL_DEFAULT_NUMBER_OF_THREADS=8

baseDirectory=./
dataDirectory="${baseDirectory}/Data/"
outputDirectory="${baseDirectory}/Data//Output/"
outputPrefix="${outputDirectory}/N25IxE"

mkdir -p $outputDirectory

inspiration="${dataDirectory}/fixImg.nii.gz"
expiration="${dataDirectory}/movingImg.nii.gz"

PrintHeader $inspiration


antsRegistration -d 3 \
                 -v 1 \
                 -t BSplineSyN[0.1,80,0,3] \
                 -m MSQ[${inspiration},${expiration},1,1] \
                 -c 200x200 \
                 -f 8x6 \
                 -s 2x1 \
                 -o [${outputPrefix}] \
				 --verbose

echo "${time}"
read -p "Press any key to continue." var

