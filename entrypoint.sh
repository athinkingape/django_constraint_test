#!/bin/bash

set -x
service mysql start
/tmp/django_constraints/manage.py test constraint_test
