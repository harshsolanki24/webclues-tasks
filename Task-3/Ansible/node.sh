#!/bin/bash
cd /var/www/node-app
npm install
pm2 start index.js --name my-app
# pm2 restart my-app