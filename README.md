# node-nvm-switcher
**node-nvm-switcher** is a simple shell script designed to ease the process of switching between different Node.js versions globally on your system. It leverages the Node Version Manager (`nvm`) and Node Package Manager (`npm`) to automatically install the specified Node version and associated NPM version globally.

**Prerequisites**
--
  * Node Version Manager (nvm)
  * Node Package Manager (npm)

**Installation**
--
  1. Clone the repo: ```git clone https://github.com/yourusername/node-nvm-switcher.git```
  2. Make the script executable (if necessary): ```chmod +x node-nvm-switcher.sh```
  3. Add to PATH, env vars, or use as-is

**Usage**
--
  Specify the desired version to switch to with `-v` or `--version`:
  
        ./node-nvm-switcher.sh -v <version>

  example:

        ./node-nvm-switcher.sh -v 21.7.1
