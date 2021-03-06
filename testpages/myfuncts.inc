<?php 
 
 
  function tidy_input($instr)
   {
      // $str = iconv("utf-8", "utf-8//IGNORE", html_entity_decode($instr));
     // ini_set('mbstring.substitute_character', "none");
       $str = mb_convert_encoding( html_entity_decode($instr),"utf8","utf8");
       return $str;
   }


function find_file($p,$f)
{
    if(file_exists($p.$f) != 0) 
    {
        return $p;
    }
    else
    {
        $n=strrpos(substr($p,0,strlen($p)-1),'/');
        if ($n>0) return find_file(substr($p,0,$n+1),$f);
        else return null;
    }
}

function cleanup_text ($value = "", $preserve="", $allowed_tags="") 
{ 
	if (empty($preserve))  
	{  
		$value = strip_tags($value, $allowed_tags); 
	} 
	$value = htmlspecialchars($value); 
    $value=str_replace("'",'"',$value);
	return trim($value); 
} 


function decodeHTML($string) {
    $string = strtr($string, array_flip(get_html_translation_table(HTML_ENTITIES)));
    $string = preg_replace("/&#([0-9]+);/me", "chr('\\1')", $string);
    return $string;
}

 
function parse_string($str) 
{ 
  $tary=array(); 
  $ary=array(); 
  if(strlen($str)<1) return $ary; 
  $str = trim($str); 
  $tary = explode(";",$str); 
   foreach ($tary as $stritem) 
   { 
    if(strlen($stritem)>3) 
    { 
    $k=strpos($stritem,"="); 
    $para=trim(substr($stritem,0,$k)); 
    $val= trim(substr($stritem,$k+1)); 
    if ($para)  
    { 
       $ary[$para]=$val; 
    } 
    } 
   } 
  return $ary; 
} 
 
function parser($str,$sep='(!!)') 
{ 
    $tary=array(); 
    $ary=array(); 
    if(strlen($str)<1) return $ary; 
    $str = trim($str); 
    $tary=preg_split($sep,$str) ;
    reset ($tary);
    foreach ($tary as $stritem) 
    { 
        if(strlen($stritem)>0) 
        { 
            $k=strpos($stritem,"="); 
            $para=trim(substr($stritem,0,$k)); 
            $val= trim(substr($stritem,$k+1)); 
            if ($para)  
            { 
                $ary[$para]=$val; 
            } 
        } 
    } 
    return $ary; 
} 

function deparser($ary) 
{ 
   $sout=""; 
   foreach ($ary as $k=>$v) 
   { 
      $sout .= $k.'='.$v."!!"; 
   } 
   return $sout; 
}


function make_quoted_string_addslashes($ary) 
{ 
    $sout=""; 
    foreach ($ary as $aryitem) 
    { 
        $sout="'".addslashes($aryitem)."',"; 
    } 
    return substr($sout,0,strlen($sout)-1); 
} 


function make_quoted_string($ary) 
{ 
   $sout=""; 
   foreach ($ary as $aryitem) 
   { 
      $sout="'".$aryitem."',"; 
   } 
  return substr($sout,0,strlen($sout)-1); 
} 
 
function load_file($f)
{
    if(@file_exists($f) != 0) 
    {
        $thefilesize = @filesize($f);
        $filenum =@ fopen($f,"r");
        $filecontent =@ fread($filenum, $thefilesize+1);
        @fclose($filenum);
    }
    else $filecontent="error file does not exist : ".$f;
    return  $filecontent;
}



function print_text($pf,$outtext = "",$properties="") 
{ 
    if(!$pf) $pf="p"; 
    $tx =""; 
    if(is_array($outtext) and count($outtext)>1) 
    { 
      for ($l=0;$l<count($outtext);$l++) 
      { 
        $tx .= print_text($pf,$outtext[$l],$properties); 
      } 
    } 
    else 
    { 
       if(is_array($outtext)) $o=$outtext[0]; 
       else $o=$outtext; 
       $tx .= "<".$pf; 
       if ($properties <>"") $tx .= " ".$properties." "; 
       $tx .= ">$o</".$pf.">\n"; 
    } 
    return $tx; 
} 
 
function print_values ($arr)  
{   
    $tx =""; 
    while (list($k, $v) = each ($arr))  
    { 
        $tx .= $k."=".$v."<br>\n"; 
    } 
    return $tx; 
} 
 
 
function count_values ($str,$arr)  
{ 
    $n=0; 
    while (list($k, $v) = each ($arr))  
    { 
        if (substr_count($v,$str)>0) $n++; 
    } 
    return $n; 
} 
 
 
function heading1($outtext = "",$properties="") 
{ 
   if(!$properties) $properties=" align=center font-size=+2 "; 
   return print_text("h1",$outtext,$properties); 
} 
 
