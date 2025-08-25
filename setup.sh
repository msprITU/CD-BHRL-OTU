#!/bin/bash
# Author: YK Hanoğlu
# NOTE: This script should run at /root/ directory (not /)

# THIS SCRIPT AUTOMATICALLY FETCHES BHRL SOURCE, DATASETS AND SETS UP THE ENVIRONMENT FOR CD-BHRL-OTU

# It is recommended to run this script in a fresh VM instance with at least 50GB disk space
echo "NOTE: This script should run at /root/ directory (not /)"

VERSION="V0.2"
SPLITNO="all"
while getopts ":hs:c:" opt; do
  case $opt in
    h) echo -e "BHRL Setup $VERSION"
       echo -e "Usage: $0 -s splitN"
       echo -e "    $0 -h \t\t\t: show this help menu"
       echo -e "    $0 -s {s1, s2, s3, s4, vot, all} \t: specify model to download (default 'all')"
       # echo -e "    $0 -c DONWLOADFILE\t\t: specify where to find class based video download links (default 'vot_classes.txt')"
       exit
       ;;
    s) echo "Split specified as $OPTARG"
       SPLITNO=$OPTARG
       ;;
  esac
done

# Install necessary packages
echo "Installing necessary packages"
apt install ripgrep -y &> /dev/null
apt install unzip -y &> /dev/null
pip install gdown 

# Not important for now
if [[ $SPLITNO == "all" ]]; then
  echo "Downloading all BHRL pretrained models"
  gdown https://drive.google.com/uc?id=1r1x1vRdehtpjonsvNysRy2SL3b074Vik # Split 1 model
  gdown https://drive.google.com/uc?id=1ldKw9BJArnqEKTH-caNFVovKUKIHSh6y # Split 2 model
  gdown https://drive.google.com/uc?id=1JBgrmgw1hFji4jB-Nib_uY9z5BfY0hzi # Split 3 model
  gdown https://drive.google.com/uc?id=1iFmAkecLDCjJ_bFFSyn_orpHdQXyhv2g # Split 4 model
  gdown https://drive.google.com/uc?id=12mNpnkLe8Or32GpntLMEL8HCI9nNi4KM # VOT     model
elif [[ $SPLITNO == "s1" ]];then
  echo "Downloading Split 1 BHRL pretrained model"
  gdown https://drive.google.com/uc?id=1r1x1vRdehtpjonsvNysRy2SL3b074Vik # Split 1 model
elif [[ $SPLITNO == "s2" ]];then
  echo "Downloading Split 2 BHRL pretrained model"
  gdown https://drive.google.com/uc?id=1ldKw9BJArnqEKTH-caNFVovKUKIHSh6y # Split 2 model
elif [[ $SPLITNO == "s3" ]];then
  echo "Downloading Split 3 BHRL pretrained model"
  gdown https://drive.google.com/uc?id=1JBgrmgw1hFji4jB-Nib_uY9z5BfY0hzi # Split 3 model
elif [[ $SPLITNO == "s4" ]];then
  echo "Downloading Split 4 BHRL pretrained model"
  gdown https://drive.google.com/uc?id=1iFmAkecLDCjJ_bFFSyn_orpHdQXyhv2g # Split 4 model
elif [[ $SPLITNO == "vot" ]];then
  echo "Downloading VOT BHRL pretrained model"
  gdown https://drive.google.com/uc?id=12mNpnkLe8Or32GpntLMEL8HCI9nNi4KM # VOT     model
fi

# Download zip files
# TIP gdown https://drive.google.com/uc?id=[ID]
echo "Downloading BHRL.zip"
gdown https://drive.google.com/uc?id=16yqkrI7sSe0xViG-q8RPyOrGoqtzhweB # BHRL.zip
echo "Downloading artoxor_annotation.zip"
gdown https://drive.google.com/uc?id=1ZAFLeIer2DgQST2YhdYqlU9naHLL_cMU # artoxor_annotation.zip
echo "Downloading dior_annotation.zip"
gdown https://drive.google.com/uc?id=1ow16HCWG94KeCagIG_KRu7WlfhREVwBU # dior_annotation.zip
echo "Downloading uodd_annotation.zip"
gdown https://drive.google.com/uc?id=1jk1HMBEyxhUKekhMAZbg_wZc01QyEcvj # uodd_annotation.zip
echo "Downloading vot_annotation.zip"
gdown https://drive.google.com/uc?id=1ihE3122vxbZ6O16TQ1egaF_6PgeBBAGd # vot_annotation.zip
# TODO download DIOR/ArTaxOr/UODD dataset images (no need to download vot)

# Unzip them
echo "Unzipping files"
unzip BHRL.zip
unzip artoxor_annotation.zip
unzip dior_annotation.zip
unzip uodd_annotation.zip
unzip vot_annotation.zip

# Move to necessary directories
echo "Moving files"
mv artoxor_annotation BHRL/
mv dior_annotation BHRL/
mv uodd_annotation BHRL/
mv vot_annotation BHRL/

# Sed experimental - fix paths in jsons and code
echo "Sed command running to alter directory paths"
rg "/root/" -l | xargs -i sed -i 's#/root/#/root/#g' {}

# Move models into checkpoints directory
mkdir BHRL/checkpoints
mv *.pth BHRL/checkpoints/
mv *.ipynb BHRL/

# Success message
echo "Configuration successfull"
