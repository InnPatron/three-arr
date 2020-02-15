# Summary
Test render using [jestsam](https://github.com/InnPatron/jetsam)-generated bindings to three.js to render a rotating green cube.

## Building
Run `npm install` to install dependencies.

Requires anchor compiler commit 25f2c654d6884d460bd92260923db5e1108b8ebf (found at https://github.com/InnPatron/pyret-lang). The paths to the anchor compiler and the runtime can be changed within the Makefile.

`make run` should then build and run the project, opening up a new browser tab (default firefox).

## Running
Should see a rotating green cube on a black background.

`make server` allows one to connect repeatedly to the page. Note: need to restart server after each rebuild.