function heading2($outtext = "",$properties="") 
{ 
   if(!$properties) $properties=" align= center font-size=+1 "; 
   return print_text("h2",$outtext,$properties); 
} 
 
function heading3($outtext = "",$properties="") 
{ 
   if(!$properties) $properties=" align=center  "; 
   return print_text("h3",$outtext,$properties); 
} 
 
function heading4($outtext = "",$properties="") 
{ 
   if(!$properties) $properties=" align=center  "; 
   return print_text("h4",$outtext,$properties); 
} 
 
function pageheader($title="",$properties="") 
{ 
  $tx =""; 
  if(!$properties)$properties= " bgcolor= #ffffff "; 
  $tx .= '<html><head><title>'.$title.'</title><META HTTP-EQUIV="Content-Style-Type" CONTENT="text/css"></head><body '.$properties.'>'; 
  if($title) $tx .= heading1($title); 
  return $tx; 
} 
 
function start_page($title="",$properties="") 
{ 
    $tx =""; 
    if(!$properties)$properties= " bgcolor= #ffffff "; 
    $tx .= '<html><head><title>'.$title.'</title><META HTTP-EQUIV="Content-Style-Type" CONTENT="text/css"></head><body '.$properties.'>'; 
    if($title) $tx .= heading1($title); 
    return $tx; 
} 
 
 
function start_page_header($title) 
{ 
  return "<html><head>\n<title>".$title."</title>\n"; 
} 
 
function end_page_header($title='',$properties="") 
{ 
  $tx=""; 
  if(!$properties) $properties=" bgcolor=white "; 
  $tx .= '</head><body '.$properties.' >'."\n"; 
  if($title) $tx .= heading1($title); 
  return $tx; 
} 
 
function pagefooter() 
{ 
  return "</body></html>"; 
} 


 
function end_page() 
{ 
  return "</body></html>"; 
} 
 
function end_frameset() 
{ 
    return "</frameset>"; 
} 


function div($outtext = "",$properties="") 
{ 
   return print_text("div",$outtext,$properties); 
} 

function start_div($properties="") 
{ 
   if ($properties=="") return '<div >'; 
    else return '<div '.$properties.' >'; 
} 


function end_div() 
{ 
   return "</div>"; 
} 

 
function span($outtext = "",$properties="") 
{ 
   return print_text("span",$outtext,$properties); 
}

 
function start_span($properties="") 
{  
   if ($properties=="") return '<span >'; 
    else return '<span '.$properties.' >';  
}

 
function end_span() 
{ 
   return "</span>"; 
}

function para($outtext = "",$properties="") 
{ 
  return print_text("p",$outtext,$properties); 
} 
 
function font($outtext = "",$properties="") 
{ 
    return print_text("font",$outtext,$properties); 
}


function br($text="") 
{ 
  if ($text=="") return  "<br>"; 
  else return $text."<br>\n"; 
} 
 
function start_table ($properties="")  
{  
  if ($properties=="") return '<table border=1 align=center >'; 
  else return '<table '.$properties.' >'; 
}  
 
function end_table() 
{ 
  return "</table>"."\n"; 
} 
 
function start_form($name,$action) 
{ 
  $tx = '<form name="'.$name.'" method="post" action="'.$action.'"> '; 
  return $tx; 
} 

function start_form_get($name,$action) 
{ 
  $tx = '<form name="'.$name.'" method="get" action="'.$action.'"> '; 
  return $tx; 
} 

function start_form_post($name,$action) 
{ 
  $tx = '<form name="'.$name.'" method="post" action="'.$action.'"> '; 
  return $tx; 
}
 
function end_form() 
{ 
  return "</form>"; 
} 
 
function cell ($value="",$properties="") 
{ 
  $tx=""; 
  if($value==" " or (strlen($value)>0 and trim($value)=="") ) $value='&nbsp;'; 
  if ($properties=="")
  {
      $tx .= '<td'; 
      if (!is_int($value)) 
      { 
         $tx .= " halign=left >$value</td>"; 
      } 
      else 
      { 
         $tx .= " halign=right >$value</td>"; 
      } 
  }
  else $tx .= '<td '.$properties." >$value</td>" ; 
 
  return $tx; 
}  
 
