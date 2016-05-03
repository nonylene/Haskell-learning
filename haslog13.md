# 十三日目

忘れたのでまずここのログを読みなおした。メモ残すこと大事だなって思いました（（

Windows で Haskell しようかと思って Stack いれたけど cmd 使うこと考えると嫌になってすぐアンインストールしました((今は Arch Linux の VM でやってます ))。

### 7.9

- 型クラス懐かしい
  - 要するにjavaインターフェースみたいなもんでしょっていうjava変換おじさんになってる。
- 自動でやってくれるけど今回はちゃんとやってみますねっていう感じか
  - `Serializable` 的なhogehoge
- 循環的な定義もできるの良い

- 試しに `Show` を付けなかったらghci で `Red` だけするとエラーになった。これ前もやったかもしれない。

- サブクラスは制約っぽい
- `Maybe` は直接できないので二重にやるなるほど

- このへん Haskell 勝手にやってくれるの強いですね.


### 7.10

- `if` の中になんでも入れれるの便利で java 使ってると羨ましくなる。

##### 型クラス制約付きの引数を具体型によってパターンマッチングはできるのか？

```haskell
hoge :: (Num a) => a -> String
```

といった関数がある時、`Int` とそれ以外で挙動を変えたい場合はどうすればいいのか？と思って調べたメモ。

データ型の直和型や列挙型をパターンマッチングするのは簡単にできるのですが...

試しに

```haskell
hoge :: (Num a) => a -> String
hoge (x::Int) = "aaa"
hoge x = "hoge"
```

などと書くと `Perhaps you intended to use ScopedTypeVariables` と言われたのでそうしてみたけど関係なさそう。

しばらく考えたらこういう案件こそ型クラスを使うべきなんだなあと気付きました。

- 最悪っぽいの

http://stackoverflow.com/questions/4131552/haskell-check-if-integer-or-check-type-of-variable

にある二番目の解答。

```haskell
import Data.Typeable
isInteger :: (Typeable a) => a -> Bool
isInteger n = typeOf n == typeOf 1
```

最悪っぽい。

- `yesnoIf` が簡単に実装できるのは便利だなあという感じ。

### 7.10

- `instance Functor [] where` と書くことになるのは、`class Functor` が

```haskell
class Functor f where
   fmap :: (a -> b) -> f a -> f b
```

と宣言されていて、これによって `f` 自体は __具体型ではなく型コンストラクタになる__ ためである。


そのため、

```haskell
class NonyFunctor f where
    fmap :: (a -> b) -> f a -> f b

instance Functor Int where
```

として具体型を入れると

```
The first argument of ‘Functor’ should have kind ‘* -> *’,
  but ‘Int’ has kind ‘*’
In the instance declaration for ‘Functor Int’
```

と怒られることになる。

- `fmap` と `map` が同じなの、なるほどという感じ

- 要するに、`fmap` は型クラスの中にある値に直接関数をどうこうしたいときに使うものみたいな感じですね

- `Either a` は型コンストラクタ
  - こういうのを見ると左にエラー入れるってのもなるほど感ある
  - `Either` いみわからんとか言ってたけど `tuple` とはまた別の物ですね。片方しか入れられないし。

### 7.11

- `:k` 便利


`:k Num` とすると `Num :: * -> GHC.Prim.Constraint` となった。

これは型クラス制約のことで、 `Num a` は型クラス制約となることの現れ。

`:k Functor` は `Functor :: (* -> *) -> GHC.Prim.Constraint` となり、型コンストラクタから型クラス制約になるということ。

## 感想

- またまた久しぶりになってしまった...
- 型クラス制約と型コンストラクタがごちゃごちゃになってたので 7.11 読んでよかった。
  - 段々難しくなってきた気もするけどしばらくブランク空いたからかもしれない
