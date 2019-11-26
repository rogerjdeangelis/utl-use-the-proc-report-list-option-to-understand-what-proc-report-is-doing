Use the proc report list option to understand what proc report is doing                                            
                                                                                                                   
github                                                                                                             
https://tinyurl.com/w5hhblf                                                                                        
https://github.com/rogerjdeangelis/utl-use-the-proc-report-list-option-to-understand-what-proc-report-is-doing     
                                                                                                                   
This cost me about 20 minutes.                                                                                     
*                _     _                                                                                           
 _ __  _ __ ___ | |__ | | ___ _ __ ___                                                                             
| '_ \| '__/ _ \| '_ \| |/ _ \ '_ ` _ \                                                                            
| |_) | | | (_) | |_) | |  __/ | | | | |                                                                           
| .__/|_|  \___/|_.__/|_|\___|_| |_| |_|                                                                           
|_|                                                                                                                
;                                                                                                                  
Proc print will print the fist 10 obs, but proc report will not?                                                   
                                                                                                                   
data have;                                                                                                         
format dteVar date9.;                                                                                              
input dteVar date9.;                                                                                               
cards4;                                                                                                            
31DEC1599                                                                                                          
31DEC1599                                                                                                          
31DEC1599                                                                                                          
31DEC1599                                                                                                          
31DEC1599                                                                                                          
31DEC1599                                                                                                          
31DEC1599                                                                                                          
31DEC1599                                                                                                          
31DEC1599                                                                                                          
31DEC1599                                                                                                          
;;;;                                                                                                               
run;quit;                                                                                                          
                                                                                                                   
* This works;                                                                                                      
proc print data=have;                                                                                              
var  dteVar;                                                                                                       
run;quit;                                                                                                          
                                                                                                                   
        IMGRTN_                                                                                                    
       STUS_5YR_                                                                                                   
Obs    BAR_END_DT                                                                                                  
                                                                                                                   
  1    31DEC1599                                                                                                   
  2    31DEC1599                                                                                                   
  3    31DEC1599                                                                                                   
  4    31DEC1599                                                                                                   
  5    31DEC1599                                                                                                   
  6    31DEC1599                                                                                                   
  7    31DEC1599                                                                                                   
  8    31DEC1599                                                                                                   
  9    31DEC1599                                                                                                   
 10    31DEC1599                                                                                                   
                                                                                                                   
                                                                                                                   
* this does not;                                                                                                   
proc report data=hAVE nowd missing;                                                                                
col  dteVar;                                                                                                       
run;quit;                                                                                                          
                                                                                                                   
                                                                                                                   
  IMGRTN_ST                                                                                                        
  US_5YR_BA                                                                                                        
   R_END_DT                                                                                                        
  *********                                                                                                        
                                                                                                                   
No output                                                                                                          
                                                                                                                   
*          _       _   _                                                                                           
 ___  ___ | |_   _| |_(_) ___  _ __                                                                                
/ __|/ _ \| | | | | __| |/ _ \| '_ \                                                                               
\__ \ (_) | | |_| | |_| | (_) | | | |                                                                              
|___/\___/|_|\__,_|\__|_|\___/|_| |_|                                                                              
                                                                                                                   
;                                                                                                                  
                                                                                                                   
proc report data=hAVE nowd missing list;                                                                           
col  dteVar;                                                                                                       
run;quit;                                                                                                          
                                                                                                                   
In the log (you cannot sum dates?)                                                                                 
                                                                                                                   
PROC REPORT DATA=WORK.HAVE LS=171 PS=65  SPLIT="/" NOCENTER MISSING ;                                              
COLUMN  ( dteVar );                                                                                                
DEFINE  dteVar / SUM FORMAT= DATE9. WIDTH=9     SPACING=2   RIGHT  ;                                               
RUN;                                                                                                               
                                                                                                                   
*Change proc report;                                                                                               
                                                                                                                   
proc report data=hAVE nowd missing list;                                                                           
col  dteVar;                                                                                                       
define dteVar / diaplay;                                                                                           
run;quit;                                                                                                          
                                                                                                                   
   DTEVAR                                                                                                          
31DEC1599                                                                                                          
31DEC1599                                                                                                          
31DEC1599                                                                                                          
31DEC1599                                                                                                          
31DEC1599                                                                                                          
31DEC1599                                                                                                          
31DEC1599                                                                                                          
31DEC1599                                                                                                          
31DEC1599                                                                                                          
31DEC1599                                                                                                          
                                                                                                                   
* if you want the sum of dates;                                                                                    
                                                                                                                   
proc report data=hAVE nowd missing list;                                                                           
format dteVar 8.;                                                                                                  
col  dteVar;                                                                                                       
run;quit;                                                                                                          
                                                                                                                   
   DTEVAR                                                                                                          
 -1314880                                                                                                          
                                                                                                                   
                                                                                                                   
