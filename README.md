# ProjectSetup
Repo for Project code setup automation script and cli tools
***

Bydefault repos will be created in `$HOME/company/Project/repos`, If already you have a project in repos update the paths into shell profile

For zsh users update path in zshrc like this

```sh
echo "export Project_REPOS_PATH=$HOME/company/Project/repos" >> ~/.zshrc
echo "export Project_SCRIPT_PATH=$Project_REPOS_PATH/ProjectSetup/scriptSupport" >> ~/.zshrc
```
Restart the terminal

### Installation
`git clone git@github.company.com:VHA/ProjectSetup.git && sh ./ProjectSetup/scriptSupport/setup`

will set up all the `Project` related repos and myProject `cli` tool

✨Magic ✨
You will be able to access `myProject` anywhere :shipit:


### Commends:

- [x] ***All the gcp related opertation requires gcp authorization, make sure you have valid login session (gcp session token valid for one hour)***;
- [x] ***Allowed argument formats are --param=value (or) param value***;


- **gcpLogin**: requires service name and environment as arguments, keeps them in _projectInfo.txt_ for further use
login session is valid for an hour
<br> &ensp; 
ex: `myProject gcpLogin --service=myProject-schedules-service --environment=stage` <br> &ensp; if you don't know the options
simply you can `myProject gcpLogin`


- **pullDBCertificates**: downloads DB related certificates and place them in the project path
<br> &ensp; 
ex: `myProject pullDBCertificates` use the project and env information from projectInfo.txt


- **pullPropertyFiles**: downloads property file based on environment and place them in the project path
  <br> &ensp;
ex: `myProject pullPropertyFiles` use the project and env information from projectInfo.txt


- **getProjectConfigurations**: combination of gcpLogin, pullDBCertificates, pullPropertyFiles. setup db client certificates and property files at the same time
<br> &ensp;
ex: `myProject getProjectConfigurations --service "myProject-schedules-service" --environment "stage"`<br> &ensp;
can be this as well `myProject getProjectConfigurations`


- **createNewSecret**: creates new user managed secret key and value in _us-central1,us-east4_ regions 
  <br> &ensp; 
ex: `myProject createSecret --secret-key=test-test --secret-value="wow-wow"` <br> &ensp;
if you have data-file location use
  `myProject createSecret --secret-key=test-test --data-file=\path\of\the\file.extension`


- **updateSecret**: updates secret with new version, secret-key should be there in the secret manager already
  <br> &ensp;
ex: `myProject updateSecret --secret-key=test-test --secret-value="wow-wow"` <br> &ensp;
if you have data-file location use
`myProject updateSecret --secret-key=test-test --data-file=\path\of\the\file.extension`

### Dev notes:
`cat /etc/shells` to know the available shells in your mac
`chsh shell/path` to change the shell ex: `chsh /bin/zsh`

If your script only uses POSIX-compliant shell features and does not require any Bash-specific features, then using `#!/usr/bin/env sh` is a good choice. 
This ensures that the script is executed using the system's default POSIX-compliant shell, which may be faster and more lightweight than Bash.

If your script requires Bash-specific features, such as arrays or advanced string manipulation, then you should use `#!/usr/bin/env bash`. 
This ensures that the script is executed using the Bash shell, which provides access to these features.

Using `#!/usr/bin/env` instead of a specific shell interpreter path like `/bin/bash or /bin/sh` has the advantage of allowing the script to be executed on systems where the path to the interpreter may be different. 
This can make your script more portable and easier to use across different systems.

By enabling the errexit `set -e` option, you can make your shell scripts more robust and fail-fast, ensuring that errors are caught and reported as soon as they occur.




    