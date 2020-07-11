#!/bin/bash
# 2020-07-11 v0.1
# Update the image version for k8s related images from k8s.gcr.io.

# 20200711
#kube-apiserver:v1.18.5
#kube-controller-manager:v1.18.5
#kube-scheduler:v1.18.5
#kube-proxy:v1.18.5
#pause:3.2
#etcd:3.4.3-0
#coredns:1.6.7

kube_version=v1.18.5
pause_version=3.2
etcd_version=3.4.3-0
coredns_version=1.6.7

# k8s
for dir in kube-apiserver kube-controller-manager kube-scheduler kube-proxy;
do
    echo "FROM k8s.gcr.io/${dir}:${kube_version}" > ./${dir}/Dockerfile;
done

# pause
echo "FROM k8s.gcr.io/pause:${pause_version}" > ./pause/Dockerfile

# etcd
echo "FROM k8s.gcr.io/etcd:${etcd_version}" > ./coredns/Dockerfile

# coredns
echo "FROM k8s.gcr.io/coredns:${coredns_version}" > ./coredns/Dockerfile
