---- Docker based Bitex ----

== Requirement ==
1. Docker with overlay driver setup.
2. This code
That's it!

== How to run ==
1. Build an image `./build.sh`
2. Run bitcoind `./bitcoind/run.sh`
2. Run nginx `./nginx/run.sh`
2. Run bitex `./run.sh`
2. Run frontend `./frontend/run.sh`