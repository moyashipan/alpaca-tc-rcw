# Recipe

Recipeはレシピ情報を出力するプログラムです。
Recipeが記録されたファイルを読み込み、整形して出力することができます。

## インストール

`git clone https://alpaca-tc/alpaca-tc-rcw`

## 実行

```
$ cd path/to/alpaca-tc-rcw
$ ./bin/recipe --path data/recipes.yml
$ ./bin/recipe --path data/recipes.yml --id 1
```

## Help

```
$ ./bin/recipe --help
```

## レシピ情報

- ファイル形式: [yaml](http://magazine.rubyist.net/?0009-YAML)
- `recipes`, `users`というキーを持つハッシュの配列が定義されている必要があります。
- `recipes`, `users`はそれぞれ属性を定義した配列を持ちます。
- `recipes`の`user_id`は`users`の`id`に紐づくため、同じidをもつハッシュを`users`に定義する必要があります。

```
users:
  -
    id: 1
    user_name: alpaca-tc

recipes:
  -
    id: 1
    name: オムライス
    description: 卵を焼いてごはんにのせる
    user_id: 1
  -
    id: 2
    name: 親子丼
    description: 鶏肉を焼いて卵でとじてごはんにのせる
    user_id: 1
  -
    id: 3
    name: 杏仁豆腐
    description: 牛乳と砂糖をまぜてゼラチンで固める
    user_id: 1
```
