#!/bin/sh
##@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#* elk-services.sh
#* Date : 03/05/2018
#* Author: 
#* Revision :	
#
##@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
##
#
# ELK Menu 

while true
do
	clear
	echo -e 
	echo -e "				*--------------+-----------------------------------------+---------------*\n"
	echo -e "				***********| Welcome to Securities Services - ELK PANEL(6.2.4) |************\n"
	echo -e "				*--------------+-----------------------------------------+---------------*\n"	
	echo -e "					\tEnter 1  To Know Status of ELK Services                	\n"
    echo -e "					\tEnter 2  To Start Logstash Service               			\n"
	echo -e "					\tEnter 3  To Start ElasticSearch Service			     	\n"      	
    echo -e "					\tEnter 4  To Start Kibana Service               			\n"
	echo -e "					\tEnter 5  To Stop Logstash Service			     			\n"      	
	echo -e "					\tEnter 6  To Stop ElasticSearch Service			     	\n"      	
	echo -e "					\tEnter 7  To Stop Kibana Service			     			\n"      	
	echo -e "					\tEnter 8  To List Indicies			     					\n"      	
	echo -e "					\tEnter 9  To Create Index			     					\n"      		
	echo -e "					\tEnter 10 To Delete Index			     					\n"      		
	echo -e "					\tEnter q  To quit											\n"
	echo -e "				*------------------------------------------------------------------------*\n"
	echo -e "				Enter your choice : \c"
	read Choice        
        if [[ $Choice = "1" ]]
        then
		#To  Know Status of ELK Services 
                 echo -e " Do you want to know status of ELK services (Y/N) : \c"
                 read yn
	         if [[ $yn = "y" || $yn = "Y" ]]
                 then  
					status=`ps -ef | grep logstash |grep -v grep | wc -l`
					 if [[ $status -gt 0 ]]
					 then  
						echo "Logstash Service is **Running**"
					 else
						echo "Logstash Service is ##Stopped##"
					 fi
					pid=/apps/tomcat/elk/ELK/elasticsearch-6.2.4/esearch.pid
					 if [[ -f $pid ]]
					 then  
						echo "Elasticsearch Service is **Running**"
					 else
						echo "Elasticsearch Service is ##Stopped##"
					 fi
					pid=$(cat /apps/tomcat/elk/ELK/kibana-6.2.4-linux-x86_64/kibana.pid);status=`ps -ef | grep -w $pid |grep -v grep|wc -l`
					 if [[ $status -gt 0 ]]
					 then  
						echo "Kibana Service is **Running**"
					 else
						echo "Kibana Service is ##Stopped##"
					 fi
			fi	 
		 echo
		 echo "Press return to continue"
		 read
	elif [[ $Choice = "2" ]]
	then
		#To  Start  logstash Service   
                 echo -e "	Do you want to start logstash service (Y/N) : \c"
                 read yn
	         if [[ $yn = "y" || $yn = "Y" ]]
                 then 
					echo -e " Do you have logstash configuration file path (Y/N) : \c"
					read xn
					if [[ $xn = "n" || $yn = "N" ]]
						then
							echo	        
							nohup /apps/tomcat/elk/ELK/logstash-6.2.4/bin/logstash &
						else
							echo -e " Please provide logstash configuration file name along with path : \c"
							read zn
							if [[ -f "$zn" ]]
								then
									nohup /apps/tomcat/elk/ELK/logstash-6.2.4/bin/logstash -f $zn &	
								else
									echo -e " Invalid configuration file ($zn) \n please provide valid file name along with path : \c"
							fi
					fi
             fi
		 echo
		 echo "Press return to continue"
		read
        elif [[ $Choice = "3" ]]
			then
			#To Start Elasticsearch service   
                 echo -e " Do You Want to Start Elasticsearch service (Y/N) : \c"
                 read yn
	        if [[ $yn = "y" || $yn = "Y" ]]
				then 
					echo	       
					nohup /apps/tomcat/elk/ELK/elasticsearch-6.2.4/bin/elasticsearch -p /apps/tomcat/elk/ELK/elasticsearch-6.2.4/esearch.pid &
			fi
			 
		echo "Press return to continue"
		read
        elif [[ $Choice = "4" ]]
			then
			#To Start Kibana service   
                 echo -e "	Do You Want to Start Kibana service (Y/N) : \c"
                 read yn
	        if [[ $yn = "y" || $yn = "Y" ]]
				then 
					echo	       
					nohup /apps/tomcat/elk/ELK/kibana-6.2.4-linux-x86_64/bin/kibana &
			fi
		echo "Press return to continue"
		read
        elif [[ $Choice = "5" ]]
			then
			#To Stop Logstash service   
                 echo -e "	Do You Want to Stop Logstash service (Y/N) : \c"
                 read yn
	        if [[ $yn = "y" || $yn = "Y" ]]
				then 
					echo	       
					kill -9 $(ps -ef | grep 'logstash'  | grep -v grep | awk '{print $2}')
 			fi
		echo "Press return to continue"
		read
        elif [[ $Choice = "6" ]]
			then
			#To Stop Logstash service   
                 echo -e "	Do You Want to Stop Elasticsearch service (Y/N) : \c"
                 read yn
	        if [[ $yn = "y" || $yn = "Y" ]]
				then 
					echo	       
					pidfile=/apps/tomcat/elk/ELK/elasticsearch-6.2.4/esearch.pid
					if [[ -f $pidfile ]] 
					then 
						pid=`cat $pidfile`
						kill -s TERM $pid
					else
						echo "Already Elasticsearch ##Stoppped##"
					fi
			fi
		echo "Press return to continue"
		read
        elif [[ $Choice = "7" ]]
			then
			#To Stop Logstash service   
                 echo -e " Do You Want to Stop Kibana service (Y/N) : \c"
                 read yn
	        if [[ $yn = "y" || $yn = "Y" ]]
				then 
					echo	       
					pid=$(cat /apps/tomcat/elk/ELK/kibana-6.2.4-linux-x86_64/kibana.pid);kill -s TERM $pid
			fi
		echo "Press return to continue"		
		read		
       elif [[ $Choice = "8" ]]
			then
			#To List Existing Indicies   
                 echo -e " Do You Want to list ELK Index  (Y/N) : \c"
                 read yn
	        if [[ $yn = "y" || $yn = "Y" ]]
				then 
					echo	       
					curl  -X GET "http://10.23.213.99:9201/_cat/indices?v" -H 'Content-Type: application/json'
			fi
		echo "Press return to continue"		
		read		
       elif [[ $Choice = "9" ]]
			then
			#To Stop Logstash service   
                 echo -e " Do You Want to create ELK Index  (Y/N) : \c"
                 read yn
	        if [[ $yn = "y" || $yn = "Y" ]]
				then 
					echo -e " Index Name  (Y/N) : \c"
					read sn
					if [[ -n $sn ]]
					then 
						echo	       
						curl -X PUT "http://10.23.213.99:9201/$sn" -H 'Content-Type: application/json' -d'
						{
							"settings" : {
								"number_of_shards" : 1
							},
							"mappings" : {
								"type1" : {
									"properties" : {
										"field1" : { "type" : "text" , "analyzer": "standard" }
									}
								}
							}
						}
						'		
					fi
			fi
		echo "Press return to continue"		
		read		
       elif [[ $Choice = "10" ]]
			then
			#To Delete Existing Index   
                 echo -e " Do You Want to delete ELK Index !!Remove along with Data!! (Y/N) : \c"
                 read yn
	        if [[ $yn = "y" || $yn = "Y" ]]
				then 
					echo -e " Provide ELK Index  Name : \c"
					read iName
					if [[ -n $iName ]]
						then 
							echo	       
							curl -X DELETE "http://10.23.213.99:9201/$iName" -H 'Content-Type: application/json'
						else
							echo "Please provide index name to delete"
					fi
			fi
		echo "Press return to continue"		
		read		
		elif [[ $Choice = "q" || $Choice = "Q" ]]
		then
			#Exit from Panel 
			clear      
			echo "	Thanks for using this Panel  . Goodbye...."
			exit 0
		else
			#Ask the user to enter the valid choice
			echo " 				Please enter the valid choice"
			echo
		echo " Press return to continue"
        read       
	fi
done
#End of Script elk-serives.sh
