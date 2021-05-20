#!/bin/sh

ID=$1
ssh -p 29418 cixi.geng1@review.source.unisoc.com gerrit query --format=JSON --current-patch-set --commit-message --dependencies --files change:$ID
