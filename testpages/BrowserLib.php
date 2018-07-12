<?php



function  getAttributes($tag)
{
  $atts = array();
  $length = strlen($tag);
  if($length < 5) return $atts;
  $charpos = 0;
  while ($charpos <  $length  && $charpos >=0)
  {
    $charpos = getAttribute($atts,$tag,$charpos);
  }
  return $atts;
}

function  getAttribute(&$atts, $tag, $start)
{
  $i = $start;
  $l =  strlen($tag);
  for (; ($i < $l) && !ctype_alnum( $tag[$i]); $i++);
  $att="";
  $value="";
  while( $i < $l && ctype_alnum($tag[$i])  )
  {
    $att .=$tag[$i];
    $i++;
  }
  for (; ($i < $l) && ctype_space( $tag[$i]); $i++);
  if( $i < $l && $tag[$i]== '=')
  {
    $i++;
    for (; ($i < $l) && ctype_space( $tag[$i]); $i++);
    if($tag[$i]=="'")
    {
      $i++;
      for (; ($i < $l) && ($tag[$i]!="'"); $i++)
        $value .= $tag[$i];
      $i++;
    }
    elseif($tag[$i]=='"')
    {
      $i++;
      for (; ($i < $l) && ($tag[$i]!='"'); $i++)
        $value .= $tag[$i];
      $i++;
    }
    else
    {
      for (; ($i < $l) && ctype_alnum( $tag[$i]); $i++)
        $value .= $tag[$i];
    }
    $atts[$att]=$value;
    return $i;
  }
  else
  {
    $atts[$att]=true;
    return  $i;
  }
}

function getNodesInfo($node)
{
  if ($node->hasChildNodes())
  {
    $subNodes = $node->childNodes;
    foreach ($subNodes as $subNode)
    {
      if (($subNode->nodeType != 3) ||
        (($subNode->nodeType == 3)
        &&(strlen(trim($subNode->wholeText))>=1)))
        {
          echo "Node name: ".$subNode->nodeName."<br>";
          echo "Node value: ".$subNode->nodeValue."<br>";
        }
        getNodesInfo($subNode);
    }
  }
}


function getStyleSheet($xml)
{
  foreach($xml->childNodes as $cNode)
  {
    if($cNode->nodeName == "xml-stylesheet")
    {
      $atts = getAttributes($cNode->nodeValue);
      return $atts["href"];
    }
  }
  return null ;
  
}

function showDoc($xml,$xslf)
{
  $output =  "";
  if($xslf!=null)
  {
    if(!file_exists ( $xslf ))
    {
      $output .=   " Stylesheet :".$xslf.":does not exist <br>";
    }
    else
    {
      $xsl = new DOMDocument('1.0','UTF-8');
      $xsl->load($xslf);
      $proc = new XSLTProcessor();
      $proc->importStyleSheet($xsl);
      $output .= $proc->transformToXML($xml);
    }
    return $output;
  }
  else
    return " Stylesheet not found "."<br>";
}

function showADoc($xmlf,$edit)
{
  if(isset($_SESSION["XML"]))
  {
    //$xml = DOMDocument::loadXML($_SESSION["XML"]);
    $xml = new DOMDocument();
     $xml->loadXML($_SESSION["XML"]);
    $stylesheet = $_SESSION["STYLESHEET"];
  }
  else
  {
     if(!$xmlf) return "";
     $xml = new  DOMDocument('1.0','UTF-8');
    $xml->load($xmlf);  // load XSLTProcessor

    $_SESSION["XML"]=  $xml->saveXML();
    $stylesheet = getStyleSheet($xml);
    $_SESSION["STYLESHEET"] = $stylesheet;
  }

 
  if($stylesheet == null)
  {
    return " stylesheet not found ".$stylesheet."<br>";
  }
  else
  {
    if($edit==true) $stylesheetB = str_replace(".xsl","_edit.xsl",$stylesheet);
    else
      $stylesheetB = $stylesheet;
    return  showDoc($xml,$stylesheetB);
  }

}

