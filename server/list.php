<?php

$path = getcwd().'/packages/';

$packages = scandir($path);

//filter hidden files
$packages = array_filter( $packages, function($v){
  return $v[0] != '.';
});

//re-index array
$packages = array_values($packages);

echo json_encode($packages);
