# Installation

## BUG (fixed)
The mysql container is bugged. When a user is created, deno cant access that user unless I first connect manually using mysql client. After a lot of searching I found that mariadb does not have this issue.

Make sure you have Docker installed and have the correct privilages to clone from the project git.

Make an empty directory which will be used to clone the git repos.

```bash
mkdir collectionApp
cd collectionApp
```

Clone the git directories.

```bash
git clone git@gitlab.ti.howest.be:ti/2024-2025/s5/project-iv/projecten/project-01/code/backend.git
git clone git@gitlab.ti.howest.be:ti/2024-2025/s5/project-iv/projecten/project-01/code/data.git
git clone git@gitlab.ti.howest.be:ti/2024-2025/s5/project-iv/projecten/project-01/code/frontend.git
git clone git@gitlab.ti.howest.be:ti/2024-2025/s5/project-iv/projecten/project-01/docker.git
```

## .ENV files
TODO

## Linux
```bash
cp -r ./docker/* .
docker compose up -d
```
## Windows
```PowerShell
Copy-Item -Path .\docker\* -Destination . -Recurse
docker compose up -d
```