#!/bin/bash

bucketprefix=$1

echo 'Emptying buckets...'
for bucket in $(aws s3 ls | awk '{print $3}' | grep $bucketprefix); do  ./delete_bucket_versions_files.sh "${bucket}" ; done 
echo 'Deleting buckets...' 
for bucket in $(aws s3 ls | awk '{print $3}' | grep $bucketprefix); do  aws s3 rm "s3://${bucket}" --recursive ; done
for bucket in $(aws s3 ls | awk '{print $3}' | grep $bucketprefix); do  aws s3 rb "s3://${bucket}" --force ; done
