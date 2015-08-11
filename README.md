# Recipe

Recipeはレシピ情報を出力するプログラムです。
Recipeが記録されたファイルを読み込み、整形して出力することができます。

## インストール

`git clone https://alpaca-tc/alpaca-tc-rcw`

## 実行

```
$ cd path/to/alpaca-tc-rcw
$ ./bin/recipe --path data/recipes.yml
```

## Help

```
$ ./bin/recipe --help
```

## レシピ情報

- ファイル形式: [yaml](http://magazine.rubyist.net/?0009-YAML)
- id, name, descriptionというキーを持つハッシュの配列が定義されている必要があります。

```
-
  id: 1
  name: 名前
  description: 説明
- 
  id: 2
  name: 名前
  description: 説明
- 
  id: 3
  name: 名前
  description: 説明
```