function start_cell($properties="") 
{ 
  if ($properties=="") return '<td>'; 
  else return "<td $properties >"; 
} 
 
function end_cell() 
{ 
  return "</td>"; 
}

function start_js()
{
  return '<script type="text/javascript">'."\n";
}


function end_js()
{
  return '</script>'."\n";
}

function start_jsfunction($name)
{
  return "function $name (){\n";
}

function end_jsfunction()
{
  return "}\n";
}

function row($value,$properties="")
{
  if ($properties=="") $out = "<tr>"; 
  else $out = "<tr $properties >"; 
  $out .= $value;
  $out .= "</tr>"."\n";
  return $out;
}
 
function start_row($properties="")
{ 
  if ($properties=="") return "<tr>"; 
  else return "<tr $properties >"; 
} 
 
function end_row() 
{ 
  return "</tr>"."\n"; 
} 
 
function hidden_field($name,$text) 
{ 
  return make_field("hidden",$name,$text); 
} 
 
function text_field($name,$text,$properties='') 
{ 
  return make_field("text",$name,$text,$properties); 
} 
 
function make_field($type,$name,$text,$properties='') 
{ 
  if ($properties) return '<input type="'.$type.'" name="'.$name.'" id="'.$name.'" value="'.$text.'" '.$properties.' >';
  else return '<input type="'.$type.'" name="'.$name.'" id="'.$name.'" value="'.$text.'">';
} 


function make_radio($name,$value,$text,$sel=false) 
{ 
    if ($sel) return "<input type='radio' name='$name' value='$value' CHECKED >$text"; 
    else return "<input type='radio' name='$name' value='$value' >$text"; 
} 

function make_checkbox($name,$text,$sel=false) 
{ 
    if ($sel) return "<input type='checkbox' name='$name' CHECKED >$text"; 
    else return "<input type='checkbox' name='$name'  >$text"; 
} 


function submit_field($name,$text,$properties="") 
{ 
  $tx = '<input type="submit" name="'.$name.'" value="'.$text.'" ';
  if ($properties) $tx .=  $properties; 
  $tx .=  '>'; 
  return $tx;
} 

function submit_button($name,$value,$text,$properties="",$textproperties="") 
{ 
    $tx=  "<button type='submit' name ='$name' value='$value' ";
    if ($properties) $tx .=  $properties; 
    if($textproperties)
    {
    $tx .= "  ><span $textproperties >$text</span></button>";
    }
    else
    {
    $tx .= "  >$text</button>";
    }
    return $tx;
} 
 
function make_textarea($name,$text, $rows=5, $cols=20,$properties="") 
{ 
  $tx =""; 
  $tx .=  '<textarea name="'.$name.'" '; 
  if ($properties) $tx .=  $properties; 
  else $tx .= ' rows="'.$rows.'" cols="'.$cols.'" ';
  $tx .= ' >'; 
  $tx .= $text; 
  $tx .=  '</textarea>'; 
  return $tx; 
} 
 
 
function start_textarea($name, $rows=5, $cols=20,$properties="") 
{ 
  $tx =""; 
  $tx .=  '<textarea name="'.$name.'" '; 
  if ($properties) $tx .=  $properties; 
  else $tx .= ' rows="'.$rows.'" cols="'.$cols.'" ';
  $tx .= ' >'; 
  return $tx; 
} 
 
function end_textarea() 
{ 
  $tx =  '</textarea>'; 
  return $tx; 
} 
 
function image($source,$properties="") 
{ 
  $tx = '<img src="'.$source.'"  ';;
  if ($properties) $tx .=  $properties." >"; 
  else $tx .= ' valign=middle border="0"  >';
  return $tx;
} 
 
function hlink($target= "",$outtext = "",$properties="") 
{ 
  if ($outtext=="")  $outtext=$target; 
    $atext='<a ';
    if ($target) $atext .= " href='$target' ";  
    else $atext .= ' HREF="#null"  '; 
  if ($properties<>"") $atext .=" ".$properties; 
  $atext .= ">".$outtext."</a>"; 
  return $atext; 
} 
 


function hlink_image($target= "",$image,$hlinkproperties="",$imageproperties="") 
{ 
  return hlink($target,image($image,$imageproperties),$hlinkproperties); 
}
 
function make_mailto($name,$address) 
{ 
  return '<A HREF="mailto:'.$address.'">'.$name."</A>\n" ; 
} 
 
