#!/bin/bash

# source original/deploy_dev_rules.sh
cd firestore_rules/prod
firebase deploy --only firestore:rules
cd ../..