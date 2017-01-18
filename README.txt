---- Docker based Bitex ----

== Requirement ==
1. Docker with overlay driver setup.
2. This code
That's it!

== How to run ==
1. Build an image `./build.sh`
2. Run bitcoind `./bitcoind/run.sh`
3. Run nginx `./nginx/run.sh`
4. Run bitex `./run.sh`
5. Run frontend `./frontend/run.sh`