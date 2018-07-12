<?php
//ini_set('display_errors',1);
ini_set('display_startup_errors',1);
//error_reporting(E_ALL | E_NOTICE);
//ini_set('display_errors', '1');  
//error_reporting(-1);

function showtopdir($f, $directory,$root)
{
   $path_parts = pathinfo($directory);
   $name =  $path_parts['basename'];
   fwrite($f, "<directory name='$name'  >\n");
   $list= scanmydir($directory);
   foreach($list as $file )
   {
     if(is_Array($file))
     {
     }else if (is_dir($directory.'/'.$file))
     {
      showmydir($f,  $directory.'/'.$file, $root."/".$name);		  
     }
   }
   fwrite($f, "</directory>\n");
}

function showmydir($f, $directory, $aroot)
{
    $list= scanmydir($directory);
    $k=0;
    if($list!=null)
    { 
        $path_parts = pathinfo($directory);
        $dname =  $path_parts['basename'];
	 fwrite($f, "<directory name='$dname'  >\n");
        foreach($list as $file )
        {
         if(!is_Array($file))
         {
           $path = $directory.'/'.$file;
           if (is_dir($path))
	   {
		$k = $k + showmydir($f, $path, $aroot."/".$dname);		  
	   }
	   else
	   {
	     $label = str_replace($dname."_","",$file);
	    if (strpos($label,'.xml') !== false) 
	    {
                     $label = str_replace(".xml","",$label);
	             fwrite($f, "<file name='$label' file='$file' path='$aroot/$dname/$file' />\n");
	             $k++;
             }
             else
             { 
	      $label = str_replace(".jpg","",$label);
	       $label = str_replace(".jpeg","",$label);
	        $label = str_replace(".gif","",$label);
	         $label = str_replace(".png","",$label);  
	          $label = str_replace(".JPG","",$label);
        $label = str_replace(".JPEG","",$label);
         $label = str_replace(".GIF","",$label);
          $label = str_replace(".PNG","",$label);  
	        fwrite($f, "<file name='$label' image='$file' path='$aroot/$dname/$file' />\n");
	         $k++;
	      }
	   }
        }
        }
        fwrite($f, "</directory>\n");
    }
    return $k;
}


function scanmydir( $directory)
{
  $list[]= array();
  $k=0;

  if ($handle = opendir($directory)) 
  { 
    while (false !== ($file = readdir($handle))) 
    {
       if ($file == "." || $file == "..") 
       {          
       }
       else if(is_Array($file))
       {
       }
       else if (is_dir($directory.'/'.$file))
       {
          $sublist = scanmydir($directory.'/'.$file);
          if($sublist!=null)
          {
            $list[] = $file;
            $k++;
          }
       }
       else
       {
          $path_parts = pathinfo($file);
          if( array_key_exists('extension',$path_parts))
          {
            $ext = strtolower( $path_parts['extension']);
            if($ext=="xml" || $ext=="jpg" || $ext=="png" || $ext=="jpeg" || $ext=="gif" || $ext=="pdf" )
            {
              $list[] = $file;
              echo " found ".$file."<br>";
              $k++;
            }  
          }
       }
    }
    closedir($handle);
  }
    if($k>0)
    {
    try
    {
       sort($list, SORT_NATURAL | SORT_FLAG_CASE);
       return $list;
    }
    catch(Exception $e)
    {
          return null;
    }
    }
    else return null;
}
  
    



echo " bonjour". "<br>";
  
$f=fopen("dirmap.xml","w") or die("Unable to open file!"); 
$out = '<?xml version="1.0" encoding="UTF-8"?>';
fwrite($f, $out."\n");
$out = '<?xml-stylesheet type=\'text/xsl\' href=\'./Stylesheets/DirectoryStyler.xsl\' ?>';
fwrite($f, $out."\n");
$out = '<list>';
fwrite($f, $out."\n");
$directory = getcwd();
showtopdir($f, $directory, "/~paul" );
$out = '</list>';
fwrite($f, $out."\n");
fclose($f);

?>