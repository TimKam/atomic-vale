# atomic-vale package
Atomic vale is a [vale](https://github.com/ValeLint/vale) plugin for Atom.

## Installation
1. [Install vale](https://github.com/ValeLint/vale#installation) for your command line.
 **Note:** Atomic vale requires vale version **0.4.0** or higher.

2. Then, install `atomic-vale` via the [Atom Settings View](http://flight-manual.atom.io/using-atom/sections/atom-packages/).

## Configuration
You manage your vale configuration in a
[`.vale` or `_vale` file](https://github.com/ValeLint/vale#vale-your-style-our-editor).
vale starts looking for this file in the same directory as the file vale is currently linting. If not found, vale moves up the directory tree until it finds a configuration file. vale v0.4.1 looks maximally six levels up, before it falls back to the default configuration.

In the atomic vale configuration settings, you can specify the following parameters:
* The paths to your vale installation
* Whether the linter runs *on the fly* after each edit or merely after saving the file
* A List of scopes for languages vale will lint
