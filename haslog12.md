# 十二日目

isuconに出るのでSQLを学ばなきゃいけない。

### 7.7

- 書かれてるイラストめっちゃ安倍さんっぽい顔してる
- 再帰的な型の定義
  - リストとかそんなかんじそう
- `Cons` とは...と思ったけど自分で定義したものか
  - `(:)` は `a -> [a] -> [a]`
  - `Cons` は `a -> NonyList a -> NonyList a`
- 記号文字だけをつかって関数に名前をつけると自動的に中置になる
  - 値コンストラクタの名前はコロンで始まる
- 結合性宣言 `infix*`
  - 左結合か右結合か
    - `infixr`, `infixl`, `infix`
  - 結合順位を定める
    - 大きいほうが上
    - `*` は 7 だし `+` は6, `++` は5
  - いろいろ決まってるらしい。
    - http://walk.wgag.net/haskell/operator.html
  - 左右結合について https://ja.wikipedia.org/wiki/%E7%B5%90%E5%90%88%E6%B3%95%E5%89%87

- `++` を実装してみよう


はじめに書いたのは

```haskell
infixr ^++
(^++) :: NonyList a -> NonyList a -> NonyList a
x ^++ y = nfirst x ^++ nlast x y
        where nlast Empty y = y
              nlast (x:-:Empty) y = x:-: y
              nlast (x:-:xs) y = nlast xs y
              nfirst (Empty) = Empty
              nfirst (x:-:xs) = x :-: nfirst xs
```

そもそもパターンマッチできるかとおもったらできたのはよかったんだけど処理が終わらなくて悲しかった。

そこで手を加えて

```haskell
infixr ^++
(^++) :: NonyList a -> NonyList a -> NonyList a
Empty ^++ y = y
x ^++ y = nfirst x ^++ nlast x y
        where nlast Empty y = y
              nlast (x:-:Empty) y = x:-: y
              nlast (x:-:xs) y = nlast xs y
              nfirst (Empty) = Empty
              nfirst (x:-:Empty) = Empty
              nfirst (x:-:xs) = x :-: nfirst xs
```
とすればまあ動きはしたけどもうちょっと良い書き方がありそう。

そこからひらめいて

```haskell
infixr ^++
(^++) :: NonyList a -> NonyList a -> NonyList a
Empty ^++ y = y
(x:-:xs) ^++ y = x :-: xs ^++ y
```

とすればシュッと実装できてめでたかった。答え？もそんなかんじだった

パターンマッチ、便利。考えてみればこういう感じで使えるのは中置なので当然っぽかった。

- 二分探索木、あんまよくわかってないけど実装したらついでに理解できてお得そう
- とりあえず定義だけ見て書いてみたら全く同じだったので最高。ただこれだと

```
first.hs:182:1: Warning:
    Pattern match(es) are non-exhaustive
    In an equation for `treeInsert':
        Patterns not matched: _ (Node _ _ _)
```
というエラーが出てきて、なんだろうと思ったら `otherwise` を書いてないのが悪いらしい。ガードで `otherwise` 書かなかったら確かにコンパイラはどうすればいいんだって怒りそう。
  - http://stackoverflow.com/questions/10699532/why-is-ghc-complaining-about-non-exhaustive-patterns
- 逆に二分探索木から探すのもさくっとかけた

```haskell
foldr treeInsert EmptyTree [1,2,3,4]
```

と

```haskell
foldl (flip(treeInsert)) EmptyTree [1,2,3,4]
```

は値が違うんだなあ（しみじみ）

でも後者と
```haskell
foldl' (flip(treeInsert)) EmptyTree [1,2,3,4]
```

とは同じだった（そりゃそうだ。)

## 感想

- `foldl` 明らかによくなさそう。
- 標準ライブラリ関数の実装を学んでいく感じとても馴染みやすくてよい。自分が思ったこと次の節とかで解決されてることが多くて納得できる
