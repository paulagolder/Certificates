<?php

function selectfile()
{
  $basefile =  $_SESSION['basefile'];
  $path = $_SESSION['path'];
  if( !empty($_REQUEST['path']))
    $path =  $_REQUEST['path'] ;
  if(empty($path) ) $path = dirname(__FILE__);
     $_SESSION['path']=$path;
  $output =  "";
  $output .=  browsefiles($basefile,$path);
  unset($_SESSION["XML"]);
  return $output;
}


function newcert()
{
  if( !empty($_REQUEST['templateid']))
    $templateid =  $_REQUEST['templateid'] ;
  $xsl = new DOMDocument('1.0','UTF-8');
  $xsl->load("./templates.xml");
  $xpath = new DOMXPath($xsl);
  $skeleton  = $xpath->query("//skeleton[@templateID='$templateid']")->item(0);
  $xml = new DOMDocument('1.0', 'UTF-8');
  $xml->preserveWhiteSpace = false;
  $xml->formatOutput = true;
  $stylesheet = $xpath->query("//skeleton[@templateID='$templateid']/template/stylesheet")->item(0)->nodeValue;
  $xslt = $xml->createProcessingInstruction('xml-stylesheet', $stylesheet);
  $xml->appendChild($xslt);
  $topnode = $xml->createElement("sourcedocument");
  $xml->appendChild($topnode);
  foreach ($skeleton->childNodes as $cnode) {
    $clonecnode =  $xml->importNode($cnode, true);
    $topnode->appendChild($clonecnode);
  }
 
  $_SESSION["XML"]=  $xml->saveXML();
  $_SESSION["STYLESHEET"] = $stylesheet ;
}


function selectnew()
{
  $basefile =  $_SESSION['basefile'];
  $path = $_SESSION['path'];
  if( !empty($_REQUEST['path']))
    $path =  $_REQUEST['path'] ;
  if(empty($path) ) $path = dirname(__FILE__);
  $_SESSION['path']=$path;
  $output =  "";
  $output .=  browsetemplates($basefile,$path);
  unset($_SESSION["XML"]);
  return $output;
}

function showcert()
{
  if( isset($_GET["fileno"]))
  {
    unset($_SESSION["XML"]);
    $fileno = $_GET["fileno"];
    if($fileno > -1 && isset($_SESSION["filearray"]) && $fileno < sizeof($_SESSION["filearray"]))
    {
      $_SESSION["fileno"] = $fileno;
    }
    else
      $_SESSION["fileno"] = -1;
  }
}


function addline()
{
  $newline = $_GET["lineno"];
  $object =  $_GET["object"];
  $xml = DOMDocument::loadXML($_SESSION["XML"]);
  $xpath = new DOMXPath($xml);
  $objectnodes =  $xpath->query("//$object");
  if($newline ==0)
  {
    $refNode = $objectnodes->item(0);
    $newNode = $xml->createElement($object);
    $refNode->parentNode->appendChild($newNode);
    $refNode->parentNode->insertBefore($newNode,$refNode);
  }
  elseif($newline >= $objectnodes->length)
  {
    $refNode = $objectnodes->item(0);
    $newNode = $xml->createElement($object);
    $refNode->parentNode->appendChild($newNode);
  }
  else
  {
    $refNode = $objectnodes->item($newline);
    $newNode = $xml->createElement($object);
    $refNode->parentNode->insertBefore($newNode, $refNode);
  }
  $_SESSION["changed"]= true;
  $_SESSION["XML"] =  $xml->saveXML();
}

function delline()
{
  $dellineno = $_GET["lineno"]-1;
  $object =  $_GET["object"];
  $xml = DOMDocument::loadXML($_SESSION["XML"]);
  $xpath = new DOMXPath($xml);
  $objectnodes =  $xpath->query("//$object");
  $refNode = $objectnodes->item($dellineno);
  $refNode->parentNode->removeChild( $refNode);
  $_SESSION["changed"]= true;
  $_SESSION["XML"] =  $xml->saveXML();
}


function showposts()
{
  if(isset($_SESSION["XML"]))
  {
    $xml = DOMDocument::loadXML($_SESSION["XML"]);
    $xpath = new DOMXPath($xml);
    $changed= false;
    echo " changing data ";
    foreach($_POST as $key => $value)
    {
      if(is_array($value) && $key )
      {
        foreach ($value as $subkey=> $item)
        {
          if( strpos($key,"*")>1)
          {
            $prockey = str_replace("*","[".$subkey."]",$key);
          }
          else
            $prockey= $key;
          if(strpos($prockey, ";")>1)
          {
            $keyarr = explode(";",$prockey);
            if(checkNodefromArray($xpath,$keyarr))
            {
              // echo  " $prockey : ok "."<br>";
              //  if(!empty($item))
              {
                if(updateNodefromArray($xpath, $keyarr,$item))$changed=true;
              }
            }
            else
            {
              //echo  " $prockey : not ok "."<br>";
              if(!empty($item))
              {
                if(updateNodefromArray($xpath, $keyarr,$item))$changed=true;
              }
            }
          }
          else
          {

            if(updateNode($xpath,$prockey,$item)) $changed=true;
          }
        }
      }
      else
      {
        if(updateNode($xpath,$key,$value)) $changed=true;
      }
    }
    if($changed)
    {
      $_SESSION["changed"]= true;
      $editiondatenodes = $xpath->query("//edition/editdate");
      $editiondatenodes->item(0)->nodeValue = date("Y-m-d H:i:s");
      //echo $xml->saveXML();
      $_SESSION["XML"] =  $xml->saveXML();
    }
  }
}

