<?php
if(isset($_REQUEST["debug"])){
	header('Content-type: text/html charset=utf-8');
} else {
	header('Content-type: text/json charset=utf-8');
}
require_once("php-sru-search/SRUSearch.php");
$search = new SRUSearch();
$search->init("http://services.d-nb.de/sru/zdb","1.1","MARC21-xml");
if(isset($_REQUEST["start"])) $search->setStartRecord($_REQUEST["start"]);
if(isset($_REQUEST["maximum"])) $search->setMaximumRecords($_REQUEST["maximum"]);
if(isset($_REQUEST["num"])) $q = "num=".$_REQUEST["num"];
if(isset($_REQUEST["q"])) $q = $_REQUEST["q"];

$response = $search->searchRetrieve(urlencode($q));

$xslDoc = new DOMDocument();
$xslDoc->load("marcxml2xzdb.xsl");

$xmlDoc = new DOMDocument();
$xmlDoc->loadXML($response);

$proc = new XSLTProcessor();
$proc->importStylesheet($xslDoc);
$jsonString = $proc->transformToXML($xmlDoc);
if(isset($_REQUEST["debug"])){
	$jsonO = json_decode($jsonString,true);
	echo "<pre>".json_encode($jsonO, JSON_PRETTY_PRINT)."</pre>";
} else {
	echo $jsonString;	
}
?>