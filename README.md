
CENV
====

Left for @oschulz ;)

Setting up the environment inside the container
---

Environment variables inside the container can be set up in a
container-specific way.
Just add a environment-setup-script into the cenv-directory of the specific
container and call it `env.sh`.  

Caveat: it appears, that at least some apptainer installations don't allow to
call other files from the environment file.
Thus, statements such as `source xyz.sh` are discouraged!

