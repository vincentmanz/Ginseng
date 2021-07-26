#!/bin/bash

MAIN_DIR=/media/vincent/Data/panax/structure/0_analyses
INPUT=/media/vincent/Data/panax/structure/0_analyses/deepvariant.cohort_filtered.str
MAINP=/media/vincent/Data/panax/structure/0_analyses/mainparams
EXP=/media/vincent/Data/panax/structure/0_analyses/extraparams
REP=1

for i in {1..20}
do

(cd $MAIN_DIR
mkdir -p DV_MD_"$i"."$REP"
cd DV_MD_"$i"."$REP"
~/soft/structure_linux_console/structure -i $INPUT -o DV_MD_"$i"."$REP" -m $MAINP -e $EXP -K $i > run_"$i"."$REP".log) &

done;
