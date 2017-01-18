#!/bin/bash

# start Jekyll and watch them
jekyll server --host=`hostname -I | cut -d' ' -f1` --watch