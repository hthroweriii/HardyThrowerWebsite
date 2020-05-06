#!/bin/bash

if [ "$0" = "" ]; then
	cHash=$0
	git log $cHash -1 --format=format:"DEPLOYING: %s %b %H"
else
	cHash=$(git log -1 --format=format:"%H")
	git log -1 --format=format:"DEPLOYING: %s %b %H"
fi

aws deploy create-deployment --application-name HardyWebsite --deployment-config-name CodeDeployDefault.OneAtATime --deployment-group-name HardyWebsite_DepGroup --github-location commitId="$cHash",repository="hthroweriii/HardyThrowerWebsite"

