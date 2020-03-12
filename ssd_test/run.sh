BLOCK_SIZE=$((1*4096))
TOTAL_SIZE=$((16*1024))

rm -rf /home/hanshukai/optane/*.io

for ((i=1; i<=2; i++))
do
for ((j=1; j<=1; j++))
do
# perf record ./tester $i 1 $BLOCK_SIZE $TOTAL_SIZE
./tester $i 2 1 $BLOCK_SIZE $TOTAL_SIZE
# mv perf.data $RESULT_PATH/$i_$j
sync && echo 3 > /proc/sys/vm/drop_caches
done
done