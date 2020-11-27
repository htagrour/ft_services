<?php

$cfg['blowfish_secret'] = 'RwR5BzHXQHvtWwsVivdBWqcup8tt9A+wI7YrUKxEa9A=';

/**
 * Only one server
 */
$i = 1;

/* Authentication type */
$cfg['Servers'][$i]['auth_type'] = 'cookie';
/* Server parameters */
$cfg['Servers'][$i]['compress'] = false;
$cfg['Servers'][$i]['AllowNoPassword'] = true;

/**
 * Variable definition
 */
$cfg['Servers'][$i]['host'] = 'mysql-service';
$cfg['Servers'][$i]['port'] = '3306';
$cfg['Servers'][$i]['user'] = 'root';
$cfg['Servers'][$i]['password'] = '1234';

$cfg['UploadDir'] = '';
$cfg['SaveDir'] = '';
?>
