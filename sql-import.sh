#!/bin/sh
PROJECT = "ecofleet"
SSH_USER = "user"

# Generate SQL dump
ssh $USER@arendus.fenomen.ee PROJECT=$PROJECT 'bash -s' <<ENDSSH
cd /var/www/arendus/${PROJECT}
drush sql-dump --result-file=~/${PROJECT}_dump.sql
ENDSSH
# Copy dump to local machine
scp mart@arendus.fenomen.ee:${PROJECT}_dump.sql ~/${PROJECT}_dump.sql
# Delete dump from dev
ssh $USER@arendus.fenomen.ee PROJECT=$PROJECT 'bash -s' <<ENDSSH
rm ~/${PROJECT}_dump.sql
ENDSSH