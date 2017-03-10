<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'wordpressdb');

/** MySQL database username */
define('DB_USER', 'wordpressuser');

/** MySQL database password */
define('DB_PASSWORD', '${var.mysql_password}');

/** MySQL hostname */
define('DB_HOST', '${aws_db_instance.chambywp-db.endpoint}');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'uxBEWmWA.pDPBn)ckY8GABW69xLuEH68i[uyjG^).(k78keUTgkmKj3Dg29PZ[#;');
define('SECURE_AUTH_KEY',  '8JTs*n]8h}VGQTGVXRxf{&6n{xab9tAaY8x.kgXiK6zmH.22YZ9Z8Y+nhfPY*Lff');
define('LOGGED_IN_KEY',    '^89eNM2xmu/sZa8h$RoYpBbdtx7jh$PofM,y@JhGPAavxb}Kx+P28U63&{RQ7vsg');
define('NONCE_KEY',        'kCTq2X>mqU38Tte.g6ge^B3X3t6QfDEHZJn3gUUh?=>o%Wfn}nbX{gotaE6Rv8w@');
define('AUTH_SALT',        '6gpC)(7xXd3hX^ousB8c?oixd932kj>wsU^Fd2JDiNJ4ZWT/}Crte7@hsYe,KKQd');
define('SECURE_AUTH_SALT', 'eytH7Vx7K774,2vR+aDFyg2jYcD?J&jcvJpHAQru9]X4A+L=Rd;UZwA2c#ETMe/Y');
define('LOGGED_IN_SALT',   'Y)KVQxr96y438diPfH*R4#KzkEb2,tV#bu]2ev.vx?6,zgbPLBq4HLRUfgY&obJd');
define('NONCE_SALT',       '4&FPj%tJAYEU6VKC+j]nyqLbpDafGa2@V2k*9Vgr2zHG{jgNY3^)nMR97#AKtNE2');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