function make_select_list($name,$stnds,$sel=0,$size=1,$options="") 
{ 
  if (!$options) $outstring = "<select name=".$name."  size=$size >"; 
  else $outstring = "<select name=".$name."  size=$size ".$options." >"; 
  if(is_array($stnds) )
  {
      foreach($stnds as $l=>$v)  
  { 
      if($v)
      {
    if (is_int($sel) and $sel==$l) $outstring = $outstring.'<option value="'.$l.'" selected  >'.$v." "; 
    elseif ($sel==$l) $outstring = $outstring.'<option value="'.$l.'" selected  >'.$v." "; 
    else $outstring =$outstring.'<option value="'.$l.'" >'.$v; 
      }
  } 
  }
  $outstring = $outstring."</select>"."\n";; 
  return $outstring; 
} 
 
 
function make_select_list_from_array($name,$stnds,$slist,$sel="",$size=1,$options="") 
{ 
  if (!$options) $outstring = "<select name=".$name." id=".$name." size=$size >"; 
    else $outstring = "<select name=".$name." id=".$name." size=$size ".$options." >"; 
    if(count($stnds)>0) 
    { 
       foreach($stnds as $j=>$w) 
       { 
         // $value=$j." "; 
           $value=" "; 
          for ($k=0;$k<count($slist);$k++) 
          { 
          if(is_array($stnds))
             $value .= $stnds[$j]->$slist[$k]." "; 
          else
             $value .=$stnds->$j->$slist[$k]." "; 
          } 
          if ( $sel!=0 && $sel==$j) $outstring = $outstring.'<option value="'.$j.'" selected  >'.trim($value); 
          else $outstring =$outstring.'<option value="'.$j.'" >'.trim($value)." "; 
       } 
    } 
    $outstring = $outstring."</select>"."\n";; 
    return $outstring; 
} 
 
function make_multi_select_list($name,$stnds,$sel=array(),$size=1,$options="") 
{ 
  if (!$options) $outstring = "<select name=".$name."[]  size=$size multiple >"; 
  else $outstring = "<select name=".$name."  size=$size ".$options." >"; 
  for ($l=0;$l<count($stnds);$l++) 
  { 
    if ($sel[$stnds[$l]])  $outstring = $outstring.'<option value="'.$l.'" selected  >'.$stnds[$l]." "; 
 //   elseif ($sel==$stnds[$l]) $outstring = $outstring.'<option value="'.$l.'" selected  >'.$stnds[$l]." "; 
    else $outstring =$outstring.'<option value="'.$l.'" >'.$stnds[$l]." "; 
  } 
  $outstring = $outstring."</select>"."\n";; 
  return $outstring; 
} 
 
function mysql_date_to_human($dt)  
{  
   $yr=strval(substr($dt,0,4));  
   $mo=strval(substr($dt,5,2));  
   $da=strval(substr($dt,8,2));  
   return date("l j F Y", mktime (0,0,0,$mo,$da,$yr));  
}  
 
 
function format_date($f,$dt)  
{  
   $yr=strval(substr($dt,0,4));  
   $mo=strval(substr($dt,4,2));  
   $da=strval(substr($dt,6,2));  
   $hr=strval(substr($dt,8,2));  
   $mi=strval(substr($dt,10,2));  
   $se=strval(substr($dt,12,2));  
   return date($f, mktime ($hr,$mi,$se,$mo,$da,$yr));  
} 
 
 
 
 
function day_name($t) 
{ 
  switch ($t)  
  { 
    case 0: 
     return "Sunday"; 
     break; 
   case 1: 
     return "Monday"; 
     break; 
   case 2: 
     return "Tuesday"; 
     break; 
   case 3: 
     return "Wednesday"; 
     break; 
   case 4: 
     return "Thursday"; 
     break; 
   case 5: 
     return "Friday"; 
     break; 
   case 6: 
     return "Saturday"; 
     break; 
  } 
} 
 
function mysql_datetime_to_timestamp($dt)  
{  
  $yr=strval(substr($dt,0,4));  
  $mo=strval(substr($dt,5,2));  
  $da=strval(substr($dt,8,2));  
  $hr=strval(substr($dt,11,2));  
  $mi=strval(substr($dt,14,2));  
  $se=strval(substr($dt,17,2));  
  //return mktime($hr,$mi,$se,$mo,$da,$yr);  
  return $yr.$mo.$da.$hr.$mi.$se; 
}  
 
