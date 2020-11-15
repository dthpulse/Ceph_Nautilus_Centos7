#!/bin/bash

ceph osd pool create cold-storage 128 128 replicated

ceph osd pool create hot-storage 32 32 replicated

ceph osd tier add cold-storage hot-storage
ceph osd tier cache-mode hot-storage writeback
ceph osd tier set-overlay cold-storage hot-storage

ceph osd pool set hot-storage hit_set_type bloom

ceph osd pool set hot-storage hit_set_count 12
ceph osd pool set hot-storage hit_set_period 14400
ceph osd pool set hot-storage target_max_bytes 1000000000000
ceph osd pool set hot-storage min_read_recency_for_promote 2
ceph osd pool set hot-storage min_write_recency_for_promote 2
ceph osd pool set hot-storage target_max_bytes 1099511627776
ceph osd pool set hot-storage target_max_objects 1000000
ceph osd pool set hot-storage cache_target_dirty_ratio 0.4
ceph osd pool set hot-storage cache_target_dirty_high_ratio 0.6
ceph osd pool set hot-storage cache_target_full_ratio 0.8
ceph osd pool set hot-storage cache_min_flush_age 600
ceph osd pool set hot-storage cache_min_evict_age 1800
