# README

# user table

|カラム名|データ型|
| ----- | ------ |
|name|string|

# user table

|カラム名|データ型|
| ----- | ------ |
|title|string|
|content|string|

# label table

|カラム名|データ型|
| ----- | ------ |
|title|content|

# herokuへのデプロイ方法
1. heroku createでアプリを作成
2. heroku buildpacks:set heroku/ruby,heroku buildpacks:add --index 1 heroku/nodejsでbuildpackを追加
3. git push heroku step2:master でpush