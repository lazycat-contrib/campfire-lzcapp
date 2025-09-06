#!/bin/sh
mkdir -p /rails/storage/db /rails/storage/files
chown -R rails:rails /rails/storage
chown -R 1000:1000 /lzcapp/var/storage
chmod -R 755 /lzcapp/var/storage
if [ -f /rails/script/admin/create-vapid-key ];then
    echo "Creating VAPID key pair..."
    /rails/script/admin/create-vapid-key
    echo "VAPID key pair created,you can replace it with a new one"
else
    echo "script not found"
fi

bin/boot
