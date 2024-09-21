# How to manage backups on Arch Linux

## Borg

### Initialize a new repository

`borg init --encryption=repokey "/path/to/repo"`

### List all backups of a specific repository

`borg list "path_to_repo_directory"`

### Extract a folder from a borg backup

`borg extract -v --list "repo_path"::backup_name folder_path`

### Delete a repository

`borg delete "/path/to/repo"`

## Backrest

...

