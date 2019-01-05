<?php

session_start();

include '../phplib/login.inc';
include '../phplib/myfuncts.inc';
include '../phplib/phpxml.inc';
require('../phplib/fpdf.php');

class PDF extends FPDF
{

function startLabels($ncols,$colw,$rewh)
{
    $rowcount=0;
    $cellcount=0;
    $pdf->AddPage();
}

function addLabel($data)
{
	
	$w=63;
    $h=38;
	$this->Ln();
	//Data
	foreach($data as $row)
	{
		$this->Cell($w,$h,$row[0],1);
		$this->Cell($w,$h,$row[1],1);
		$this->Cell($w,$h,$row[2],1);
		$this->Ln();
	}
	//Closure line
	$this->Cell(array_sum($w),0,'','T');
}


}
   
print start_page_header("paul and vivs addresses");
print end_page_header(""," bgcolor=#ffff66 ");
print para( "page start");
$path= find_file(getcwd()."/","hosts.xml");
$host=$_SESSION['host']=server_details($path);
print para( "page start".$host["id"]);
$service=$_SESSION['service']=service_details($host,'address');
print para( "page start ".$service["connect"]);
$_SESSION['mysqlconnect']=connect_service($service);

$current=$_SESSION['current'];
$submit= $_POST['submit'];
$addresslist=$_SESSION['addresslist'];

if($submit=="previous")
{   
  if ($current > -1) $current = $current-1;
   if($current<0)
  { 
       $current=0;
  }
  $submit="main";
}
if($submit=="next")
{ 
  $current = $current+1;
   if($current>count($addresslist)-1)
  { 
       $current=count($current)-1;
  }
  $submit="main";
}

if($submit=="select")
{ 
  $current= (integer)$_POST['selperson'];
  $submit="main";
}

if($submit=="update" )
{ 
    $ipname=$_POST['ipname'];
       $isname=$_POST['isname'];
       $iroad=$_POST['iroad'];
       $itown=$_POST['itown'];
       $icounty=$_POST['icounty'];
       $ipostcode=$_POST['ipostcode'];
       $icountry=$_POST['icountry'];
       $iemail=$_POST['iemail'];
       $iphone=$_POST['iphone'];
       $imobile=$_POST['imobile'];
       $icomment=$_POST['icomment'];
    $ipname=$_POST['ipname'];

    $selectors='';
    if ($_POST['ixmas']=='on' ) $selectors .= ' christmas '  ;
    if ($_POST['iholiday']=='on' ) $selectors .= ' holiday '  ;
    if ($_POST['iviv']=='on' ) $selectors .= ' vivs '  ;
    if ($_POST['ipaul']=='on' ) $selectors .= ' pauls '  ;
    if ($_POST['ihand']=='on' ) $selectors .= ' hand '  ;
    $query= "update  addresses set Firstname='$ipname', Lastname='$isname', ";
    $query .= " Street='$iroad', City='$itown' , County='$icounty', Postcode='$ipostcode', Country='$icountry', ";
    $query .= "Email='$iemail',Phone='$iphone' , mobile='$imobile', ";
    $query .= " Comment='$icomment',Selectors='$selectors' where  id='".$addresslist[$current]."' ";
  //  echo $query;
    $result=safe_query($query);
    $submit='refresh';
}

