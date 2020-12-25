#!/usr/bin/env bash

# linbo_cmd upload 10.0.0.1 linbo pw123 /dev/sda4 opensuse-cpqmini.cloop
upload()
{
    local server="$1"
    local luser="$2"
    local lpassword="$3"
    local cachedev="$4"
    local imagefile="$5"
    if [[ "${server}" != "10.0.0.1" ]] \
      || [[ "${luser}" != "linbo" ]] \
      || [[ "${lpassword}" != "Muster!" ]] \
      || [[ "${cachedev}" != "/dev/sda4" ]] \
      || [[ "${imagefile}" != "opensuse-cpqmini.cloop" ]]; then
        echo "Wrong parameters: «$*»"
        return 1
    fi

# echo-Befehle des logs
echo 'Befehl      : upload_cloop'
echo 'Parameter    : 1'
echo '10.0.0.1'
echo 'Lade opensuse-cpqmini.cloop zu 10.0.0.1 hoch ...'
echo '/dev/sda4'
echo 'Mounte Cache-Partition /dev/sda4 ...'
echo 'Lade opensuse-cpqmini.cloop opensuse-cpqmini.cloop.info opensuse-cpqmini.cloop.postsync opensuse-cpqmini.cloop.desc opensuse-cpqmini.cloop.torrent auf 10.0.0.1 hoch ...'
echo 'sending incremental file list'
echo 'opensuse-cpqmini.cloop'
echo '    501,710,848   8%    8.79MB/s    0:09:52  '
sleep 0.05
echo '    513,474,560   8%   10.92MB/s    0:07:55  '
sleep 0.05
echo '    525,238,272   9%   11.22MB/s    0:07:41  '
sleep 0.05
echo '    537,001,984   9%   11.22MB/s    0:07:40  '
sleep 0.05
echo '    548,765,696   9%   11.22MB/s    0:07:39  '
sleep 0.05
echo '    560,529,408   9%   11.22MB/s    0:07:38  '
sleep 0.05
echo '    572,260,352   9%   11.21MB/s    0:07:37  '
sleep 0.05
echo '    584,024,064  10%   11.21MB/s    0:07:36  '
sleep 0.05
echo '    595,755,008  10%   11.20MB/s    0:07:36  '
sleep 0.05
echo '    607,518,720  10%   11.20MB/s    0:07:35  '
sleep 0.05
echo '    619,249,664  10%   11.20MB/s    0:07:34  '
sleep 0.05
echo '    631,013,376  10%   11.21MB/s    0:07:33  '
sleep 0.05
echo '    642,777,088  11%   11.21MB/s    0:07:31  '
sleep 0.05
echo '    654,540,800  11%   11.21MB/s    0:07:30  '
sleep 0.05
echo '    666,304,512  11%   11.22MB/s    0:07:29  '
sleep 0.05
echo '    677,871,616  11%   11.17MB/s    0:07:30  '
sleep 0.05
echo '    689,635,328  11%   11.17MB/s    0:07:29  '
sleep 0.05
echo '    701,399,040  12%   11.17MB/s    0:07:28  '
sleep 0.05
echo '    713,162,752  12%   11.17MB/s    0:07:27  '
sleep 0.05
echo '    724,926,464  12%   11.22MB/s    0:07:24  '
sleep 0.05
echo '    736,690,176  12%   11.22MB/s    0:07:23  '
sleep 0.05
echo '    748,453,888  12%   11.22MB/s    0:07:22  '
sleep 0.05
echo '    760,217,600  13%   11.22MB/s    0:07:21  '
sleep 0.05
echo '    771,981,312  13%   11.22MB/s    0:07:20  '
sleep 0.05
echo '    783,745,024  13%   11.22MB/s    0:07:19  '
sleep 0.05
echo '    795,475,968  13%   11.21MB/s    0:07:18  '
sleep 0.05
echo '    807,239,680  13%   11.21MB/s    0:07:17  '
sleep 0.05
echo '    819,003,392  14%   11.21MB/s    0:07:16  '
sleep 0.05
echo '    830,570,496  14%   11.16MB/s    0:07:17  '
sleep 0.05
echo '    839,548,928  14%   10.45MB/s    0:07:46  '
sleep 0.05
echo '    846,299,136  14%    9.26MB/s    0:08:45  '
sleep 0.05
echo '    858,062,848  14%    9.26MB/s    0:08:44  '
sleep 0.05
echo '    869,826,560  14%    9.31MB/s    0:08:40  '
sleep 0.05
echo '    881,590,272  15%   10.02MB/s    0:08:02  '
sleep 0.05
echo '    893,353,984  15%   11.22MB/s    0:07:09  '
sleep 0.05
echo '    905,117,696  15%   11.22MB/s    0:07:08  '
sleep 0.05
echo '    916,881,408  15%   11.22MB/s    0:07:07  '
sleep 0.05
echo '    928,645,120  15%   11.22MB/s    0:07:06  '
sleep 0.05
echo '    940,408,832  16%   11.22MB/s    0:07:05  '
sleep 0.05
echo '    952,172,544  16%   11.22MB/s    0:07:04  '
sleep 0.05
echo '    963,936,256  16%   11.22MB/s    0:07:03  '
sleep 0.05
echo '    975,699,968  16%   11.22MB/s    0:07:02  '
sleep 0.05
echo '    987,463,680  16%   11.22MB/s    0:07:01  '
sleep 0.05
echo '    999,227,392  17%   11.22MB/s    0:07:00  '
sleep 0.05
echo '  1,010,991,104  17%   11.22MB/s    0:06:59  '
sleep 0.05
echo '  1,022,754,816  17%   11.22MB/s    0:06:58  '
sleep 0.05
echo '  1,034,518,528  17%   11.22MB/s    0:06:57  '
sleep 0.05
echo '  1,046,282,240  17%   11.22MB/s    0:06:56  '
sleep 0.05
echo '  1,058,045,952  18%   11.22MB/s    0:06:55  '
sleep 0.05
echo '  1,069,776,896  18%   11.21MB/s    0:06:54  '
sleep 0.05
echo '  1,081,540,608  18%   11.21MB/s    0:06:53  '
sleep 0.05
echo '  1,093,304,320  18%   11.21MB/s    0:06:52  '
sleep 0.05
echo '  1,105,068,032  18%   11.21MB/s    0:06:51  '
sleep 0.05
echo '  1,116,831,744  19%   11.22MB/s    0:06:50  '
sleep 0.05
echo '  1,128,595,456  19%   11.22MB/s    0:06:49  '
sleep 0.05
echo '  1,140,359,168  19%   11.22MB/s    0:06:48  '
sleep 0.05
echo '  1,152,122,880  19%   11.22MB/s    0:06:47  '
sleep 0.05
echo '  1,163,886,592  19%   11.22MB/s    0:06:46  '
sleep 0.05
echo '  1,175,650,304  20%   11.22MB/s    0:06:45  '
sleep 0.05
echo '  1,187,414,016  20%   11.22MB/s    0:06:44  '
sleep 0.05
echo '  1,199,177,728  20%   11.22MB/s    0:06:43  '
sleep 0.05
echo '  1,210,941,440  20%   11.22MB/s    0:06:42  '
sleep 0.05
echo '  1,222,705,152  20%   11.22MB/s    0:06:40  '
sleep 0.05
echo '  1,234,468,864  21%   11.22MB/s    0:06:39  '
sleep 0.05
echo '  1,242,955,776  21%   10.44MB/s    0:07:08  '
sleep 0.05
echo '  1,254,490,112  21%   10.35MB/s    0:07:11  '
sleep 0.05
echo '  1,260,748,800  21%    9.05MB/s    0:08:13  '
sleep 0.05
echo '  1,272,512,512  21%    9.05MB/s    0:08:11  '
sleep 0.05
echo '  1,284,276,224  22%    9.82MB/s    0:07:31  '
sleep 0.05
echo '  1,296,039,936  22%    9.91MB/s    0:07:26  '
sleep 0.05
echo '  1,307,803,648  22%   11.22MB/s    0:06:33  '
sleep 0.05
echo '  1,319,567,360  22%   11.22MB/s    0:06:32  '
sleep 0.05
echo '  1,331,331,072  22%   11.22MB/s    0:06:31  '
sleep 0.05
echo '  1,343,094,784  23%   11.22MB/s    0:06:30  '
sleep 0.05
echo '  1,354,858,496  23%   11.22MB/s    0:06:29  '
sleep 0.05
echo '  1,366,622,208  23%   11.22MB/s    0:06:28  '
sleep 0.05
echo '  1,378,353,152  23%   11.21MB/s    0:06:27  '
sleep 0.05
echo '  1,390,116,864  23%   11.21MB/s    0:06:26  '
sleep 0.05
echo '  1,401,880,576  24%   11.21MB/s    0:06:25  '
sleep 0.05
echo '  1,413,644,288  24%   11.21MB/s    0:06:24  '
sleep 0.05
echo '  1,425,408,000  24%   11.22MB/s    0:06:23  '
sleep 0.05
echo '  1,437,171,712  24%   11.22MB/s    0:06:22  '
sleep 0.05
echo '  1,448,935,424  24%   11.22MB/s    0:06:21  '
sleep 0.05
echo '  1,460,699,136  25%   11.22MB/s    0:06:20  '
sleep 0.05
echo '  1,472,462,848  25%   11.22MB/s    0:06:19  '
sleep 0.05
echo '  1,484,226,560  25%   11.22MB/s    0:06:18  '
sleep 0.05
echo '  1,495,990,272  25%   11.22MB/s    0:06:17  '
sleep 0.05
echo '  1,507,753,984  25%   11.22MB/s    0:06:16  '
sleep 0.05
echo '  1,519,484,928  26%   11.21MB/s    0:06:15  '
sleep 0.05
echo '  1,531,248,640  26%   11.21MB/s    0:06:14  '
sleep 0.05
echo '  1,543,012,352  26%   11.21MB/s    0:06:13  '
sleep 0.05
echo '  1,554,776,064  26%   11.21MB/s    0:06:12  '
sleep 0.05
echo '  1,566,539,776  26%   11.22MB/s    0:06:11  '
sleep 0.05
echo '  1,578,303,488  27%   11.22MB/s    0:06:09  '
sleep 0.05
echo '  1,590,067,200  27%   11.22MB/s    0:06:09  '
sleep 0.05
echo '  1,601,830,912  27%   11.22MB/s    0:06:07  '
sleep 0.05
echo '  1,613,594,624  27%   11.22MB/s    0:06:06  '
sleep 0.05
echo '  1,625,358,336  27%   11.22MB/s    0:06:05  '
sleep 0.05
echo '  1,636,794,368  28%   11.13MB/s    0:06:07  '
sleep 0.05
echo '  1,645,248,512  28%   10.35MB/s    0:06:34  '
sleep 0.05
echo '  1,657,012,224  28%   10.34MB/s    0:06:33  '
sleep 0.05
echo '  1,668,775,936  28%   10.34MB/s    0:06:32  '
sleep 0.05
echo '  1,680,539,648  28%   10.43MB/s    0:06:28  '
sleep 0.05
echo '  1,692,303,360  29%   11.22MB/s    0:06:00  '
sleep 0.05
echo '  1,704,067,072  29%   11.22MB/s    0:05:59  '
sleep 0.05
echo '  1,715,830,784  29%   11.22MB/s    0:05:58  '
sleep 0.05
echo '  1,727,594,496  29%   11.22MB/s    0:05:57  '
sleep 0.05
echo '  1,739,358,208  29%   11.22MB/s    0:05:56  '
sleep 0.05
echo '  1,751,121,920  30%   11.22MB/s    0:05:54  '
sleep 0.05
echo '  1,762,885,632  30%   11.22MB/s    0:05:53  '
sleep 0.05
echo '  1,774,649,344  30%   11.22MB/s    0:05:52  '
sleep 0.05
echo '  1,786,413,056  30%   11.22MB/s    0:05:51  '
sleep 0.05
echo '  1,798,176,768  30%   11.22MB/s    0:05:50  '
sleep 0.05
echo '  1,809,940,480  31%   11.22MB/s    0:05:49  '
sleep 0.05
echo '  1,821,704,192  31%   11.22MB/s    0:05:48  '
sleep 0.05
echo '  1,833,467,904  31%   11.22MB/s    0:05:47  '
sleep 0.05
echo '  1,845,231,616  31%   11.22MB/s    0:05:46  '
sleep 0.05
echo '  1,856,995,328  31%   11.22MB/s    0:05:45  '
sleep 0.05
echo '  1,868,759,040  32%   11.22MB/s    0:05:44  '
sleep 0.05
echo '  1,880,522,752  32%   11.22MB/s    0:05:43  '
sleep 0.05
echo '  1,892,286,464  32%   11.22MB/s    0:05:42  '
sleep 0.05
echo '  1,904,050,176  32%   11.22MB/s    0:05:41  '
sleep 0.05
echo '  1,915,813,888  32%   11.22MB/s    0:05:40  '
sleep 0.05
echo '  1,927,577,600  33%   11.22MB/s    0:05:39  '
sleep 0.05
echo '  1,939,341,312  33%   11.22MB/s    0:05:38  '
sleep 0.05
echo '  1,951,105,024  33%   11.22MB/s    0:05:37  '
sleep 0.05
echo '  1,962,868,736  33%   11.22MB/s    0:05:36  '
sleep 0.05
echo '  1,974,632,448  33%   11.22MB/s    0:05:35  '
sleep 0.05
echo '  1,986,396,160  34%   11.22MB/s    0:05:34  '
sleep 0.05
echo '  1,998,159,872  34%   11.22MB/s    0:05:33  '
sleep 0.05
echo '  2,009,923,584  34%   11.22MB/s    0:05:32  '
sleep 0.05
echo '  2,021,621,760  34%   11.20MB/s    0:05:31  '
sleep 0.05
echo '  2,031,681,536  34%   10.61MB/s    0:05:49  '
sleep 0.05
echo '  2,041,905,152  35%   10.25MB/s    0:06:00  '
sleep 0.05
echo '  2,053,668,864  35%   10.25MB/s    0:05:59  '
sleep 0.05
echo '  2,065,432,576  35%   10.27MB/s    0:05:57  '
sleep 0.05
echo '  2,077,196,288  35%   10.85MB/s    0:05:37  '
sleep 0.05
echo '  2,088,927,232  35%   11.21MB/s    0:05:25  '
sleep 0.05
echo '  2,100,690,944  36%   11.21MB/s    0:05:24  '
sleep 0.05
echo '  2,112,454,656  36%   11.21MB/s    0:05:23  '
sleep 0.05
echo '  2,124,218,368  36%   11.21MB/s    0:05:22  '
sleep 0.05
echo '  2,135,982,080  36%   11.22MB/s    0:05:21  '
sleep 0.05
echo '  2,147,745,792  36%   11.22MB/s    0:05:20  '
sleep 0.05
echo '  2,159,509,504  37%   11.22MB/s    0:05:19  '
sleep 0.05
echo '  2,171,273,216  37%   11.22MB/s    0:05:18  '
sleep 0.05
echo '  2,183,036,928  37%   11.22MB/s    0:05:17  '
sleep 0.05
echo '  2,194,800,640  37%   11.22MB/s    0:05:16  '
sleep 0.05
echo '  2,206,564,352  37%   11.22MB/s    0:05:15  '
sleep 0.05
echo '  2,218,328,064  38%   11.22MB/s    0:05:14  '
sleep 0.05
echo '  2,230,091,776  38%   11.22MB/s    0:05:13  '
sleep 0.05
echo '  2,241,855,488  38%   11.22MB/s    0:05:12  '
sleep 0.05
echo '  2,253,619,200  38%   11.22MB/s    0:05:11  '
sleep 0.05
echo '  2,265,382,912  38%   11.22MB/s    0:05:10  '
sleep 0.05
echo '  2,277,146,624  39%   11.22MB/s    0:05:09  '
sleep 0.05
echo '  2,288,910,336  39%   11.22MB/s    0:05:08  '
sleep 0.05
echo '  2,300,674,048  39%   11.22MB/s    0:05:07  '
sleep 0.05
echo '  2,312,437,760  39%   11.22MB/s    0:05:06  '
sleep 0.05
echo '  2,324,201,472  39%   11.22MB/s    0:05:05  '
sleep 0.05
echo '  2,335,965,184  40%   11.22MB/s    0:05:04  '
sleep 0.05
echo '  2,347,728,896  40%   11.22MB/s    0:05:03  '
sleep 0.05
echo '  2,359,492,608  40%   11.22MB/s    0:05:02  '
sleep 0.05
echo '  2,371,256,320  40%   11.22MB/s    0:05:01  '
sleep 0.05
echo '  2,382,987,264  40%   11.21MB/s    0:05:00  '
sleep 0.05
echo '  2,394,619,904  41%   11.13MB/s    0:05:01  '
sleep 0.05
echo '  2,401,665,024  41%   10.01MB/s    0:05:34  '
sleep 0.05
echo '  2,413,428,736  41%    9.94MB/s    0:05:35  '
sleep 0.05
echo '  2,425,257,984  41%    9.90MB/s    0:05:35  '
sleep 0.05
echo '  2,435,022,848  41%    9.51MB/s    0:05:48  '
sleep 0.05
echo '  2,446,786,560  41%   10.62MB/s    0:05:11  '
sleep 0.05
echo '  2,458,550,272  42%   10.69MB/s    0:05:07  '
sleep 0.05
echo '  2,470,313,984  42%   10.74MB/s    0:05:05  '
sleep 0.05
echo '  2,482,077,696  42%   11.22MB/s    0:04:51  '
sleep 0.05
echo '  2,493,841,408  42%   11.22MB/s    0:04:50  '
sleep 0.05
echo '  2,505,605,120  42%   11.22MB/s    0:04:49  '
sleep 0.05
echo '  2,517,368,832  43%   11.22MB/s    0:04:48  '
sleep 0.05
echo '  2,529,132,544  43%   11.22MB/s    0:04:47  '
sleep 0.05
echo '  2,540,896,256  43%   11.22MB/s    0:04:46  '
sleep 0.05
echo '  2,552,659,968  43%   11.22MB/s    0:04:45  '
sleep 0.05
echo '  2,564,423,680  43%   11.22MB/s    0:04:44  '
sleep 0.05
echo '  2,576,154,624  44%   11.21MB/s    0:04:43  '
sleep 0.05
echo '  2,587,885,568  44%   11.20MB/s    0:04:42  '
sleep 0.05
echo '  2,599,649,280  44%   11.20MB/s    0:04:41  '
sleep 0.05
echo '  2,611,412,992  44%   11.20MB/s    0:04:40  '
sleep 0.05
echo '  2,623,176,704  45%   11.21MB/s    0:04:39  '
sleep 0.05
echo '  2,634,940,416  45%   11.22MB/s    0:04:38  '
sleep 0.05
echo '  2,646,704,128  45%   11.22MB/s    0:04:37  '
sleep 0.05
echo '  2,658,467,840  45%   11.22MB/s    0:04:36  '
sleep 0.05
echo '  2,670,198,784  45%   11.21MB/s    0:04:35  '
sleep 0.05
echo '  2,681,962,496  46%   11.21MB/s    0:04:34  '
sleep 0.05
echo '  2,693,693,440  46%   11.21MB/s    0:04:33  '
sleep 0.05
echo '  2,705,457,152  46%   11.21MB/s    0:04:32  '
sleep 0.05
echo '  2,717,220,864  46%   11.21MB/s    0:04:31  '
sleep 0.05
echo '  2,728,984,576  46%   11.21MB/s    0:04:29  '
sleep 0.05
echo '  2,740,748,288  47%   11.22MB/s    0:04:28  '
sleep 0.05
echo '  2,752,512,000  47%   11.22MB/s    0:04:27  '
sleep 0.05
echo '  2,764,275,712  47%   11.22MB/s    0:04:26  '
sleep 0.05
echo '  2,776,039,424  47%   11.22MB/s    0:04:25  '
sleep 0.05
echo '  2,787,803,136  47%   11.22MB/s    0:04:24  '
sleep 0.05
echo '  2,799,370,240  48%   11.14MB/s    0:04:25  '
sleep 0.05
echo '  2,810,544,128  48%   10.81MB/s    0:04:32  '
sleep 0.05
echo '  2,819,850,240  48%   10.18MB/s    0:04:48  '
sleep 0.05
echo '  2,829,713,408  48%    9.73MB/s    0:05:00  '
sleep 0.05
echo '  2,841,477,120  48%    9.81MB/s    0:04:57  '
sleep 0.05
echo '  2,853,240,832  48%   10.12MB/s    0:04:47  '
sleep 0.05
echo '  2,865,004,544  49%   10.77MB/s    0:04:28  '
sleep 0.05
echo '  2,876,768,256  49%   11.22MB/s    0:04:17  '
sleep 0.05
echo '  2,888,531,968  49%   11.22MB/s    0:04:15  '
sleep 0.05
echo '  2,900,295,680  49%   11.22MB/s    0:04:14  '
sleep 0.05
echo '  2,912,059,392  49%   11.22MB/s    0:04:13  '
sleep 0.05
echo '  2,923,823,104  50%   11.22MB/s    0:04:12  '
sleep 0.05
echo '  2,935,586,816  50%   11.22MB/s    0:04:11  '
sleep 0.05
echo '  2,947,350,528  50%   11.22MB/s    0:04:10  '
sleep 0.05
echo '  2,959,114,240  50%   11.22MB/s    0:04:09  '
sleep 0.05
echo '  2,970,877,952  50%   11.22MB/s    0:04:08  '
sleep 0.05
echo '  2,982,641,664  51%   11.22MB/s    0:04:07  '
sleep 0.05
echo '  2,994,405,376  51%   11.22MB/s    0:04:06  '
sleep 0.05
echo '  3,006,169,088  51%   11.22MB/s    0:04:05  '
sleep 0.05
echo '  3,017,932,800  51%   11.22MB/s    0:04:04  '
sleep 0.05
echo '  3,029,696,512  51%   11.22MB/s    0:04:03  '
sleep 0.05
echo '  3,041,460,224  52%   11.22MB/s    0:04:02  '
sleep 0.05
echo '  3,053,223,936  52%   11.22MB/s    0:04:01  '
sleep 0.05
echo '  3,064,987,648  52%   11.22MB/s    0:04:00  '
sleep 0.05
echo '  3,076,751,360  52%   11.22MB/s    0:03:59  '
sleep 0.05
echo '  3,088,515,072  52%   11.22MB/s    0:03:58  '
sleep 0.05
echo '  3,100,278,784  53%   11.22MB/s    0:03:57  '
sleep 0.05
echo '  3,112,042,496  53%   11.22MB/s    0:03:56  '
sleep 0.05
echo '  3,123,806,208  53%   11.22MB/s    0:03:55  '
sleep 0.05
echo '  3,135,569,920  53%   11.22MB/s    0:03:54  '
sleep 0.05
echo '  3,147,333,632  53%   11.22MB/s    0:03:53  '
sleep 0.05
echo '  3,159,097,344  54%   11.22MB/s    0:03:52  '
sleep 0.05
echo '  3,170,861,056  54%   11.22MB/s    0:03:51  '
sleep 0.05
echo '  3,182,624,768  54%   11.22MB/s    0:03:50  '
sleep 0.05
echo '  3,194,388,480  54%   11.22MB/s    0:03:49  '
sleep 0.05
echo '  3,206,152,192  55%   11.22MB/s    0:03:48  '
sleep 0.05
echo '  3,217,162,240  55%   11.04MB/s    0:03:51  '
sleep 0.05
echo '  3,225,681,920  55%   10.23MB/s    0:04:08  '
sleep 0.05
echo '  3,236,986,880  55%   10.12MB/s    0:04:10  '
sleep 0.05
echo '  3,249,045,504  55%   10.19MB/s    0:04:07  '
sleep 0.05
echo '  3,260,809,216  55%   10.36MB/s    0:04:01  '
sleep 0.05
echo '  3,272,572,928  56%   11.18MB/s    0:03:43  '
sleep 0.05
echo '  3,284,336,640  56%   11.29MB/s    0:03:40  '
sleep 0.05
echo '  3,296,100,352  56%   11.22MB/s    0:03:40  '
sleep 0.05
echo '  3,307,864,064  56%   11.22MB/s    0:03:39  '
sleep 0.05
echo '  3,319,627,776  56%   11.22MB/s    0:03:38  '
sleep 0.05
echo '  3,331,391,488  57%   11.22MB/s    0:03:37  '
sleep 0.05
echo '  3,343,155,200  57%   11.22MB/s    0:03:36  '
sleep 0.05
echo '  3,354,918,912  57%   11.22MB/s    0:03:35  '
sleep 0.05
echo '  3,366,682,624  57%   11.22MB/s    0:03:34  '
sleep 0.05
echo '  3,378,446,336  57%   11.22MB/s    0:03:33  '
sleep 0.05
echo '  3,390,210,048  58%   11.22MB/s    0:03:32  '
sleep 0.05
echo '  3,401,973,760  58%   11.22MB/s    0:03:31  '
sleep 0.05
echo '  3,413,737,472  58%   11.22MB/s    0:03:30  '
sleep 0.05
echo '  3,425,501,184  58%   11.22MB/s    0:03:29  '
sleep 0.05
echo '  3,437,264,896  58%   11.22MB/s    0:03:28  '
sleep 0.05
echo '  3,449,028,608  59%   11.22MB/s    0:03:27  '
sleep 0.05
echo '  3,460,792,320  59%   11.22MB/s    0:03:26  '
sleep 0.05
echo '  3,472,556,032  59%   11.22MB/s    0:03:25  '
sleep 0.05
echo '  3,484,319,744  59%   11.22MB/s    0:03:24  '
sleep 0.05
echo '  3,496,050,688  59%   11.21MB/s    0:03:23  '
sleep 0.05
echo '  3,507,814,400  60%   11.21MB/s    0:03:22  '
sleep 0.05
echo '  3,519,578,112  60%   11.21MB/s    0:03:21  '
sleep 0.05
echo '  3,531,341,824  60%   11.21MB/s    0:03:20  '
sleep 0.05
echo '  3,543,105,536  60%   11.22MB/s    0:03:19  '
sleep 0.05
echo '  3,554,869,248  60%   11.22MB/s    0:03:17  '
sleep 0.05
echo '  3,566,632,960  61%   11.22MB/s    0:03:16  '
sleep 0.05
echo '  3,578,396,672  61%   11.22MB/s    0:03:15  '
sleep 0.05
echo '  3,590,160,384  61%   11.22MB/s    0:03:14  '
sleep 0.05
echo '  3,600,416,768  61%   10.82MB/s    0:03:21  '
sleep 0.05
echo '  3,610,902,528  61%   10.38MB/s    0:03:28  '
sleep 0.05
echo '  3,622,567,936  62%   10.31MB/s    0:03:29  '
sleep 0.05
echo '  3,634,692,096  62%   10.39MB/s    0:03:26  '
sleep 0.05
echo '  3,646,455,808  62%   10.77MB/s    0:03:17  '
sleep 0.05
echo '  3,658,186,752  62%   11.22MB/s    0:03:09  '
sleep 0.05
echo '  3,669,950,464  62%   11.30MB/s    0:03:06  '
sleep 0.05
echo '  3,681,714,176  63%   11.21MB/s    0:03:07  '
sleep 0.05
echo '  3,693,477,888  63%   11.21MB/s    0:03:05  '
sleep 0.05
echo '  3,705,241,600  63%   11.22MB/s    0:03:04  '
sleep 0.05
echo '  3,717,005,312  63%   11.22MB/s    0:03:03  '
sleep 0.05
echo '  3,728,769,024  63%   11.22MB/s    0:03:02  '
sleep 0.05
echo '  3,740,532,736  64%   11.22MB/s    0:03:01  '
sleep 0.05
echo '  3,752,296,448  64%   11.22MB/s    0:03:00  '
sleep 0.05
echo '  3,764,060,160  64%   11.22MB/s    0:02:59  '
sleep 0.05
echo '  3,775,823,872  64%   11.22MB/s    0:02:58  '
sleep 0.05
echo '  3,787,587,584  64%   11.22MB/s    0:02:57  '
sleep 0.05
echo '  3,799,351,296  65%   11.22MB/s    0:02:56  '
sleep 0.05
echo '  3,811,115,008  65%   11.22MB/s    0:02:55  '
sleep 0.05
echo '  3,822,878,720  65%   11.22MB/s    0:02:54  '
sleep 0.05
echo '  3,834,642,432  65%   11.22MB/s    0:02:53  '
sleep 0.05
echo '  3,846,406,144  65%   11.22MB/s    0:02:52  '
sleep 0.05
echo '  3,858,169,856  66%   11.22MB/s    0:02:51  '
sleep 0.05
echo '  3,869,933,568  66%   11.22MB/s    0:02:50  '
sleep 0.05
echo '  3,881,697,280  66%   11.22MB/s    0:02:49  '
sleep 0.05
echo '  3,893,460,992  66%   11.22MB/s    0:02:48  '
sleep 0.05
echo '  3,905,224,704  66%   11.22MB/s    0:02:47  '
sleep 0.05
echo '  3,916,988,416  67%   11.22MB/s    0:02:46  '
sleep 0.05
echo '  3,928,752,128  67%   11.22MB/s    0:02:45  '
sleep 0.05
echo '  3,940,515,840  67%   11.22MB/s    0:02:44  '
sleep 0.05
echo '  3,952,279,552  67%   11.22MB/s    0:02:43  '
sleep 0.05
echo '  3,964,043,264  68%   11.22MB/s    0:02:42  '
sleep 0.05
echo '  3,975,806,976  68%   11.22MB/s    0:02:41  '
sleep 0.05
echo '  3,986,161,664  68%   10.88MB/s    0:02:45  '
sleep 0.05
echo '  3,997,728,768  68%   10.80MB/s    0:02:45  '
sleep 0.05
echo '  4,006,936,576  68%   10.15MB/s    0:02:55  '
sleep 0.05
echo '  4,019,093,504  68%   10.24MB/s    0:02:52  '
sleep 0.05
echo '  4,030,857,216  69%   10.58MB/s    0:02:46  '
sleep 0.05
echo '  4,042,620,928  69%   10.66MB/s    0:02:43  '
sleep 0.05
echo '  4,054,384,640  69%   11.31MB/s    0:02:33  '
sleep 0.05
echo '  4,066,148,352  69%   11.22MB/s    0:02:33  '
sleep 0.05
echo '  4,077,912,064  69%   11.22MB/s    0:02:32  '
sleep 0.05
echo '  4,089,675,776  70%   11.22MB/s    0:02:31  '
sleep 0.05
echo '  4,101,439,488  70%   11.22MB/s    0:02:30  '
sleep 0.05
echo '  4,113,203,200  70%   11.22MB/s    0:02:29  '
sleep 0.05
echo '  4,124,966,912  70%   11.22MB/s    0:02:28  '
sleep 0.05
echo '  4,136,730,624  70%   11.22MB/s    0:02:27  '
sleep 0.05
echo '  4,148,494,336  71%   11.22MB/s    0:02:26  '
sleep 0.05
echo '  4,160,258,048  71%   11.22MB/s    0:02:25  '
sleep 0.05
echo '  4,172,021,760  71%   11.22MB/s    0:02:24  '
sleep 0.05
echo '  4,183,785,472  71%   11.22MB/s    0:02:23  '
sleep 0.05
echo '  4,195,516,416  71%   11.21MB/s    0:02:22  '
sleep 0.05
echo '  4,207,280,128  72%   11.21MB/s    0:02:21  '
sleep 0.05
echo '  4,219,043,840  72%   11.21MB/s    0:02:20  '
sleep 0.05
echo '  4,230,807,552  72%   11.21MB/s    0:02:19  '
sleep 0.05
echo '  4,242,571,264  72%   11.22MB/s    0:02:18  '
sleep 0.05
echo '  4,254,334,976  72%   11.22MB/s    0:02:17  '
sleep 0.05
echo '  4,261,675,008  73%   10.16MB/s    0:02:30  '
sleep 0.05
echo '  4,273,438,720  73%   10.16MB/s    0:02:29  '
sleep 0.05
echo '  4,285,202,432  73%   10.16MB/s    0:02:28  '
sleep 0.05
echo '  4,296,966,144  73%   10.16MB/s    0:02:27  '
sleep 0.05
echo '  4,308,729,856  73%   11.22MB/s    0:02:12  '
sleep 0.05
echo '  4,320,493,568  74%   11.22MB/s    0:02:11  '
sleep 0.05
echo '  4,332,257,280  74%   11.22MB/s    0:02:10  '
sleep 0.05
echo '  4,344,020,992  74%   11.22MB/s    0:02:09  '
sleep 0.05
echo '  4,355,784,704  74%   11.22MB/s    0:02:08  '
sleep 0.05
echo '  4,367,548,416  74%   11.22MB/s    0:02:07  '
sleep 0.05
echo '  4,379,148,288  75%   11.14MB/s    0:02:07  '
sleep 0.05
echo '  4,391,272,448  75%   11.22MB/s    0:02:05  '
sleep 0.05
echo '  4,403,036,160  75%   11.22MB/s    0:02:04  '
sleep 0.05
echo '  4,414,799,872  75%   11.22MB/s    0:02:03  '
sleep 0.05
echo '  4,426,563,584  75%   11.30MB/s    0:02:01  '
sleep 0.05
echo '  4,438,327,296  76%   11.22MB/s    0:02:01  '
sleep 0.05
echo '  4,450,091,008  76%   11.22MB/s    0:02:00  '
sleep 0.05
echo '  4,461,854,720  76%   11.22MB/s    0:01:59  '
sleep 0.05
echo '  4,473,618,432  76%   11.22MB/s    0:01:58  '
sleep 0.05
echo '  4,485,382,144  76%   11.22MB/s    0:01:56  '
sleep 0.05
echo '  4,497,145,856  77%   11.22MB/s    0:01:55  '
sleep 0.05
echo '  4,508,909,568  77%   11.22MB/s    0:01:54  '
sleep 0.05
echo '  4,520,673,280  77%   11.22MB/s    0:01:53  '
sleep 0.05
echo '  4,532,436,992  77%   11.22MB/s    0:01:52  '
sleep 0.05
echo '  4,544,200,704  77%   11.22MB/s    0:01:51  '
sleep 0.05
echo '  4,555,964,416  78%   11.22MB/s    0:01:50  '
sleep 0.05
echo '  4,567,728,128  78%   11.22MB/s    0:01:49  '
sleep 0.05
echo '  4,579,491,840  78%   11.22MB/s    0:01:48  '
sleep 0.05
echo '  4,591,255,552  78%   11.22MB/s    0:01:47  '
sleep 0.05
echo '  4,603,019,264  78%   11.22MB/s    0:01:46  '
sleep 0.05
echo '  4,614,782,976  79%   11.22MB/s    0:01:45  '
sleep 0.05
echo '  4,626,546,688  79%   11.22MB/s    0:01:44  '
sleep 0.05
echo '  4,638,310,400  79%   11.22MB/s    0:01:43  '
sleep 0.05
echo '  4,650,074,112  79%   11.22MB/s    0:01:42  '
sleep 0.05
echo '  4,661,837,824  79%   11.22MB/s    0:01:41  '
sleep 0.05
echo '  4,673,568,768  80%   11.21MB/s    0:01:40  '
sleep 0.05
echo '  4,685,332,480  80%   11.21MB/s    0:01:39  '
sleep 0.05
echo '  4,697,096,192  80%   11.21MB/s    0:01:38  '
sleep 0.05
echo '  4,708,597,760  80%   11.13MB/s    0:01:38  '
sleep 0.05
echo '  4,718,428,160  80%   10.68MB/s    0:01:41  '
sleep 0.05
echo '  4,730,191,872  81%   10.68MB/s    0:01:40  '
sleep 0.05
echo '  4,741,955,584  81%   10.68MB/s    0:01:39  '
sleep 0.05
echo '  4,753,719,296  81%   10.76MB/s    0:01:37  '
sleep 0.05
echo '  4,765,483,008  81%   11.22MB/s    0:01:32  '
sleep 0.05
echo '  4,777,246,720  81%   11.22MB/s    0:01:31  '
sleep 0.05
echo '  4,788,879,360  82%   11.11MB/s    0:01:31  '
sleep 0.05
echo '  4,800,282,624  82%   11.00MB/s    0:01:31  '
sleep 0.05
echo '  4,806,574,080  82%    9.71MB/s    0:01:42  '
sleep 0.05
echo '  4,818,337,792  82%    9.71MB/s    0:01:41  '
sleep 0.05
echo '  4,830,101,504  82%    9.81MB/s    0:01:39  '
sleep 0.05
echo '  4,841,865,216  83%    9.91MB/s    0:01:37  '
sleep 0.05
echo '  4,853,628,928  83%   11.22MB/s    0:01:24  '
sleep 0.05
echo '  4,865,392,640  83%   11.22MB/s    0:01:23  '
sleep 0.05
echo '  4,877,156,352  83%   11.22MB/s    0:01:22  '
sleep 0.05
echo '  4,888,920,064  83%   11.22MB/s    0:01:21  '
sleep 0.05
echo '  4,900,683,776  84%   11.22MB/s    0:01:20  '
sleep 0.05
echo '  4,912,447,488  84%   11.22MB/s    0:01:19  '
sleep 0.05
echo '  4,924,211,200  84%   11.22MB/s    0:01:18  '
sleep 0.05
echo '  4,935,974,912  84%   11.22MB/s    0:01:17  '
sleep 0.05
echo '  4,947,738,624  84%   11.22MB/s    0:01:16  '
sleep 0.05
echo '  4,959,502,336  85%   11.22MB/s    0:01:15  '
sleep 0.05
echo '  4,971,266,048  85%   11.22MB/s    0:01:14  '
sleep 0.05
echo '  4,983,029,760  85%   11.22MB/s    0:01:13  '
sleep 0.05
echo '  4,994,793,472  85%   11.22MB/s    0:01:12  '
sleep 0.05
echo '  5,006,557,184  85%   11.22MB/s    0:01:11  '
sleep 0.05
echo '  5,018,320,896  86%   11.22MB/s    0:01:10  '
sleep 0.05
echo '  5,030,084,608  86%   11.22MB/s    0:01:09  '
sleep 0.05
echo '  5,041,848,320  86%   11.22MB/s    0:01:08  '
sleep 0.05
echo '  5,053,612,032  86%   11.22MB/s    0:01:07  '
sleep 0.05
echo '  5,065,375,744  86%   11.22MB/s    0:01:06  '
sleep 0.05
echo '  5,077,139,456  87%   11.22MB/s    0:01:05  '
sleep 0.05
echo '  5,088,903,168  87%   11.22MB/s    0:01:04  '
sleep 0.05
echo '  5,100,666,880  87%   11.22MB/s    0:01:03  '
sleep 0.05
echo '  5,112,430,592  87%   11.22MB/s    0:01:02  '
sleep 0.05
echo '  5,124,194,304  87%   11.22MB/s    0:01:01  '
sleep 0.05
echo '  5,135,958,016  88%   11.22MB/s    0:01:00  '
sleep 0.05
echo '  5,147,721,728  88%   11.22MB/s    0:00:59  '
sleep 0.05
echo '  5,159,485,440  88%   11.22MB/s    0:00:58  '
sleep 0.05
echo '  5,171,052,544  88%   11.13MB/s    0:00:57  '
sleep 0.05
echo '  5,181,472,768  88%   10.82MB/s    0:00:58  '
sleep 0.05
echo '  5,193,236,480  89%   10.82MB/s    0:00:57  '
sleep 0.05
echo '  5,205,000,192  89%   10.82MB/s    0:00:56  '
sleep 0.05
echo '  5,216,763,904  89%   10.90MB/s    0:00:54  '
sleep 0.05
echo '  5,228,527,616  89%   11.22MB/s    0:00:52  '
sleep 0.05
echo '  5,240,291,328  89%   11.22MB/s    0:00:51  '
sleep 0.05
echo '  5,252,055,040  90%   11.22MB/s    0:00:50  '
sleep 0.05
echo '  5,263,818,752  90%   11.22MB/s    0:00:49  '
sleep 0.05
echo '  5,275,582,464  90%   11.22MB/s    0:00:48  '
sleep 0.05
echo '  5,287,346,176  90%   11.22MB/s    0:00:47  '
sleep 0.05
echo '  5,299,109,888  90%   11.22MB/s    0:00:46  '
sleep 0.05
echo '  5,310,873,600  91%   11.22MB/s    0:00:45  '
sleep 0.05
echo '  5,322,637,312  91%   11.22MB/s    0:00:44  '
sleep 0.05
echo '  5,334,401,024  91%   11.22MB/s    0:00:43  '
sleep 0.05
echo '  5,346,164,736  91%   11.22MB/s    0:00:42  '
sleep 0.05
echo '  5,357,928,448  91%   11.22MB/s    0:00:41  '
sleep 0.05
echo '  5,369,692,160  92%   11.22MB/s    0:00:40  '
sleep 0.05
echo '  5,381,455,872  92%   11.22MB/s    0:00:38  '
sleep 0.05
echo '  5,393,219,584  92%   11.22MB/s    0:00:37  '
sleep 0.05
echo '  5,404,983,296  92%   11.22MB/s    0:00:36  '
sleep 0.05
echo '  5,416,747,008  92%   11.22MB/s    0:00:35  '
sleep 0.05
echo '  5,428,510,720  93%   11.22MB/s    0:00:34  '
sleep 0.05
echo '  5,440,274,432  93%   11.22MB/s    0:00:33  '
sleep 0.05
echo '  5,452,038,144  93%   11.22MB/s    0:00:32  '
sleep 0.05
echo '  5,463,801,856  93%   11.22MB/s    0:00:31  '
sleep 0.05
echo '  5,475,565,568  93%   11.22MB/s    0:00:30  '
sleep 0.05
echo '  5,487,329,280  94%   11.22MB/s    0:00:29  '
sleep 0.05
echo '  5,499,092,992  94%   11.22MB/s    0:00:28  '
sleep 0.05
echo '  5,510,856,704  94%   11.22MB/s    0:00:27  '
sleep 0.05
echo '  5,522,620,416  94%   11.22MB/s    0:00:26  '
sleep 0.05
echo '  5,534,384,128  94%   11.22MB/s    0:00:25  '
sleep 0.05
echo '  5,545,984,000  95%   11.18MB/s    0:00:24  '
sleep 0.05
echo '  5,556,928,512  95%   10.74MB/s    0:00:24  '
sleep 0.05
echo '  5,567,119,360  95%   10.37MB/s    0:00:24  '
sleep 0.05
echo '  5,578,883,072  95%   10.37MB/s    0:00:23  '
sleep 0.05
echo '  5,590,646,784  95%   10.41MB/s    0:00:22  '
sleep 0.05
echo '  5,602,410,496  96%   10.84MB/s    0:00:20  '
sleep 0.05
echo '  5,614,174,208  96%   11.22MB/s    0:00:18  '
sleep 0.05
echo '  5,625,905,152  96%   11.21MB/s    0:00:17  '
sleep 0.05
echo '  5,637,668,864  96%   11.21MB/s    0:00:16  '
sleep 0.05
echo '  5,649,432,576  96%   11.21MB/s    0:00:15  '
sleep 0.05
echo '  5,661,196,288  97%   11.21MB/s    0:00:14  '
sleep 0.05
echo '  5,672,927,232  97%   11.21MB/s    0:00:13  '
sleep 0.05
echo '  5,684,690,944  97%   11.21MB/s    0:00:12  '
sleep 0.05
echo '  5,696,454,656  97%   11.21MB/s    0:00:11  '
sleep 0.05
echo '  5,708,218,368  97%   11.21MB/s    0:00:10  '
sleep 0.05
echo '  5,719,982,080  98%   11.22MB/s    0:00:09  '
sleep 0.05
echo '  5,731,745,792  98%   11.22MB/s    0:00:08  '
sleep 0.05
echo '  5,743,509,504  98%   11.22MB/s    0:00:07  '
sleep 0.05
echo '  5,755,273,216  98%   11.22MB/s    0:00:06  '
sleep 0.05
echo '  5,767,036,928  98%   11.22MB/s    0:00:05  '
sleep 0.05
echo '  5,778,800,640  99%   11.22MB/s    0:00:04  '
sleep 0.05
echo '  5,790,564,352  99%   11.22MB/s    0:00:03  '
sleep 0.05
echo '  5,802,328,064  99%   11.22MB/s    0:00:02  '
sleep 0.05
echo '  5,814,091,776  99%   11.22MB/s    0:00:01  '
sleep 0.05
echo '  5,825,855,488  99%   11.22MB/s    0:00:00  '
sleep 0.05
echo '  5,829,243,611 100%   11.03MB/s    0:08:23 (xfr#1, to-chk=0/1)'
sleep 0.05
echo 'sending incremental file list'
sleep 0.05
echo 'opensuse-cpqmini.cloop.info'
sleep 0.05
echo ''
sleep 0.05
echo '            151 100%    0.00kB/s    0:00:00  '
sleep 0.05
echo '            151 100%    0.00kB/s    0:00:00 (xfr#1, to-chk=0/1)'
sleep 0.05
echo 'sending incremental file list'
sleep 0.05
echo 'opensuse-cpqmini.cloop.postsync'
sleep 0.05
echo ''
sleep 0.05
echo '          3,135 100%    0.00kB/s    0:00:00  '
sleep 0.05
echo '          3,135 100%    0.00kB/s    0:00:00 (xfr#1, to-chk=0/1)'
sleep 0.05
echo 'sending incremental file list'
sleep 0.05
echo 'opensuse-cpqmini.cloop.desc'
sleep 0.05
echo ''
sleep 0.05
echo '            424 100%    0.00kB/s    0:00:00  '
sleep 0.05
echo '            424 100%    0.00kB/s    0:00:00 (xfr#1, to-chk=0/1)'
sleep 0.05
echo 'sending incremental file list'
sleep 0.05
echo 'opensuse-cpqmini.cloop.torrent'
sleep 0.05
echo ''
sleep 0.05
echo '         32,768   7%    0.00kB/s    0:00:00  '
sleep 0.05
echo '        444,952 100%   13.10MB/s    0:00:00 (xfr#1, to-chk=0/1)'
sleep 0.05
echo 'Starte Torrent-Dienst für opensuse-cpqmini.cloop.'
echo 'Upload von opensuse-cpqmini.cloop opensuse-cpqmini.cloop.info opensuse-cpqmini.cloop.postsync opensuse-cpqmini.cloop.desc opensuse-cpqmini.cloop.torrent nach 10.0.0.1 erfolgreich.'
echo 'Veranlasse Upload von image.log.'
echo 'Veranlasse Upload von linbo.log.'
echo 'Upload von opensuse-cpqmini.cloop opensuse-cpqmini.cloop.info opensuse-cpqmini.cloop.postsync opensuse-cpqmini.cloop.desc opensuse-cpqmini.cloop.torrent nach 10.0.0.1 erfolgreich.'
}
