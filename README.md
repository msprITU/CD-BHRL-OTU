# CD-BHRL-OTU: Cross-domain one-shot video object detection
This repository is an official implementation of the EUSIPCO 2025 paper "[_Cross-domain one-shot video object detection_](https://cmsworkshops.com/EUSIPCO2025/view_paper.php?PaperNum=1825)".
## Installation
- Create a Cuda enabled VM or Dockerized environment (Ubuntu 22.04 LTS is recommended)
- Install ipython package
- Clone the repository with
```bash
git clone https://github.com/msprITU/CD-BHRL-OTU.git
```
- Move codes to /root directory
```bash
mv CD-BHRL-OTU/* /root
```
- Run setup.sh with
```bash
cd /root
chmod +x setup.sh
./setup.sh
```
> **_Note:_** Setup script automatically downloads necessary packages and our modified version of [BHRL](https://github.com/msprITU/CD-BHRL-OTU-CORE) _([Reference project](https://github.com/hero-y/BHRL))_
- Install dependencies with
```bash
ipython 2-InstallDependencies.ipy
```
- Run the scripts under CLASS_BASED or ONLINE to start test

## Manual Download Process
> **_Note:__** _setup.sh_ and _1-VOTDownload.ipy_ scripts automatically downloads **BHRL Code**, **annotation files** and **pretrained files**. No need to download the following conent if previous installation method followed.
### Pretrained Model Files

| Model | Download Link |
|------------------|---------------|
| Split 1 | [Download](https://drive.google.com/uc?id=1r1x1vRdehtpjonsvNysRy2SL3b074Vik) |
| Split 2 | [Download](https://drive.google.com/uc?id=1ldKw9BJArnqEKTH-caNFVovKUKIHSh6y) |
| Split 3 | [Download](https://drive.google.com/uc?id=1JBgrmgw1hFji4jB-Nib_uY9z5BfY0hzi) |
| Split 4 | [Download](https://drive.google.com/uc?id=1iFmAkecLDCjJ_bFFSyn_orpHdQXyhv2g) |
| VOT     | [Download](https://drive.google.com/uc?id=12mNpnkLe8Or32GpntLMEL8HCI9nNi4KM) |

---

### Dataset Annotations
The following dataset annotations have been made compatible with BHRL.
| Dataset | Download Link |
|----------------------|---------------|
| Artoxor Annotations  | [Download](https://drive.google.com/uc?id=1ZAFLeIer2DgQST2YhdYqlU9naHLL_cMU) |
| DIOR Annotations     | [Download](https://drive.google.com/uc?id=1ow16HCWG94KeCagIG_KRu7WlfhREVwBU) |
| UODD Annotations     | [Download](https://drive.google.com/uc?id=1jk1HMBEyxhUKekhMAZbg_wZc01QyEcvj) |
| VOT Annotations      | [Download](https://drive.google.com/uc?id=1ihE3122vxbZ6O16TQ1egaF_6PgeBBAGd) |

## Dataset Preparation 
### VOT Dataset Download
The annotations of VOT dataset is already downloaded. To download video files, use
```bash
ipython 1-VOTDownload.ipy
```
> **_Note:_** 1-VOTDownload.ipy script automatically downloads the videos written in [BHRL/VOTIMAGES/vot_videos.txt](https://raw.githubusercontent.com/msprITU/CD-BHRL-OTU-CORE/refs/heads/master/VOTIMAGES/vot_videos.txt)
### ArTaxOr
- Download ArTaxOr dataset from [here](https://drive.google.com/file/d/1Tgd9xaOt9D60FJgGt7Rs0OspZwNk8bX-/view?usp=sharing)
- Move test directory to /root/BHRL/data/ARTAXOR/test with
```bash
mkdir -p /root/BHRL/data/ARTOXOR
mv test /root/BHRL/data/ARTOXOR
```

### DIOR
- Download DIOR dataset from [here](https://www.kaggle.com/datasets/shuaitt/diordata)
- Move images directory to /root/BHRL/data/DIOR/test with
```bash
mkdir -p /root/BHRL/data/DIOR
mv images /root/BHRL/data/DIOR/test
```

### UODD
- Download UODD dataset from this [repository](https://github.com/LehiChiang/Underwater-object-detection-dataset)
- Move imgs directory to /root/BHRL/data/UODD with
```bash
mkdir -p /root/BHRL/data/UODD
mv imgs /root/BHRL/data/UODD/imgs
```

