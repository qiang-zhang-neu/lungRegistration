#!/bin/sh
set +o errexit
time=$(date "+%Y%m%d-%H%M%S")
echo "start time"
echo "${time}"

export ITK_GLOBAL_DEFAULT_NUMBER_OF_THREADS=8

baseDirectory=./
dataDirectory="${baseDirectory}/Data/"
outputDirectory="${baseDirectory}/Data//Output/"

mkdir -p $outputDirectory

inspiration="${dataDirectory}/fixImg.nii.gz"
expiration="${dataDirectory}/movingImg.nii.gz"

inspirationPreprocessed="${outputDirectory}/N25I_preprocessed.nii.gz"
expirationPreprocessed="${outputDirectory}/N25E_preprocessed.nii.gz"



echo "Preprocessing:  Denoise."

PrintHeader $inspiration

DenoiseImage -d 3 -v 1 -i $inspiration -o $inspirationPreprocessed
DenoiseImage -d 3 -v 1 -i $expiration -o $expirationPreprocessed

read -p "Press any key to continue." var

