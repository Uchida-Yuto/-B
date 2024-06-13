<?php
$command="python style05.py";
exec($command,$output);
$f = "out.xlsx";

header("Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
header("Content-Length: " . filesize($f));
header("Content-Disposition: attachment; filename=output.xlsx");
readfile($f);
exit;

?>