function browsefiles($script, $path)
{
  $k = strpos($path,"public_html")+11;
  $shortpath = ".".substr($path,$k);
  $outline =start_table(" class='filebrowser' ");
  $directories = array();
  $files = array();

  // Check we are focused on a dir
  if (is_dir($path)) {
    chdir($path); // Focus on the dir
    if ($handle = opendir('.')) {
      while (($item = readdir($handle)) !== false) {
        // Loop through current directory and divide files and directorys
        if(is_dir($item)){
          array_push($directories, realpath($item));
        }
        else
        {
          array_push($files, ($item));
        }
      }
      closedir($handle); // Close the directory handle
    }
    else {
      $outline .= "<p class=\"error\">Directory handle could not be obtained.</p>";
    }
  }
  else
  {
    $outline .= "<p class=\"error\">Path is not a directory</p>";
  }

  $outline .= start_row();
 
  $outline .= cell("Navigation");
  $outline .= cell("Files :", " colspan='2' " );
  $outline .= end_row();
  $outline .= start_row().start_cell();
  $outline .= "<ul  class='fbbrowser' >";
  asort($directories);

  foreach( $directories as $directory )
  {
    $shortdir = ".".substr($directory,$k);
    $outline .= ($directory != $path) ? "<li><a href=\"{$script}?action=selectfile&path={$directory}\">{$shortdir}</a></li>" : "";

  }
  $outline .= "</ul>";
  $outline .= end_cell().start_cell();
  $outline .= "<ul  class='fbbrowser' >";
  $fileno = 0;
  $filearray =  array();
  $count = 0;
  foreach( $files as $file )
  {
    if(endsWith($file,".xml"))
    {
      $count++;
    }
  }
      
  $n = 0;
  asort($files);
  foreach( $files as $file )
  {
    if(endsWith($file,".xml"))
    {
       $outline .=  "<li><a href=\"{$script}?action=showcert&fileno={$fileno}\">{$file}</a></li>";
       $filearray[$fileno] = $file;
       $fileno++;
       $n++;
       if($n > $count/2)
       {
         $outline .= "</li>";
         $outline .= end_cell().start_cell();
         $outline .= "<ul  class='fbbrowser' >";
         $n = 0;
       }
    }
  }
  $_SESSION["filearray"]= $filearray;
  $outline .= "</ul>";
  $outline .= end_cell().end_row().end_table()."<p class='height:20px' ></p>";
  return $outline;
}


function browsetemplates($script, $path)
{
  $k = strpos($path,"public_html")+11;
  $shortpath = ".".substr($path,$k);
  $outline =start_table(" class='filebrowser' ");
  $directories = array();
  $files = array();
  $xsl = new DOMDocument('1.0','UTF-8');
  $xsl->load("./templates.xml");
  $xpath = new DOMXPath($xsl);
  $skeletons =  $xpath->query("//skeleton");
  $outline .= start_row();
  $outline .= cell("New Certificate" , " colspan='4' " );
  $outline .= end_row();
  $outline .= start_row();

  //asort($directories);
  $n=0;
  foreach( $skeletons as $skeleton )
  {
    // $name="name";
    $name = $skeleton->getAttribute("name");
    $templateid = $skeleton->getAttribute("templateID");
    $outline .= cell( "<li><a href=\"{$script}?action=newcert&templateid=$templateid\">{$name}</a></li>");
    $n++;
    if ($n>4)
    {
      $outline .= end_row();
      $n=0;
    }
  }

  $outline .= end_row().end_table()."<p class='height:20px' ></p>";
return $outline;
}


function endsWith($haystack, $needle)
{
  $length = strlen($needle);
  if ($length == 0) {
    return true;
  }

  return (substr($haystack,-$length) === $needle);
}

?>