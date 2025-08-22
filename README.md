# CD-BHRL-OTU: Cross-domain one-shot video object detection

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
> **_Note:_** Setup script automatically downloads necessary packages and our modified version of [BHRL](https://github.com/msprITU/CD-BHRL-OTU-CORE)
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
| Split 1 | [Download](https://drive.google.com/uc?id=1tl7O7m7SAaBZIi0u-z4uFUNFwUtoVm3o) |
| Split 2 | [Download](https://drive.google.com/uc?id=1D-PUQPH5NELTf52xUpGXO5jfxpa76pc8) |
| Split 3 | [Download](https://drive.google.com/uc?id=1GRyXANf60WaJp7UMqTEAGnUxftm_QLrG) |
| Split 4 | [Download](https://drive.google.com/uc?id=1sVSDI0aXNIPTgOPFDhpndcTwRR6mSlSU) |
| VOT | [Download](https://drive.google.com/uc?id=1TdmOfNoAYe9HTXozeBsG9inwyUS2J-az) |

---

### Dataset Annotations
The following dataset annotations have been made compatible with BHRL.
| Dataset | Download Link |
|----------------------|---------------|
| Artoxor Annotations  | [Download](https://drive.google.com/uc?id=17Y-todgImNTwR-ixqJTgbCw5k9r_XI11) |
| DIOR Annotations     | [Download](https://drive.google.com/uc?id=1d45B4APTjyJV7Ha5YhrBIM1JK1K5bTUR) |
| UODD Annotations     | [Download](https://drive.google.com/uc?id=1gS5xAm8EjDsjnO0a73Gb4xVYL_xapSit) |
| VOT Annotations      | [Download](https://drive.google.com/uc?id=1zx4pGQ3B2_m_MYj1eVfyNMY71CCgIBYq) |

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