function date_to_timestamp($dt)  
{  
  $yr=strval(substr($dt,0,4));  
  $mo=strval(substr($dt,5,2));  
  $da=strval(substr($dt,8,2));  
  $hr=strval(substr($dt,11,2));  
  $mi=strval(substr($dt,14,2));  
  $se=strval(substr($dt,17,2));  
  return mktime($hr,$mi,$se,$mo,$da,$yr);  
  //return $yr.$mo.$da.$hr.$mi.$se; 
} 
 
 
function timestamp_to_mysql_timestamp($ts)   
{   
  $d=getdate($ts);   
  $yr=$d["year"];   
  $mo=$d["mon"];   
  $da=$d["mday"];   
  $hr=$d["hours"];   
  $mi=$d["minutes"];   
  $se=$d["seconds"];   
 
  return sprintf("%04d%02d%02d%02d%02d%02d",$yr,$mo,$da,$hr,$mi,$se);   
} 
 
 
function today() 
{ 
  $d=date("m-d-Y"); 
  $d2= cvdate($d); 
  $date=timestamp_to_mysql_timestamp($d2);  
  return $date; 
} 
 
function now() 
{ 
  return date("YmdHis"); 
} 
 
function cvdate($s)   
{   
  //this function takes a "human" date and converts it into a UNIX timestamp, zero if error.  
  //this function supports dash,slash or space delimiting, numeric/english months, and two-digit years.  
  //what is the delimiting character? (support space, slash, dash)  
  $delimiter="";   
  if (strpos($s,"-")>0) $delimiter="-";   
  if (strpos($s,"/")>0) $delimiter="/";   
  if (strpos($s," ")>0) $delimiter=" ";   
  if ($delimiter=="") return 0;   
  //chop it up  
  $p1=strpos($s,$delimiter);   
  $p2=strpos($s,$delimiter,$p1+1);   
  $x=substr($s,0,$p1);   
  $y=substr($s,$p1+1,$p2-$p1);   
  $z=substr($s,$p2+1);   
  //debug  
  //        echo("$x/$y/$z");  
  //the last value is always the year, so check it for 2- to 4-digit convertion  
  if (intval($z)<100)   
  {   
    if (intval($z)>69) $z=strval(1900+intval($z)); else $z=strval(2000+intval($z));   
  }   
  //intelligently select which converter to use  
  //(default is M/D/Y, but if the month is "spelled out" then the format is D/M/Y)  
  if (intval($y)==0)   
  {   
    return cvdate_english($x,$y,$z);   
  }   
  else   
  {   
    return cvdate_numeric($x,$y,$z);   
  }   
}   
 
function cvdate_english($d,$m,$y)   
{   
  $d2=0; $m2=0; $y2=0;   
  $d2=intval($d);   
  $m=strtolower($m);   
  switch(substr($m,0,3))   
  {   
    case "jan": $m2=1; break;   
    case "feb": $m2=2; break;   
    case "mar": $m2=3; break;   
    case "apr": $m2=4; break;   
    case "may": $m2=5; break;   
    case "jun": $m2=6; break;   
    case "jul": $m2=7; break;   
    case "aug": $m2=8; break;   
    case "sep": $m2=9; break;   
    case "oct": $m2=10; break;   
    case "nov": $m2=11; break;   
    case "dec": $m2=12; break;                   
  }   
  $y2=intval($y);   
  if (($d2==0)||($m2==0)||($y2==0)) return 0;   
  return mktime(0,0,0,$m2,$d2,$y2);   
}   
 
function cvdate_numeric($m,$d,$y)   
{   
  $d2=0; $m2=0; $y2=0;   
  $d2=intval($d);   
  $m2=intval($m);   
  $y2=intval($y);   
  if (($d2==0)||($m2==0)||($y2==0)) return 0;    
  return mktime(0,0,0,$m2,$d2,$y2);   
} 
 
function DateDiff ($interval, $date1,$date2)  
{ 
    // get the number of seconds between the two dates 
  $timedifference =  strtotime($date2) - strtotime($date1); 
  switch ($interval) 
  { 
    case "w": 
      $retval  = (integer)($timedifference/604800); 
      break; 
    case "d": 
      $retval  =(integer)($timedifference/86400); 
      break; 
    case "h": 
      $retval =(integer)($timedifference/3600); 
      break;         
    case "n": 
      $retval  = (integer)( $timedifference/60); 
      break;         
    case "s": 
      $retval  = $timedifference; 
      break;         
  }     
  return $retval; 
} 
 
