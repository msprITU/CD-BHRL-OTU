#!/bin/bash
cd /root/BHRL

videos=("ballet" "bull" "person19" "dragon")

for seq in "${videos[@]}"; do
    if [ ! -d "vot_results/target_update_studies/real_time/e100_IoU_0_7_parts/parts_100/voc/logs/${seq}" ]; then
        mkdir -p "vot_results/target_update_studies/real_time/e100_IoU_0_7_parts/parts_100/voc/logs/${seq}"
    fi
    if [ ! -d "work_dirs/vot/BHRL/model_voc/${seq}" ]; then
        mkdir -p "work_dirs/vot/BHRL/model_voc/${seq}"
    fi
    python tools/train.py \
      --resume_from checkpoints/model_voc.pth \
      --config configs/voc/BHRL.py \
      --seq_name ${seq} \ann
      --no-validate \
      --seq_img_id 0 \
      --requested_class 20 \
      --ann_file vot_annotation/ft/${seq}_first_ft.json \
      --work_dir work_dirs/vot/BHRL/model_voc/${seq}

    seq_parts_num=$(python scripts/split_seq_imgs.py ${seq} 100)
    python tools/test.py \
        --config configs/voc/BHRL.py \
        --seq_name ${seq} \
        --part 0 \
        --ann_file vot_annotation/${seq}/${seq}_part_0.json \
        --checkpoint work_dirs/vot/BHRL/model_voc/${seq}/epoch_109.pth \
        --eval bbox \
        --result_file "vot_results/target_update_studies/real_time/e100_IoU_0_7_parts/parts_100/voc/results/${seq}" | tee vot_results/target_update_studies/real_time/e100_IoU_0_7_parts/parts_100/voc/logs/${seq}/${seq}_part0.out

    python scripts/find_update_frame_voc.py ${seq} 0 100 voc | tee vot_results/target_update_studies/real_time/e100_IoU_0_7_parts/parts_100/voc/logs/${seq}/${seq}_update_frames_0.out
    echo "The variable value is: $seq_parts_num"
    for i in $(seq 1 $seq_parts_num); do
        log_file="vot_results/target_update_studies/real_time/e100_IoU_0_7_parts/parts_100/voc/logs/${seq}/${seq}_part${i}.out"

        python tools/train.py \
            --resume_from work_dirs/vot/BHRL/model_voc/${seq}/epoch_109.pth \
            --config configs/voc/BHRL.py \
            --seq_name ${seq} \
            --no-validate \
            --seq_img_id 0 \
            --requested_class 20 \
            --ann_file vot_results/target_update_studies/real_time/e100_IoU_0_7_parts/parts_100/voc/update_frames/${seq}/target_update.json \
            --work_dir work_dirs/vot/BHRL/target_updates/${seq}


        python tools/test.py \
            --config configs/voc/BHRL.py \
            --seq_name ${seq} \
            --part $i \
            --ann_file vot_annotation/${seq}/${seq}_part_$i.json \
            --checkpoint work_dirs/vot/BHRL/target_updates/${seq}/epoch_209.pth \
            --result_file "vot_results/target_update_studies/real_time/e100_IoU_0_7_parts/parts_100/voc/results/${seq}" \
            --eval bbox | tee $log_file

        python scripts/find_update_frame_voc.py ${seq} $i 100 voc | tee vot_results/target_update_studies/real_time/e100_IoU_0_7_parts/parts_100/voc/logs/${seq}/${seq}_update_frames_$i.out
    done
done

