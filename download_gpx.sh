#!/usr/bin/env bash

dropbox="https://www.dropbox.com/scl/fo/8z94chsvow2jdsiqp671y/AE_En7cxUwPiObSOGeiH8vk?rlkey=lti74t6t38wog9h9uo3v2wzqk&st=n17xps6h&dl=0"

if [[ ! -d track_data ]];then
  mkdir track_data
fi

if [[ ! -f  track_data/*.gpx ]];then
  wget -P track_data -O track_data/salidas_campo_gpx.zip $dropbox
else
  echo "El archivo ZIP ya se encuentra descargado"
fi

wget -P track_data -O track_data/salidas_campo_gpx.zip $dropbox

if [[ -f  track_data/salidas_campo_gpx.zip ]];then
  unzip track_data/salidas_campo_gpx.zip -d track_data/ 
  rm track_data/salidas_campo_gpx.zip 
else
  echo "El archivo ZIP ya se había descomprimido"
fi