function updateNodefromArray($xpath, $keyarr, $value)
{
  $changed = false;
  foreach($keyarr as $akey)
  {
    $akey = trim($akey);
    if($akey!=null && !empty($akey))
    {
      if(updateNode($xpath,$akey,$value)) $changed=true;
    }
  }
  return $changed;
}

function checkNodefromArray($xpath, $keyarr)
{
  $isok = true;
  foreach($keyarr as $akey)
  {
    $akey = trim($akey);
    if($akey!=null && !empty($akey))
    {
      if(!checkNode($xpath,$akey)) $isok=false;
    }
  }
  return $isok;
}


function updateNode($xpath, $key,$newvalue)
{
  $changed= false;
  if(substr($key,0,2)=="//") $key= substr($key,2);
  if(strpos($key,"=")>1)
  {
    $varray = explode ("=",$key);
    $key = trim($varray[0]);
    $newvalue = trim($varray[1]);
  }
  $oldnode = $xpath->query("//".$key);

  if($oldnode && !empty($oldnode) &&  $oldnode->item(0)!= null)
  {
    $oldvalue = $oldnode->item(0)->nodeValue;
    if($oldvalue != $newvalue)
    {
      $changed = true;
      $oldnode->item(0)->nodeValue = $newvalue;
      echo  " $key : $key changed ".$oldvalue. "=".$newvalue."<br>";
    }
  }
  else if($newvalue != null)
  {
    $newnode = createNode($xpath,$key);
    $newnode->nodeValue = $newvalue;
    $changed = true;
  }
  return $changed;
}


function createNode($xpath, $key)
{
  if(substr($key,0,2)=="//") $key= substr($key,2);
  $keyarr = explode("/",$key);
  $keyt = $keyarr[0];
  $node = $xpath->query("//$keyt")->item(0);
  $i=1;
  $keystr = "//$keyarr[0]";
  for(;$i<count($keyarr); $i++)
  {
    $keystr = $keystr."/".$keyarr[$i];
    $anodelist = $xpath->query($keystr);
    if( empty($anodelist) ||  !$anodelist->item(0) )
    {
      $element = $node->ownerDocument->createElement($keyarr[$i]);
      $node->appendChild($element);
      $node= $element;
    }
    else
      $node=$anodelist->item(0);
  }
  return $node;
}
  

function checkNode($xpath, $key)
{
  if(strpos($key,"=")>1)
  {
    $varray = explode ("=",$key);
    $key = trim($varray[0]);
    $newvalue = trim($varray[1]);
    $oldnode = $xpath->query("//$key");;
    if($oldnode && $oldnode->item(0))
    {
      $oldvalue = $oldnode->item(0)->nodeValue;
      if($oldvalue == $newvalue)
      {
        return true;
      }
    }
    return false;
  }
  else
    return true;
}

function savefile()
{
  $xml = DOMDocument::loadXML($_SESSION["XML"]);
  $xpath = new DOMXPath($xml);
  $savepath = $xpath->query("//edition/savepath");
  $fileno = $_SESSION["fileno"];
  $selfile = $_SESSION["filearray"][$fileno];
  $path = $_SESSION['path'];
  if(!endsWith($selfile,"_edit.xml"))
      $selfile = str_replace(".xml","_edit.xml",$selfile);
  $xmlf= $path."/".$selfile;
  $savepath->item(0)->nodeValue = $xmlf;
  $_SESSION["newfile"] = $xmlf;
  $rv = $xml->save($xmlf);
  $_SESSION["changed"]= false;
}

function mergefile()
{
  
  $selfile = $_SESSION["newfile"];
  if(endsWith($selfile,"_edit.xml"))
  {
    $newfile = str_replace("_edit.xml",".xml",$selfile);
    rename($selfile,$newfile);
     echo " file renamed";
  }
 
}

function downloadfile()
{
  $xmlf = $_SESSION["newfile"] ;
  $downloadfile = new DOWNLOADFILE($xmlf);
  if (!$downloadfile->df_download()) echo "Sorry,cannot download ".$xmlf;
}


function editoff()
{
  $_SESSION["edit"]=false;
}


function editon()
{
  $_SESSION["edit"]=true;
}


?>