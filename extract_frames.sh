#!/bin/bash

SCRIPTPATH="$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )"
echo $SCRIPTPATH

cd $1

ROOTPATH=$SCRIPTPATH/$1

#video paths
VROCKPATH=$ROOTPATH/ROCK/VIDEO
VPAPERPATH=$ROOTPATH/PAPER/VIDEO
VSCISSORSPATH=$ROOTPATH/SCISSORS/VIDEO
VILLEGALPATH=$ROOTPATH/ILLEGAL/VIDEO

#data paths
DROCKPATH=$ROOTPATH/ROCK/DATA
DPAPERPATH=$ROOTPATH/PAPER/DATA
DSCISSORSPATH=$ROOTPATH/SCISSORS/DATA
DILLEGALPATH=$ROOTPATH/ILLEGAL/DATA

cd $DROCKPATH
ffmpeg -i $VROCKPATH/ROCK.mp4 -s 320x240 -vf fps=$2 ROCK%04d.jpg
cd $DPAPERPATH
ffmpeg -i $VPAPERPATH/PAPER.mp4 -s 320x240 -vf fps=$2 PAPER%04d.jpg
cd $DSCISSORSPATH
ffmpeg -i $VSCISSORSPATH/SCISSORS.mp4 -s 320x240 -vf fps=$2 SCISSORS%04d.jpg
cd $DILLEGALPATH
ffmpeg -i $VILLEGALPATH/ILLEGAL.mp4 -s 320x240 -vf fps=$2 ILLEGAL%04d.jpg