if($submit=="export" )
{ 
    $selectors='';                                                       
    if ($ixmas=='on' ) $selectors .= " and Selectors like '%christmas%'  ";
    if ($iholiday=='on' ) $selectors .= " and Selectors like '%holiday%'  ";
    if ($iviv=='on' ) $selectors .= " and Selectors like '%vivs%'  ";
    if ($ipaul=='on' ) $selectors .= " and Selectors like '%pauls%' " ;
    if ($ihand=='on' ) $selectors .= " and Selectors like '%hand%'  ";
    $query= "select * from  addresses where Lastname <>'' $selectors order by Selectors,Lastname,Firstname  ";
    $result=safe_query($query);
    $fp=fopen("/home/paul/Download/address.csv","w");
    echo $query;
    fputs($fp,"surname\tforename\troad\ttown\tcounty\tpostcode\tcountry\tselectors\temail\tmobile\tphone\tcomments\n");
    while ($row=mysql_fetch_array($result)) 
    { 
       $ostr =trim($row["Lastname"])."\t";
       $ostr .=trim($row["Firstname"])."\t";
       $ostr .=trim($row["Street"])."\t";
       $ostr .=trim($row["City"])."\t";
       $ostr .=trim($row["County"])."\t";
       $ostr .=trim($row["Postcode"])."\t";
       $ostr .=trim($row["Country"])."\t";
       $ostr .=trim($row["Selectors"])."\t";
               $ostr .=trim($row["Email"])."\t";
               $ostr .=trim($row["mobile"])."\t";
               $ostr .=trim($row["Phone"])."\t";
               $ostr .=trim($row["Comment"])."\n";
       fputs($fp,$ostr);
    }
    fclose($fp);

    $submit='main';
}

