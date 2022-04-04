<h2 align="center">GitHub actions for metadata-tool</h2>
<p align="center">Make a QC report for metadata & sync all metadata to a database (e.g. MySQL/PostgreSQL/SQLite).</p>

<p align="center">Jingcheng Yang [yjcyxky@163.com]</p>

<p align="center">
<img src="https://github.com/yjcyxky/metadata-tool-action/workflows/.github/workflows/test.yml/badge.svg" alt="Build Status">
<img src="https://img.shields.io/github/license/yjcyxky/metadata-tool-action.svg" alt="License">
</p>

## Inputs

### `dataDir`
**Required** dataDir: A directory which contains metadata tables.

### `dbPasswd`
**Required** dbPasswd: Sync data to a database, so you need to provide the database's password.

### `authKey`
**Required** authKey: Metabase's username.

### `authValue`
**Required** authValue: Metabase's password.

### `dingtalkAccessToken`
**Required** dingtalkAccessToken: Send a notification to a dingtalk group.

### `dingtalkAccessSecret`
**Required** dingtalkAccessSecret: Send a notification to a dingtalk group.


## Outputs

### `command`
the final command.

## Example usage

```yaml
uses: yjcyxky/metadata-tool-action@master
with:
    dataDir: './data_dir'
    dbPasswd: ${{ secrets.DATABASE_Passwd }}
    authKey: ${{ secrets.METABASE_USERNAME }}
    authValue: ${{ secrets.METABASE_PASSWD }}
    dingtalkAccessToken: ${{ secrets.DINGTALK_ACCESS_TOKEN }}
    dingtalkAccessSecret: ${{ secrets.DINGTALK_ACCESS_SECRET }}
    testMode: 'true'
```
