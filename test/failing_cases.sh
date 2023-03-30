#!/bin/bash

export CONTAINER_CGROUP_MANAGER=cgroupfs
export CONTAINER_CONMON_CGROUP=pod
export JOBS=1

sudo -E bats --verbose-run test/workloads.bats -f "test workload gets configured to defaults" && echo "$CONTAINER_CGROUP_MANAGER $CONTAINER_CONMON_CGROUP $JOBS"
sudo -E bats --verbose-run test/workloads.bats -f "test workload can override defaults"
sudo -E bats --verbose-run test/workloads.bats -f "test workload should not be set if not defaulted or specified"
sudo -E bats --verbose-run test/workloads.bats -f "test workload pod gets configured to defaults"
sudo -E bats --verbose-run test/workloads.bats -f "test workload can override pod defaults"
sudo -E bats --verbose-run test/workloads.bats -f "test workload pod should not be set if not defaulted or specified"
sudo -E bats --verbose-run test/workloads.bats -f "test workload pod should not be set if annotation not specified"
sudo -E bats --verbose-run test/workloads.bats -f "test workload pod should override infra_ctr_cpuset option"
sudo -E bats --verbose-run test/infra_ctr_cpuset.bats