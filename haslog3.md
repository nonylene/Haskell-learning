# 三日目
次の電車が三十分後なので…

駅誰もいなくておもしろい。

## 第3章

構文。実用的っぽくなってきた

### 3.1
- パターンマッチ…聞いたことないですね
- なるほど〜ifみたいなものですね
  - if より楽そう
- 引数（なのか？）に大文字を入れるのダメなのか〜
  - 単純に巨大なifがなくなるのがよいですねというぐらいの気がしている
- 再帰関数だ！！！ムズイ！！！
  - pythonだと再帰の回数制限あるから結局forめいたもので済ませたりするんだよね
- タプルで直接変数にして受け取るのは便利そうだなあ
- `x:xs` でパターンになるのかぁ（聞いたことはある気がする
- 結局 `_` は予約語だった
- 関数で引数を `(x:_)` みたいにするのムズそう
- エラーは `error ""`
- `headD [x:_] = x` だとダメなのかーって思ったけどリスト全部同じ型じゃないとダメだからか
  - なのでタプル
- asパターンはすんなりわかった
  - `addHead xs@(x:_) = x:xs` 的な



