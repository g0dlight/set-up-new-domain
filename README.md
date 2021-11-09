## use
sudo ./run.sh {domain} {number} [ssl]

## create free ssl
sudo certbot certonly --apache

## link ssl to domain folder
ln -s {path_from_certbot} ssl

## check config
sudo apachectl configtest

## reload apache with new config
sudo service apache2 reload