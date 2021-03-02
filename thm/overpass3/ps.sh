   #! /bin/sh
   printf '%s\t\t\t%s\n' Local Remote
   sed '
     /: /!d;
     s/.*: //;
     s/ /-/;
     s/ .*//;
     s/[0-9A-F][0-9A-F]/0x& /g;
     s/ 0x//4;
     s/ 0x//7;
     s/://g;
     s/-//;
    ' /proc/net/tcp \
    |while read a b c d e g h i j k;do
     s=$(printf '%d.%d.%d.%d:%d %d.%d.%d.%d:%-22d\n' \
                 $d $c $b $a $e $j $i $h $g $k);
     l=${s%% *};r=${s#* };
     if test ${#s} -lt 45;then 
     printf '%s\t\t%s\n' $l $r;else
     printf '%s\t%s\n' $l $r;fi;
     done
