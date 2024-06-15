<!doctype html>
<html lang="ja">
<head>
    <?php include("meta.htm"); ?>
    <title>拾得物管理システム</title>
</head>

<body>
  <?php include("header.htm"); ?>

  <div class="container">
    <div class="row mt-3 mb-1">
      <div class="col"><p class="h2 p-1 bg-success w-50 rounded text-center text-white">拾得者（ユーザ）登録</p></div>
    </div>
    <div class="row">
        <div class="col">
            <p class="bg-light p-1 border m-0">拾得者（ユーザ）登録画面では、本システムを利用するにあたってのユーザ登録を行います。必要な情報を入力してください。拾得者（ユーザ）登録は拾得物登録機能の利用前に必要となります。</p>
            <hr>
      </div>
    </div>

    <div class="row">
        <div class="col mt-1">
        <form class="needs-validation" novalidate method="post" action="c_insert.php">
<table>
<tr><td>氏名</td><td><input type="text" required class="form-control" name="p1"></td></tr>
<tr><td>所属</td><td><select class="belongs" name="p2"></select></td></tr>
<tr><td>電話番号</td><td><input type="text" required class="form-control" name="p3"></td></tr>
<tr><td>メールアドレス</td><td><input type="text" required class="form-control"
name="p4"></td></tr>
</table>
<button class="btn btn-success" id="btn">登録</button>
<input type="hidden" name="data" value="user">
</form>
        </div>
    </div>

  </div>

  <?php include("footer.htm"); ?>
  <script src="main.js"></script>
  <!-- c_json.phpはサーバーサイドで動作するため、ここでは読み込まない -->
</body>
</html>
