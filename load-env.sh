if [[ -z ${USER_STORAGE} ]]; then
    echo "!!!"
    echo "!!! From $0:"
    echo "!!! ERROR: please set the USER_STORAGE env variable before sourcing the script, e.g."
    echo "!!!"
    echo "!!!   USER_STORAGE=/mnt/atlas01/users/<your-folder> source $0"
    echo "!!!"
else
    # set singularity cache directory (defaults to ~/.singularity, not enough disk quota there)
    export SINGULARITY_CACHEDIR="${USER_STORAGE}/.singularity"
    mkdir -p ${SINGULARITY_CACHEDIR}

    # set storage path for singularity-cenv (defaults to ~/.cenv, not enough disk quota there)
    export CENV_BASE_DIR="${USER_STORAGE}/.cenv"

    # expose singularity-cenv executable
    export PATH="${PATH}:/mnt/atlas01/projects/legend/sw/container-env/bin"

    # mount extra filesystems
    export CENV_SINGULARITY_OPTS="--bind /mnt"

    # other LEGEND-relevant variables
    export PRODENV="/data/atlas01/projects/legend/data/prodenv"
fi
