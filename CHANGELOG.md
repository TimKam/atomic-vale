## 1.8.0 - Fix linter level for suggestions
* [#16](https://github.com/TimKam/atomic-vale/pull/16): Fix: atomic-vale does not provide the necessary mapping from value's *suggestion* level to the Atom linter's *info* level.
## 1.7.0 - Fix exceptions when exceeding file length threshold
* [#11](https://github.com/TimKam/atomic-vale/issues/11): Fix: atomic-vale throws exception if the linted file exceeds a length of ~100 lines.
## 1.6.0 - Search for config file in current directory, then move up
* [#10](https://github.com/TimKam/atomic-vale/issues/10): Removes vale configuration file parameter. Instead, atomic vale supports vale's default behavior: vale starts looking for the config in the same directory as the file vale is currently linting. If not found, vale moves up the directory tree until it finds a configuration file. vale v0.4.1 looks maximally six levels up, before it falls back to the default configuration.
## 1.5.0 - Fall back to default vale config
* [#8](https://github.com/TimKam/atomic-vale/issues/8): Fix: throws exceptions if file starts with `--` (interprets text input as flag).
## 1.4.0 - Fall back to default vale config
* [#5](https://github.com/TimKam/atomic-vale/issues/5): Fall back to default vale config if no vale configuration file provided
## 1.3.0 - Fix column index
* [#4](https://github.com/TimKam/atomic-vale/issues/4): Fix: column index off by one
## 1.2.0 - Customizable grammar scope list
* [#3](https://github.com/TimKam/atomic-vale/issues/3): Customizable grammar scope list
## 1.1.0 - On-the-fly linting
* [#1](https://github.com/TimKam/atomic-vale/issues/1): Support on-the-fly linting
## 1.0.0 - First Release
* Release atomic vale, a vale linter plugin for Atom :-)
