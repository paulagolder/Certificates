<?php

ini_set('display_errors', 1);
error_reporting(E_ALL);
echo 'start';

function  getAttributes($tag)
{
  $atts = array();
  $length = strlen($tag);
  $charpos = 0;
  echo " tag =".$tag."<br>";
  echo " length =".$length."<br>";
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
  while(ctype_alnum($tag[$i]) && $i < $l )
  {
    $att .=$tag[$i];
    $i++;
  }
  for (; ($i < $l) && ctype_space( $tag[$i]); $i++);
  if($tag[$i]== '=')
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
  return "not found";
  
}

function showDoc($xmlf, $xslf)
{
  $xml = new DOMDocument();
  $xml->load($xmlf);  // load XSLTProcessor
  $xsl = new DOMDocument();
  $xsl->load($xslf);
  $proc = new XSLTProcessor();
  $proc->importStyleSheet($xsl);
  return $proc->transformToXML($xml);
}



$xmlf = "../transcriptions/Marriages/1832Marriage_SamuelPurnell_test.xml";
$xslf = "../transcriptions/Stylesheets/LMAMarriageCert_stylesheet.xsl";


$xml = new DOMDocument();
$xml->load($xmlf);  // load XSLTProcessor
$stylesheet = getStyleSheet($xml);
echo " stylesheet is ".$stylesheet."<br>";

echo showDoc($xmlf,$xslf);

echo "end"."<br>";
?>