export CONDA_BACKUP_FC=$FC
export CONDA_BACKUP_FFLAGS=$FFLAGS
export CONDA_BACKUP_FORTRANFLAGS=$FORTRANFLAGS

export FORTRANFLAGS="$FORTRANFLAGS --sysroot=$CONDA_BUILD_SYSROOT"

export FC="flang-new"
export FFLAGS=$FORTRANFLAGS
