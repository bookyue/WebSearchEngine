# The script fetches the result of the spark job from hdfs, stores the result in zipped form for uploading to git. 

if [ -f Project1_invertedOutput.zip ] 
then rm Project1_invertedOutput.zip
fi
if $($HADOOP_HOME/bin/hdfs dfs -test -d Project1/invertedIndexOutput/output)
then 
	$HADOOP_HOME/bin/hdfs dfs -get Project1/invertedIndexOutput/output
	mv output Project1_invertedOutput
	zip -r Project1_invertedOutput.zip Project1_invertedOutput
        rm -R Project1_invertedOutput
        echo "Successfully fetched and zipped the inverted index output."
	exit 0
else 
	echo "The given location Project1/invertedIndexOutput/output does not exist."
	exit 1
fi 



 




