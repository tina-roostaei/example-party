Tina has edited this!:

Sample project data
===================

This is sample project data to be used by the CAMH SCWG workshops. 

There are 350 subjects (ID: subject1 .. subject350), and the data is organized
like so: 

    cleaned_data/
        demographic.csv 
        genotype.csv
        cognitive.csv
        structural/
            subject1_t1.nii.gz
            ...
        <other-datatype>/
            ...

Structural imaging data
-----------------------

The image is taken from the Winterburn Hippocampal Atlases, and downsampled to
make a small image:

    autocrop -isostep 15 subject1_t1.mnc subject1_t1_res.mnc
    mnc2nii subject1_t1_res.mnc subject1_t1_res.nii
    gzip subject1_t1_res.nii

    for i in {1..350}; do 
        cp subject1_t1_res.nii.gz structural/subject${i}_t1.nii.gz
    done
