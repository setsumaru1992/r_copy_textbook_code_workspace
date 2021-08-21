library(readr)
library(lubridate)
library(hms)

ts_year <- ts(1:5, start = 2000, freq = 1)

seq(
  from = as.Date("2000-01-01"),
  to = as.Date("2000-01-12"),
  by = "days"
)

date_as_date <- as.Date("2001-01-01")
date_as_date + 70


# 日付、日時
date_ymd <- ymd("20210408")
datetime_ymdhms <- ymd_hms("20210408214916")
make_date(year = 2021, month = 4, day = 8)

year(date_ymd)
date_ymd %>% year()

datetime_ymdhms # "2021-04-08 21:49:16 UTC"
month(datetime_ymdhms) <- 10
datetime_ymdhms # "2021-10-08 21:49:16 UTC"

## 日時を扱えるPOSIXct。POSIXltもあるが、POSIXctが主流
as.POSIXct("2019-02-03 10:20:05")