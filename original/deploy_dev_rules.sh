#!/bin/bash

# source original/deploy_dev_rules.sh
cd firestore_rules/dev
firebase deploy --only firestore:rules
cd ../..