if($submit=="print" )
{ 
    $selectors='';                                                       
    if ($ixmas=='on' ) $selectors .= " and Selectors like '%christmas%'  ";
    if ($iholiday=='on' ) $selectors .= " and Selectors like '%holiday%'  ";
    if ($iviv=='on' ) $selectors .= " and Selectors like '%vivs%'  ";
    if ($ipaul=='on' ) $selectors .= " and Selectors like '%pauls%' " ;
    if ($ihand=='on' ) $selectors .= " and Selectors like '%hand%'  ";
    $query= "select * from  addresses where Lastname <>'' $selectors order by Selectors,Lastname,Firstname  ";
    $result=safe_query($query);
    echo $query;
   $pdf=new PDF();
   $pdf->SetFont('Arial','',14);
    $pdf->StartLabels(3,63,38)
    while ($row=mysql_fetch_array($result)) 
    { 
        $ostr=array();
        $ostr[0] .=trim($row["Firstname"])."".trim($row["Lastname"]);
        $ostr[1] .=trim($row["Street"])."\n";
        $ostr[2] .=trim($row["City"])."\n";
        $ostr[3] .=trim($row["County"])."\n";
        $ostr[4] .=trim($row["Country"])." ".trim($row["Postcode"];
        $pdf->AddLabel($ostr)
    }

$pdf->Output("/home/paul/Documents/labels.pdf");
    $submit='main';
}




if($submit=="delete" )
{ 
    $query= "delete from addresses where  id='".$addresslist[$current]."' ";
    $result=safe_query($query);
    $submit='refresh';
}

if($submit=="new" )
{ 
    $query= "insert into addresses (id) values ('newaddress') ";
  //  echo $query;
    $result=safe_query($query);
    $addresslist=array();
    $addresslist[0]='newaddress';
    $current=0;
    $submit='main';

}

if($submit=="refresh" or $submit=='')
{ 
    
   $query= "update addresses set id = concat(lastname,firstname)";
   $result=safe_query($query);
   $query= "delete from addresses where id is null or id='newaddress'";
   $result=safe_query($query);
   $addresslist=array();
   $query= "select id from addresses order by id";
   $result=safe_query($query);

    while($row=mysql_fetch_array($result))
    {  
        $id=$row[0];
        $addresslist[]=$id;
    }
    $_SESSION['addresslist']=$addresslist;
    $submit='main';
}


$_SESSION['current']=$current;

if($submit=="exit")
{ 
  print heading3(" Session ended ");
  print heading3(" close window ");
}


//====html deneration

if ($submit=="main")
{
  print '<form method=post action="address.php"> ';
   print start_table();
    if ($addresslist[$current]=='newaddress')  $ad=array();   
   else $ad=get_address($addresslist[$current]);
    
   $xmas=false;
   $holiday=false;
   $vivs=false;
   $pauls=false;
   $handdelivery=false;
   if(strpos($ad['selectors'],'christmas')>0) $xmas=true;
   if(strpos($ad['selectors'],'holiday')>0) $holiday=true;
   if(strpos($ad['selectors'],'pauls')>0) $pauls=true;
   if(strpos($ad['selectors'],'vivs')>0) $vivs=true;
   if(strpos($ad['selectors'],'hand')>0) $hand=true;

        print start_row();
     print start_cell(" colspan=3 "); 
     print make_select_list("selperson",$addresslist,$current);  
     print submit_field('submit','select'); 
    print end_cell();
     print cell( submit_field('submit','new')); 
     print cell( submit_field('submit','export')); 
       print cell( submit_field('submit','print')); 
    print end_row();
         print start_row();
      print cell("sname");
      print cell(make_field("text","isname",$ad["surname"]," size=30 ")," colspan=3 ");     
    print end_row();
     print start_row();
      print cell("pname");
      print cell(make_field("text","ipname",$ad["forename"])," colspan=3 ");     
    print end_row();
        print start_row();
      print cell("road");
      print cell(make_field("text","iroad",$ad["road"]," size=30 ")," colspan=3 ");     
    print end_row();
        print start_row();
      print cell("town");
      print cell(make_field("text","itown",$ad["town"])," colspan=3 ");     
    print end_row();
        print start_row();
      print cell("county");
      print cell(make_field("text","icounty",$ad["county"])," colspan=3 ");     
    print end_row();
      print start_row();
      print cell("postcode");
      print cell(make_field("text","ipostcode",$ad["postcode"]));     
      print cell("country");
      print cell(make_field("text","icountry",$ad["country"]));     
    print end_row();
          print cell("email");
      print cell(make_field("text","iemail",$ad["email"]," size=40 ")," colspan=3 ");     
    print end_row();
      print start_row();
      print cell("phone");
      print cell(make_field("text","iphone",$ad["phone"]));     
      print cell("mobile");
      print cell(make_field("text","imobile",$ad["mobile"]));     
    print end_row();
        print start_row();
      print cell("comment");
      print cell(make_textarea("icomment",$ad["comment"],3,40),"  colspan=3 ");     
    print end_row();
        print start_row();
      print start_cell(" colspan=4 ");
      print make_checkbox("ixmas","Christmas",$xmas);  
      print make_checkbox("iholiday","Holiday",$holiday);  
      print make_checkbox("ipaul","Paul",$pauls);  
      print make_checkbox("iviv","Viv",$vivs);  
      print make_checkbox("ihand","Hand Delivery",$hand);  
      print end_cell();
    print end_row();
      
     print start_row();
     print start_cell(" colspan=4 ");
           print submit_field('submit','previous'); 
     print submit_field('submit','refresh');  
     print submit_field('submit','update');  
     print submit_field('submit','delete');  
          print submit_field('submit','next'); 
     print end_cell();
    print end_row();
  print end_table();
  print '</form>';
  print page_footer();
}



function get_address($id="")
{
    $query ="select * from addresses where id = '$id' ";
    $result= safe_query($query);
    $row = mysql_fetch_array($result);
    if (sizeof($row)==0) return array();
    $a=array();
    $a["id"]=$row["id"];
    $a["surname"]=$row['Lastname'];
    $a["forename"]=$row['Firstname'];
    $a["road"]=$row['Street'];
    $a["town"]=$row['City'];
    $a["county"]=$row['County'];
    $a["postcode"]=$row['Postcode'];
    $a["country"]=$row['Country'];
    $a["email"]=$row['Email'];
    $a["phone"]=$row['Phone'];
    $a["mobile"]=$row['mobile'];
    $a["selectors"]=$row['Selectors'];
    $a["comment"]=$row['Comment'];
    return $a;
}



?>

