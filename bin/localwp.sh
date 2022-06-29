#!/bin/bash

# Exit if any command fails.
set -e

# Update wp configs
wp config set JETPACK_DEV_DEBUG true
wp config set WPORG_SANDBOXED true
wp config set FEATURE_2021_GLOBAL_HEADER_FOOTER false

# Activate plugins
wp plugin activate edit-flow jetpack wordpress-importer wporg-learn/wporg-learn.php

# Activate theme
wp theme activate pub/wporg-learn-2020

# Install dependencies
yarn

# Activate jetpack modules
wp jetpack module activate contact-form

# Change permalinks
wp rewrite structure '/%postname%/'

# Import tables
wp db import .wp-env/wporg_events.sql
wp db import .wp-env/wporg_locales.sql
