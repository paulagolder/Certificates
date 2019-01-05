<?php

ini_set('display_errors', 1);
error_reporting(E_ALL);
echo 'start';

function  getAttributes($tag)
{
  $atts = array();
  $length = strlen($tag);
  $charpos = 0;
  while ($charpos <  $length)
  {
    $charpos = getAttribute($atts,$tag,$charpos);
  }
  return $atts;
}

function  getAttribute($atts, $tag, $start)
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
  for (; ($i < $l) && !ctype_space( $tag[$i]); $i++);
  if($tag[$i]== '=')
  {
    for (; ($i < $l) && !ctype_space( $tag[$i]); $i++);
    if($tag[$i]=="'")
    {
      for (; ($i < $l) && ($tag[$i]!="'"); $i++)
        $value .= $tag[$i];
    }
    elseif($tag[$i]=='"')
    {
      for (; ($i < $l) && ($tag[$i]!='"'); $i++)
        $value .= $tag[$i];
    }
    else
    {
      for (; ($i < $l) && ctype_alnum( $tag[$i]); $i++)
        $value .= $tag[$i];
    }
    $atts[$att]=$value;
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




echo 'end';
?>