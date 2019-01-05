<?php
include './BrowserLib.php';
include './myfuncts.inc';
include './process.php';
include "./downloadfileclass.inc";


session_start();
if(!isset($_SESSION["basefile"]))
{
  $basefile= basename(__FILE__);
  $_SESSION['basefile']=$basefile;
  $_SESSION['path']="";
}
$path = $_SESSION['path'];
$basefile = $_SESSION['basefile'];
$fileno = -1;
$selfile = null;
if( isset($_GET["path"]))
{
  $path = $_GET["path"];
  $_SESSION['path']=$path;
}

ini_set('display_errors', 1);
error_reporting(E_ALL);
$fnct="";
$output = "";
$filename="";
$xmlf="";
if( isset($_GET["action"]))
{
  $fnct = $_GET["action"];
}
else
  $fnct="showposts";
if($fnct=="downloadfile")
{



}
else
{
echo '<html>';
echo '<head>';
echo ' <meta http-equiv="Content-type" content="text/html;charset=UTF-8" />';
echo ' <link rel="stylesheet" href="./CertBrowser.css" type="text/css">';
echo '</head>'."\n";
}
//echo "<p>Hello {$_SERVER['PHP_AUTH_USER']}.</p>";
//echo "<p>You entered {$_SERVER['PHP_AUTH_PW']} as your password.</p>";

if($fnct !=  null) $output .= $fnct();

$k = strpos($path,"public_html")+11;
$shortpath = ".".substr($path,$k);

if( isset($_SESSION["fileno"]))
{
  $fileno = $_SESSION["fileno"];
}

if($fileno > -1 && $fileno < sizeof($_SESSION["filearray"]))
{
  $selfile = $_SESSION["filearray"][$fileno];
  $xmlf= $path."/".$selfile;
 // $output .= " xmlf ".$xmlf."<br>";
}
$output .= start_form("form1","{$basefile}")."\n";
$output .= start_table(" class='filebrowser' ")."\n";
$output .= start_row().start_cell(" class='fbheader'  ");
$output .= "Browsing : {$shortpath}";
$output .= end_cell()."\n";
$output .= start_cell(" class='fbheader' ");
$output .= "File : {$xmlf}";
$output .= end_cell().end_row()."\n";
$output .= start_row(" style='height:40px' ");
$output .= start_cell(" style='vertical-align:middle;' colspan='2'  " );
if($fileno > 0)
{
  $nfileno = $fileno -1;
  $file = $_SESSION["filearray"][$nfileno];
  $link = "{$basefile}?action=showcert&fileno={$nfileno}";
  $output .= hlink($link,"back"," class='button' ")."\n";
}
$output .= hlink($basefile."?action=selectfile","select file"," class='button' ")."\n";
$output .= hlink($basefile."?action=selectnew","new file"," class='button' ")."\n";

$nfileno = $fileno +1;
if($nfileno > -1 && isset($_SESSION["filearray"]) && $nfileno < sizeof($_SESSION["filearray"]))
{
  $file = $_SESSION["filearray"][$nfileno];
  $link = "{$basefile}?action=showcert&fileno={$nfileno}";
  $output .= hlink($link,"forward"," class='button' ")."\n";
}
$edit = false;
if(isset($_SESSION["edit"]))
{
  if($_SESSION["edit"])
  {
    $output .= hlink($basefile."?action=editoff","VIEW"," class='button' ")."\n";
    $edit = true;
  }
  else
  {
    $output .= hlink($basefile."?action=editon","EDIT"," class='button' ")."\n";
    $edit = false;
  }
}
else
{
  $output .= hlink($basefile."?action=editon","EDIT"," class='button' ")."\n";
  $edit = false;
}

$output .= submit_button("submit1","submitvalue","Submit"," class='button' ");
$output .= hlink($basefile."?action=savefile","SAVE FILE"," class='button' ")."\n";
$output .= hlink($basefile."?action=mergefile","MERGE FILE"," class='button' ")."\n";
$output .= hlink($basefile."?action=downloadfile","DOWNLOAD FILE"," class='button' ")."\n";
$output .= end_cell();
$output .= end_row().end_table()."\n";

$output .=  showADoc($xmlf, $edit);
$output .= end_form()."\n";
echo $output;

?>