<?php

$cfg['blowfish_secret'] = 'uXfa8FsrEIHUOelYP2II6jkPGzpGZpIxCdH3bX1l2mg=';

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
