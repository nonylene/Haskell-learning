何度も失敗してる __haskell__ を今度こそ入門するぞ

# 一日目
特急の中で。

## 第一章
- ghci. 昔brewで入れた気がする。イントロ読んでなくてすみません。（その後読んだ。
- 確かに a++ みたいなことできないですね。
- 型推論！！！いいですね！！(java使い並みの感想
- 静的型付け言語！！いいですね「！！(Python使い並みの感想
- `True` であって true ではない
- `!`とかないし python っぽい
- `/=` は初めて見た

### 1.1
- 関数に括弧要らないの、便利そうだけど複雑だ。
  - `succ succ 9` みたいなのはエラーなのか
    - succ を succ で処理してる？
  - `succ 6 \`min\` 2 => 2
    - 7と2を比較してそう

### 1.2
- ghci補完が便利ですね
  - ghciに直接関数書いたら死ぬ？
- voidは存在しないという解釈でいいのかな（そんなことばっか考えてるから関数型できないという説
  - python の lambda で void したくて悩んだのを思い出した。
- returnとかいらないのperlっぽい（とにかくそういう考えを捨てろ
- よく考えたら `;` いらないんだね。良いと思うよ
- `hoge x = "poe" => "poe"`

### 1.3
- ghciも `let` で関数出来るじゃん。
- `[1,2] -- [1] => [1,2]`
- `'a' ++ "aa"` `"a" : "aa"` はエラー
- `[1,2,3] : 5` も無理
- `!!`で取り出しなのなぁ（というか`.get`とかないんすね（当然だけど）
- リストの中は全部同じ型。
  - 雑に出来ないのは面倒かもしれないけど推論的に仕方無さそう
- ケツコンマ出来ないのつらい…
- このモンスター幼少期にどこかで見たことある記憶がある
- 中置関数分かりにくい

### 1.4
- `['a'..'Z']`何も帰ってこなかったけどよく考えたら `['A'..'z']`か
- 遅延評価バンザイ！！
- 浮動小数点の時の挙動おもろしろい

### 1.5
- リスト内包表記じゃん！！！リスト内包表記大好き！！！！
- よく考えたら `if` のあとに `then` いるのね
- ２つのリストは全部の場合でやるのか
- リスト内包表記の`_`って慣習だったのか…
- なんで `even` みたいな謎関数あるんだろう。
- haskell: `[[x | x <- xs, even x] | xs <- [[1..10], [1,3..5]]]`
- python: `[[x for x in xs if x % 2 == 0] for xs in [list(range(1,10)), list(range(1,3,5))]]`

### 1.6
- さっき求めてたのはタプルだったらしい。そんなことないけど。
- タプルも型
- 例えば `[(1,2), ('a',"a")]` はエラー
- リストの処理とか見るに <T> 的なのありそう。
- ピタゴラスのやつはシュッとできたのでよかった。
