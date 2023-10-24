if [[ -z ${USER_STORAGE} ]]; then
    echo "!!!"
    echo "!!! From $0:"
    echo "!!! ERROR: please set the USER_STORAGE env variable before sourcing the script, e.g."
    echo "!!!"
    echo "!!!   USER_STORAGE=/mnt/atlas01/users/<your-folder> source $0"
    echo "!!!"
else
    # set singularity cache directory (defaults to ~/.singularity, not enough disk quota there)
    export APPTAINER_CACHEDIR="${USER_STORAGE}/.singularity"
    mkdir -p ${APPTAINER_CACHEDIR}

    # set storage path for singularity-cenv (defaults to ~/.cenv, not enough disk quota there)
    export CENV_BASE_DIR="${USER_STORAGE}/.cenv"

    # expose singularity-cenv executable
    export PATH="${PATH}:$USER_STORAGE/software/container-env/bin"

    # mount extra filesystems
    # already in my mount point list (?)   
    # export CENV_APPTAINER_OPTS="$CENV_APPTAINER_OPTS --bind /mnt"

fi
