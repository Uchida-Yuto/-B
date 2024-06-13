<?php

$user = "probc2024";
$pass = "probc2024";
$dsn = "mysql:dbname={$user};host=localhost";
$now = new DateTime();
$nowstr = $now->format("Y-m-d H:i:s");
$np = "";

$my = new PDO($dsn, $user, $pass);
if($_POST["data"] == "fitem"){
  if(isset($_POST["p1"],$_POST["p2"],$_POST["p3"],$_POST["p4"],$_POST["p5"])){
    $tmp = $_FILES['fimg']['tmp_name'];
    $ext = "." . pathinfo($_FILES['fimg']['name'], PATHINFO_EXTENSION);
    $filename = date('Y-m-d_H-i-s', time()) . $ext;
    if(is_uploaded_file($tmp)){
      if(move_uploaded_file($tmp, "./imgdata/{$filename}")){
        $imgname = $filename;
      }else{
        $imgname=null;
      }
    }else{
      $imgname=null;
    }
    try{
        $my->beginTransaction();
        $sql = "INSERT INTO 拾得物 (拾得物分類ID,拾得場所,色,特徴,画像) VALUES (?,?,?,?,?);";
        $arr = array($_POST["p1"],$_POST["p2"],$_POST["p3"],$_POST["p4"],$imgname);
        $stmt = $my->prepare($sql);
        $stmt->execute($arr);
        $fid = $my->lastInsertId();
        $sql = "INSERT INTO 拾得物管理状況 (ユーザID,拾得物ID,変更内容,変更日時) VALUES (?,?,?,?);";
        $arr = array($_POST["p5"],$fid,"拾得",$nowstr);
        $stmt = $my->prepare($sql);
        $stmt->execute($arr);
        $my->commit();
    }catch(Exception $e){
        $my->rollBack();
    }
    $np = "v_fitem_reg.php";
  }
}else if($_POST["data"] == "fitem_st"){
  if(isset($_POST["p1"],$_POST["p2"],$_POST["p3"])){
    $sql = "INSERT INTO 拾得物管理状況 (ユーザID,拾得物ID,変更内容,変更日時) VALUES (?,?,?,?);";
    $arr = array($_POST["p1"],$_POST["p2"],$_POST["p3"],$nowstr);
    $stmt = $my->prepare($sql);
    $stmt->execute($arr);
    $np = "v_fitem_detail.php?id={$_POST["p2"]}";
  }
}else if($_POST["data"] == "user"){
  if(isset($_POST["p1"],$_POST["p2"],$_POST["p3"],$_POST["p4"])){
    $sql = "INSERT INTO ユーザ (氏名,所属ID,電話番号,メールアドレス) VALUES (?,?,?,?);";
    $arr = array($_POST["p1"],$_POST["p2"],$_POST["p3"],$_POST["p4"]);
    $stmt = $my->prepare($sql);
    $stmt->execute($arr);
    $np = "v_fuser_reg.php";
  }
}else if($_POST["data"] == "litem"){
  if(isset($_POST["p1"],$_POST["p2"],$_POST["p3"],$_POST["p4"],$_POST["p5"])){
    $sql = "INSERT INTO 遺失物 (遺失物分類ID,拾得場所,色,特徴,ユーザID) VALUES (?,?,?,?,?);";
    $arr = array($_POST["p1"],$_POST["p2"],$_POST["p3"],$_POST["p4"],$_POST["p5"]);
    $stmt = $my->prepare($sql);
    $stmt->execute($arr);
  }
}
header("location:{$np}");

?>