function CheckSDate($sdate) 
{ 
   $year = substr($sdate,0,4); 
   $month = substr($sdate,5,2); 
   $day = substr($sdate,8,2); 
   return checkdate($month,$day,$year); 
} 
 
function AddDays($date, $daystoadd)
  {
    // Adds the specified number of days onto the date specified where date is in form yyyy-mm-dd.
	if (!is_numeric($daystoadd))
	  return false;
	  
	$datesep = getDateSeparator($date);
	if ($datesep == false)
	  return false;
	
    $datearr = explode($datesep, $date);
	
    return date("Y-m-d", mktime(0, 0, 0, $datearr[1], $datearr[2] + $daystoadd, $datearr[0]));
  }

 function getDateSeparator($date) 
  {
    // Determine date separator
    if (strchr($date, "-"))
      return "-";
    elseif (strchr($date, "/"))
      return "/";
    elseif (strchr($date, "."))
      return ".";
    else // Invalid date separator
      return false;
  }

function DateAdd ($interval,  $number, $date)  
{ 
//yyyy     year 
//q	Quarter 
//m	Month 
//y	Day of year 
//d	Day 
//w	Weekday 
//ww    Week of year 
//h	Hour 
//n	Minute 
//s	Second 
 
 $date_time_array  = getdate(strtotime($date)); 
 $hours =  $date_time_array["hours"]; 
 $minutes =  $date_time_array["minutes"]; 
 $seconds =  $date_time_array["seconds"]; 
 $month =  $date_time_array["mon"]; 
 $day =  $date_time_array["mday"]; 
 $year =  $date_time_array["year"]; 
 switch ($interval) 
 {    
   case "yyyy": 
     $year +=$number; 
     break;         
   case "q": 
     $month +=($number*3); 
     break;         
   case "m": 
     $month +=$number; 
     break;         
   case "y": 
   case "d": 
   case "w": 
     $day += $number; 
     break;         
   case "ww": 
     $day+=($number*7); 
     break;         
   case "h": 
     $hours+=$number; 
     break;         
   case "n": 
     $minutes+=$number; 
     break;         
   case "s": 
     $seconds+=$number; 
     break;         
 }     
 $timestamp =  mktime($hours ,$minutes, $seconds,$month ,$day, $year); 
 return sdate($timestamp); 
} 
 
function sdate($udate="") 
{ 
  if($udate<>"") return date("Y-m-d",$udate); 
  else return date("Y-m-d"); 
} 
 
function stime($hour,$mins=0) 
{ 
  if (!is_int($hour)) 
  { 
    $ihour = (integer)substr($hour,0,2); 
  } 
  else $ihour = $hour; 
  if ( $ihour < 10) $shour= "0".((string)$ihour); 
  else  $shour=(string)$ihour; 
  if (($mins<10)>0) $smins= "0".((string)$mins); 
  else $smins=(string)$mins; 
  $ret = $shour . ":". $smins; 
  return $ret; 
} 
 
function next_sunday($date) 
{ 
    $n=date2("w",$date);  
    $date=dateadd('d',+7-$n,$date); 
    if($date=='2003-03-29') $date='2003-03-30';
    return $date;  
} 

function previous_sunday($date,$ns=true) 
{ 
    $n=date2("w",$date); 
    if($n==0 && $ns) $n=7;
    $date=dateadd('d',-$n,$date); 
    if($date=='2003-03-29') $date='2003-03-30';
    return $date; 
}
 
function date2($fmt, $date) 
{ 
  $out =date($fmt, strtotime($date)); 
  return $out; 
} 


function is_browser_ie()
{
  $b = strtolower( $_SERVER['HTTP_USER_AGENT']) ;
  $pos1 = strpos($b, "msie");
  if (!$pos1 === false)
  {
    return true;
  }
  return false;
}

function divbutton($href,$label,$parameters1='',$parameters2="")
{
  $content  = start_div("border=0  ".$parameters2);
  $content .=  hlink($href,$label,$parameters2);
  $content .= end_div();
  return $content;
}

function spanbutton($href,$label,$parameters1='',$parameters2="")
{
  $content  =  "<input type='button' name='button' value='$label' onclick='window.location=";
  $content  .=  '"'.$href.'" ';
  $content  .=  "' />";
  return $content;
}

function hbutton($href,$label,$parameters1='',$parameters2="")
{
  $content  = start_table("border=0  ").start_row().start_cell($parameters1);
  $content .=  hlink($href,$label,$parameters2);
  $content .= end_cell().end_row().end_table();
  return "<div align=center >".$content."</div>";
}
?>