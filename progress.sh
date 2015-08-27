#!/bin/bash
DOCPATH=dissi
echo $(date -I),$(awk -f $DOCPATH/orga/worcount.awk $DOCPATH/dissi.org) >> $DOCPATH/orga/worcount.csv
