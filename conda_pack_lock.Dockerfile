# we use this image to generate "relocatable" conda environments (with conda-pack) that
# work on old versions of CentOS (i.e. compatible with an old version of glibc, as found 
# on HPC clusters)
FROM ghcr.io/hpcflow/centos7-poetry:py3.11.3_po1.4.2

# libgl is required by VTK (used in the damask_parse_env MatFlow environment):
RUN /bin/bash <<InstallLibGL
    yum install -y mesa-libGL
InstallLibGL

RUN /bin/bash -l <<InstallMicroMamba
    "${SHELL}" <(curl -L micro.mamba.pm/install.sh)
    micromamba shell init --shell bash --root-prefix=~/micromamba
InstallMicroMamba

# create a base micromamba environment in which we install conda-pack
RUN /bin/bash -l <<CreateBaseEnv
    micromamba create -n base_env -c conda-forge python conda-pack conda-lock
CreateBaseEnv

CMD [ "/bin/bash", "-l"]
