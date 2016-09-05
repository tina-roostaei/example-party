Sample project data
===================

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
