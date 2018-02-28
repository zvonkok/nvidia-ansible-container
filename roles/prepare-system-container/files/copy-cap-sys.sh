#!/bin/bash -x

NV_BINS="smi debugdump persistenced cuda-mps-control cuda-mps-server container-cli container-runtime-hook"

mkdir -p /opt/nvidia/{bin,lib}
mkdir -p /opt/nvidia/lib/modules/`uname -r`/extra


for i in $NV_BINS
do
	cp -av `which nvidia-${i}` /opt/nvidia/bin/.
done

cp -av /usr/lib64/nvidia/lib* /opt/nvidia/lib/.

find /lib/modules/`uname -r` -name nvidia* -exec cp -av {} \
     /opt/nvidia/lib/modules/`uname -r`/extra/ \; 
