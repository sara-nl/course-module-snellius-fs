#!/bin/bash
#SBATCH -J ex1      # Job name
#SBATCH -p thin     # Specify your partition or queue name
#SBATCH -t 00:15:00 # Max runtime in format HH:MM:SS

module load 2022

gcc print-n.c -o print-n.out

# Array lenght <n> is calculated as 10**i
#  Use ibeg and iend to tune the range of i
#  Use nmax to limit the size of the output vector (10**10 results in 80 GB)
ibeg=6
iend=10
nmax=$(( 10**10 ))

wdir=$HOME

for (( i = $ibeg; i < $iend; ++i ))
do
    n=$(( 10**$i ))

    if (( $n > $nmax )); then
        data=$(( $n*8/1000000000 ))
        echo "You are attempting to print too much data ($data GB)"
        exit 1
    fi

    echo "printing $n elements"
    srun ./print-n $n $wdir/ex1.dat ascii
done
