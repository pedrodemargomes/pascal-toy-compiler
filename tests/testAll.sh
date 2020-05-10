RDOC="testAllRes.txt"
echo "" > $RDOC
for i in *.pas
do
    echo "PROGRAM NAME: $i" >> $RDOC
    ./testProgram.sh $i >> $RDOC
    echo "=======" >> $RDOC
done

