#!/bin/sh

echo "TMP_UID: $TMP_UID"
echo "TMP_GID: $TMP_GID"
echo "DEV_UID: $DEV_UID"
echo "DEV_GID: $DEV_GID"
echo "CMD: $@"

sed -ie "s/$TMP_GID/$DEV_GID/g" /etc/group
sed -ie "s/$TMP_UID/$DEV_UID/g" /etc/passwd

su-exec $TMP_USER "$@"
