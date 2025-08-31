# Backup
Very basic scripts to backup and restore my home

## Usage

### Edit what you want backup / restore file

Edit `src_dirs` variable at begin of `backup.sh` (`restore.sh`) file

### Backup

```shell
$ ./scripts/backup.sh /full/path/to/target/directory/without/trailing/slash
```

### Restore

```shell
$ ./scripts/restor.sh /full/path/from/target/directory/without/trailing/slash /full/path/to/restore/without/trailing/slash
```

## Todo

- [X] - Backup script
- [ ] - Restore script
- [ ] - Use Python ?
- [ ] - Use a config file to describe what you want to backup / restore.

