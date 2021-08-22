公式がサンプルファイルを出していないため、他サイトが提供しているものを使用
http://www.cc.aoyama.ac.jp/~t41338/lecture/aoyama/stat2e/stat2e_top.html

* ベクトル
  * c(num, num, ...)
  * concatenate https://books.google.co.jp/books?id=6k5ADwAAQBAJ&pg=PA5&lpg=PA5&dq=r+ベクトル+c+略&source=bl&ots=Q5ZDZU7Z6-&sig=ACfU3U0g6_atW7E9Io1etWDvQQXWAkKieQ&hl=ja&sa=X&ved=2ahUKEwiujeHXtYTnAhXGw4sBHTGEDWoQ6AEwAnoECAQQAQ#v=onepage&q=r%20ベクトル%20c%20略&f=false
* 二乗
  * squared
* 平方根
  * square root
  * sqrt(num)
* 偏差
  * deviation
* 分散
  * variance
  * var(vector)
  * variance = function(vector){ sum((vector - mean(vector)) ^2) / length(vector)}
    * 偏差(vector - mean(vector))
    * 標本分散が上記式でできるもの
    * 不偏分散は「要素数」ではなく「要素数 - 1」で割る（var()で出るのはこちら）
* 標準偏差
  * standard_deviation
  * 分散の平方根
  * sd(vector)