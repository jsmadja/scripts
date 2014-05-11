#!/bin/bash


cat * | grep "dl-torrent" | cut -d'>' -f5 | cut -d'<' -f1 \
| sed s/DVDRIP//g | sed s/FRENCH//g | sed s/BluRay//g | sed s/1080p//g | sed s/720p//g | sed s/VOSTFR//g | sed s/x264//g | sed s/AC3//g \
| sed 's/[0-9]\{4\}//g' \
| sed s/DvdRip//g \
| sed s/DVDSCR//g \
| sed s/R5//g \
| sed s/TS//g \
| sed s/Dvdrip//g \
| sed s/TRUE//g \
| sed s/DvDrip//g \
| sed s/DVDrip//g \
| sed s/DVD//g \
| sed s/1CD//g \
| sed s/\ \ //g \
| sed s/^\ //g \
| sed s/French//g \
| sed s/BRRIP//g \
| sed s/BDRIP//g \
| sed s/BDrip//g \
| sed s/PROPER//g \
| sed s/LiMiTEDRiP//g \
| sed s/\ *$//g \
| sed s/CAM//g \
| sed s/VO//g \
| sed s/VF//g \
| sed s/RiP//g \
| sed s/dvdrip//g \
| sed s/Vf//g \
| sed s/XviD//g \
| sort | uniq
