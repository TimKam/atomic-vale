# atomic-vale package
Atomic vale is a [vale](https://github.com/ValeLint/vale) plugin for Atom.

## Installation
1. [Install vale](https://github.com/ValeLint/vale#installation) for your
command line.
 **Note:** Atomic vale requires vale version **0.4.0** or higher.

2. Then, install `atomic-vale` via the
[Atom Settings View](http://flight-manual.atom.io/using-atom/sections/atom-packages/).

## Configuration
You manage your vale configuration in a
[`.vale` or `_vale` file](https://github.com/ValeLint/vale#vale-your-style-our-editor).

In the atomic vale configuration settings, you can specify the following
parameters:
* The paths to your vale installation
* The path to your vale configuration file
* Whether the linter runs *on the fly* after each edit or merely after saving
  the file
* A List of scopes for languages vale will lint
