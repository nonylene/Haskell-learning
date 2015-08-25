# 九日目

YAPC会場の三角形の中にいます

## 第6章

モジュール、まあ要するに import 的なものでしょ

- Hackage 聞いたことある

### 6.1

- 出たHoogle...!
  - とにかく便利だという噂を聞いた
- 一部だけのインポートとか `as` とか
  - モジュール名は大文字、関数は小文字からはじまる。

# 十日目

京都に18切符で帰る途中。

### 6.2
- ghci の`:e` というコマンドを偶然発見した
- いい感じにかけた。

```haskell
nonyIndexNum :: (Eq a) => [a] -> [a]-> Int
nonyIndexNum x y = length . filter (isPrefixOf x) $ tails y
```

```haskell
putStrLn $map (chr . (+1). ord)"わたしたちはここにいます"
=> "ゐだじだぢばごごぬぅみず
```

ゾンビ感出てきていいと思う.

- `foldl` 確かにリストとか処理したらオーバーフロー起こしそう
  - 起きなかった
  - けどまあ言いたいことはわかる。
- `sum` とか不安
- `foldl'` とは…
  - 隣の人からいつも `foldl'` を使えという電波を受け取った

- `foldr (+) 0 . map digitToInt $ show 569` ってやったけど `sum` でいいことに気づいた。

- 合計40のはじめの数は

```haskell
succ $ length . takeWhile (/=40) $ map  (sum . map digitToInt . show) [1..]
```

ともとめてて、`find` と比べたらリストいちいち作ってリソース食うかなあと言ってたら隣からそれは `length` がある時点で数だけ数えてるから大丈夫という音波を受け取った

### 6.3

- 連想リスト、javaだと `map` だからなあ
  - `java map` とかで調べると `HashMap` しか出てこないし
- `findKey`, `snd $ find (\x -> fst x == "a") [("a", 1)]` では無理だった
  - このコードを書いていたら浜名湖通りすぎて見れなかったので悲しい
- `Map` あるのか。
  - 順序比較が必要。
- `Map.fromListWith` 便利関数だ

### 6.4
- publicなものは先頭に書くけどprivateはそのままって感じか
- 階層したいならディレクトリで。

## 第七章

クラス！と思ったら型クラスだった

### 7.1
- `data` で取りうる値（コンストラクタ）を定義できる

### 7.2
- `:t Shape => <interactive>:1:1: Not in scope: data constructor \`Shape'`
  - まあ `Bool` もそうだし。
  - 型クラスでこういうことやってもそりゃ無理そう。
- その下の `area` で２つの型コンストラクタに関する処理を書いている
- `Circle` は値コンストラクタなので、`Circle -> Float` みたいにはできない
  - `Circle` は `Float -> Float -> Float -> Shape`
- `deriving` は `implements` 的なアレ?かと思ったけど勝手にやってくれるのか。便利
- 関数っぽいなあと思ったらやっぱり関数だった
- データ型もエクスポートできる
  - 関数のとこに型の名前をかく
  - 括弧をつけなければ、値コンストラクタはエクスポートされない
    - 隠蔽できる
    - がパターンマッチもできなくなる

## 感想
- まあモジュールは他の言語にもあるので難しくはなかった。
- 案外便利関数揃ってるなあと思った
- 値コンストラクタのあたりはモヤモヤしてたところなのでなるほど〜と言った感じ